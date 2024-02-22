import torch.nn as nn
import math
import torch
from .quantize import QConv2d, QLinear, RangeBN

def init_model(model):
    for m in model.modules():
        if isinstance(m, QConv2d):
            n = m.kernel_size[0] * m.kernel_size[1] * m.out_channels
            m.weight.data.normal_(0, math.sqrt(2. / n))
        elif isinstance(m, RangeBN):
            m.weight.data.fill_(1)
            m.bias.data.zero_()
    for m in model.modules():
        if isinstance(m, Bottleneck):
            nn.init.constant_(m.bn3.weight, 0)
        elif isinstance(m, BasicBlock):
            nn.init.constant_(m.bn2.weight, 0)

    model.fc.weight.data.normal_(0, 0.01)
    model.fc.bias.data.zero_()



class BasicBlock(nn.Module):
    expansion = 1

    def __init__(self, inplanes, planes, stride=1, downsample=None):
        super(BasicBlock, self).__init__()
# QConv2d(in_planes, out_planes, kernel_size=3, stride=stride,
#             padding=1, bias=False, num_bits=NUM_BITS, num_bits_weight=NUM_BITS_WEIGHT, num_bits_grad=NUM_BITS_GRAD, biprecision=BIPRECISION)

        self.conv1 = QConv2d(inplanes, planes, kernel_size=3, stride=stride,padding=1,bias=False)
        self.bn1 = RangeBN(planes)
        # self.relu = nn.ReLU(inplace=False)
        self.relu = nn.ReLU()
        self.conv2 = QConv2d(planes, planes, kernel_size=3, stride=1,padding=1,bias=False)
        self.bn2 = RangeBN(planes)
        self.downsample = downsample
        self.stride = stride
        self.add_relu = torch.nn.quantized.FloatFunctional()

    def forward(self, x):
        residual = x

        out = self.conv1(x)
        out = self.bn1(out)
        out = self.relu(out)

        out = self.conv2(out)
        out = self.bn2(out)

        if self.downsample is not None:
            residual = self.downsample(x)

        out = self.add_relu.add_relu(out,residual)
        # out = self.relu(out)

        return out

class Bottleneck(nn.Module):
    expansion = 4

    def __init__(self, inplanes, planes, stride=1, downsample=None):
        super(Bottleneck, self).__init__()
        self.conv1 = QConv2d(inplanes, planes, kernel_size=1, bias=False)
        self.bn1 = RangeBN(planes)
        self.conv2 = QConv2d(planes, planes, kernel_size=3, stride=stride,
                             padding=1, bias=False)
        self.bn2 = RangeBN(planes)
        self.conv3 = QConv2d(planes, planes * 4, kernel_size=1, bias=False)
        self.bn3 = RangeBN(planes * 4)
        # self.relu = nn.ReLU(inplace=True)
        self.relu = nn.ReLU(inplace=False)
        self.downsample = downsample
        self.stride = stride
        self.skip_add_relu = nn.quantized.FloatFunctional()

    def forward(self, x):
        residual = x

        out = self.conv1(x)
        out = self.bn1(out)
        out = self.relu(out)

        out = self.conv2(out)
        out = self.bn2(out)
        out = self.relu(out)

        out = self.conv3(out)
        out = self.bn3(out)

        if self.downsample is not None:
            residual = self.downsample(x)

        out = self.skip_add_relu.add_relu(out, residual)
        # out = self.relu(out)

        return out
    

class ResNet(nn.Module):

    def __init__(self):
        super(ResNet, self).__init__()
        # Uncomment below if passing unquantised input
        # self.quant = torch.ao.quantization.QuantStub()
        # self.dequant = torch.ao.quantization.DeQuantStub()

    def _make_layer(self, block, planes, blocks, stride=1):
        downsample = None
        if stride != 1 or self.inplanes != planes * block.expansion:
            downsample = nn.Sequential(
                QConv2d(self.inplanes, planes * block.expansion,
                        kernel_size=1, stride=stride, bias=False),
                RangeBN(planes * block.expansion)
            )

        layers = []
        layers.append(block(self.inplanes, planes, stride, downsample))
        self.inplanes = planes * block.expansion
        for i in range(1, blocks):
            layers.append(block(self.inplanes, planes))

        return nn.Sequential(*layers)

    def forward(self, x):
        # x = self.quant(x)
        x = self.conv1(x)
        x = self.bn1(x)
        x = self.relu(x)
        x = self.maxpool(x)

        x = self.layer1(x)
        x = self.layer2(x)
        x = self.layer3(x)
        x = self.layer4(x)

        x = self.avgpool(x)
        # x = x.view(x.size(0), -1)
        x = torch.flatten(x, 1)
        x = self.fc(x)
        # x = self.dequant(x)
        return x

    @staticmethod
    def regularization(model, weight_decay=1e-4):
        l2_params = 0
        for m in model.modules():
            if isinstance(m, nn.Conv2d) or isinstance(m, nn.Linear):
                l2_params += m.weight.pow(2).sum()
                if m.bias is not None:
                    l2_params += m.bias.pow(2).sum()
        return weight_decay * 0.5 * l2_params


class ResNet_cifar10(ResNet):

    def __init__(self, num_classes=10,
                 block=BasicBlock, depth=18):
        super(ResNet_cifar10, self).__init__()
        self.inplanes = 16
        n = int((depth - 2) / 6)
        self.conv1 = QConv2d(3, 16, kernel_size=3, stride=1, padding=1)
        self.bn1 = RangeBN(16)
        # self.relu = nn.ReLU(inplace=True)
        self.relu = nn.ReLU()
        self.maxpool = lambda x: x
        self.layer1 = self._make_layer(block, 16, n)
        self.layer2 = self._make_layer(block, 32, n, stride=2)
        self.layer3 = self._make_layer(block, 64, n, stride=2)
        self.layer4 = lambda x: x
        self.avgpool = nn.AvgPool2d(8)
        self.fc = QLinear(64, num_classes)

        init_model(self)
        self.regime = [
            {'epoch': 0, 'optimizer': 'SGD', 'lr': 1e-1,
             'weight_decay': 1e-4, 'momentum': 0.9},
            {'epoch': 81, 'lr': 1e-2},
            {'epoch': 122, 'lr': 1e-3, 'weight_decay': 0},
            {'epoch': 164, 'lr': 1e-4}
        ]
