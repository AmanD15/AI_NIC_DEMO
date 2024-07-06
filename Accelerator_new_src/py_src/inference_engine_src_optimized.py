import argparse
import python2llvm as llvm
from python2llvm import jit
from types_llvm import *
from pragmas import *
from pragmas import __loop_pipelining_on__
from functions import __bit_select__, __slice__, __concat__

parser = argparse.ArgumentParser()
parser.add_argument('-v', '--verbose', action='count', default=0)
args = parser.parse_args()
verbose = args.verbose

parser = argparse.ArgumentParser()
parser.add_argument('-v', '--verbose', action='count', default=0)
args = parser.parse_args()
verbose = args.verbose

@llvm.jit(verbose=True)
def fp32_mul_for_ecg(number1: float32, number2: float32) -> float32:
    return number1 * number2


@llvm.jit(verbose=True)
def fp32_add_for_ecg(number1: float32, number2: float32) -> float32:
    return number1 + number2


@llvm.jit(verbose=True)
def fp32_sub_for_ecg(number1: float32, number2: float32) -> float32:
    return number1 - number2

@llvm.jit(verbose=True)
def fpcmp32(number1: float32, number2: float32, flag: bool) -> uint2:
    if number1 == number2:
        val = 0
    elif number1 < number2:
        val = 1
    elif number1 > number2:
        val = 2
    else:
        val = 3
    return val 

@llvm.jit(verbose=True)
def fstoi_for_ecg(number1: float32) -> int32:
    return int(number1) 

@llvm.jit(verbose=True)
def fitos32_for_ecg(number1: uint32) -> float32:
    return float(number1) 

@llvm.jit(verbose=True)
def round_half_even(number: float32) -> uint8:
    integer_part_int = fstoi_for_ecg(number)
    integer_part = fitos32_for_ecg(integer_part_int)
    fractional_part = fp32_sub_for_ecg(number, integer_part)
    cmp_result = fpcmp32(fractional_part, 0.5, 1)
    if cmp_result == 1:
        rounded_integer = integer_part
    elif cmp_result == 2:
        rounded_integer = integer_part + 1
    elif integer_part_int % 2 == 0:
         rounded_integer = integer_part
    else:
        rounded_integer = integer_part + 1  
    return rounded_integer

@llvm.jit(verbose=True)
def uint_quant(val: float32, scale_inv: float32, zero_point: float32) -> uint8:
    out: float32 = fp32_add_for_ecg(fp32_mul_for_ecg(val, scale_inv), zero_point)
    if out > 255.0:
        out: float32 = 255.0
    if out < 0.0:
        out: float32 = 0.0
    round_out = round_half_even(out)
    return round_out

@llvm.jit(verbose=True)
def dequant_inp(val: uint8, scale: float32, zero_point: float32) -> float32:
    float_val = val
    out = fp32_mul_for_ecg(scale, fp32_sub_for_ecg(float_val, zero_point))
    return out

@llvm.jit(verbose=True)
def dequant_ker(val: int8, scale: float32, zero_point: float32) -> float32:
    float_val = val
    out = fp32_mul_for_ecg(scale, fp32_sub_for_ecg(float_val, zero_point))
    return out

@llvm.jit(verbose=True)
def relu(val: float32) -> float32:
    op: float32 = 0.0
    if val > 0:
        op =  val
    return op

@llvm.jit(verbose=True)
def readModule_convolution(base_address: uint32, addr: uint32) -> uint64:
    val: uint64 = 0
    return val

@llvm.jit(verbose=True)
def writeModule_convolution(base_address: uint32, addr: uint32, data: uint64, byte_mask: uint8):
    write_uint64('ker_data', data)

@llvm.jit(verbose=True)
def writeInpPipe(col:int32, inp_dequant_val:float32 ):
  if col == 0:
      write_float32('in_data_0', inp_dequant_val)
  elif col == 1:
      write_float32('in_data_1', inp_dequant_val)
  elif col == 2:
      write_float32('in_data_2', inp_dequant_val)
  elif col == 3:
      write_float32('in_data_3', inp_dequant_val)
  elif col == 4:
      write_float32('in_data_4', inp_dequant_val)


@llvm.jit(verbose=True)
def fetchAll(base_addr: uint32, groups: uint32, ker_size: int32,
              in_channels: int32,inp_scale: float32, inp_zero_point: float32):
  num_iterations_first = ((groups-1)*ker_size*ker_size)
  grp_no = 0
  col = 0
  row = 0
  for _ in range(num_iterations_first):
    __loop_pipelining_on__(31, 7, 1)
    addr = ((8*groups) * ker_size * row) + ((8*groups) * col) + grp_no * 8
    data = readModule_convolution(base_addr, addr)

    val = __slice__(data, 56, 63)
    inp_dequant_val = dequant_ker(val, inp_scale, inp_zero_point)
    writeInpPipe(col, inp_dequant_val)

    val = __slice__(data, 48, 55)
    inp_dequant_val = dequant_ker(val, inp_scale, inp_zero_point)
    writeInpPipe(col, inp_dequant_val)

    val = __slice__(data, 40, 47)
    inp_dequant_val = dequant_ker(val, inp_scale, inp_zero_point)
    writeInpPipe(col, inp_dequant_val)

    val = __slice__(data, 32, 39)
    inp_dequant_val = dequant_ker(val, inp_scale, inp_zero_point)
    writeInpPipe(col, inp_dequant_val)

    val = __slice__(data, 24, 31)
    inp_dequant_val = dequant_ker(val, inp_scale, inp_zero_point)
    writeInpPipe(col, inp_dequant_val)

    val = __slice__(data, 16, 23)
    inp_dequant_val = dequant_ker(val, inp_scale, inp_zero_point)
    writeInpPipe(col, inp_dequant_val)

    val = __slice__(data, 8, 15)
    inp_dequant_val = dequant_ker(val, inp_scale, inp_zero_point)
    writeInpPipe(col, inp_dequant_val)

    val = __slice__(data, 0, 7)
    inp_dequant_val = dequant_inp(val, inp_scale, inp_zero_point)
    writeInpPipe(col, inp_dequant_val)

    row = row + 1

    if row == ker_size:
      row = 0
      col = col + 1

    if col == ker_size:
      col = 0
      grp_no = grp_no + 1

  num_chn_left =  in_channels - (8 * (groups-1))
  num_iterations_left = ( ker_size * ker_size)
  grp_no = (groups-1)
  col = 0
  row = 0

  for _ in range(num_iterations_left):
    __loop_pipelining_on__(31, 7, 1)
    addr = ((8*groups) * ker_size * row) + ((8*groups) * col) + grp_no * 8
    data = readModule_convolution(base_addr, addr)

    for chn_no in range(num_chn_left):
      if chn_no == 0:
          val = __slice__(data, 56, 63)
      elif chn_no == 1:
          val = __slice__(data, 48, 55)
      elif chn_no == 2:
          val = __slice__(data, 40, 47)
      elif chn_no == 3:
          val = __slice__(data, 32, 39)
      elif chn_no == 4:
          val = __slice__(data, 24, 31)
      elif chn_no == 5:
          val = __slice__(data, 16, 23)
      elif chn_no == 6:
          val = __slice__(data, 8, 15)
      elif chn_no == 7:
          val = __slice__(data, 0, 7)

      inp_dequant_val = dequant_ker(val, inp_scale, inp_zero_point)

      # write_uint32('ker_data', ker_dequant_val)
      writeInpPipe(col, inp_dequant_val)
    row = row+1
    if row == ker_size:
      row = 0
      col = col + 1

@llvm.jit(verbose=True)
def fetchKernel(base_addr: uint32, groups: uint32, ker_size: int32,
                in_channels: int32,ker_scale: float32, ker_zero_point: float32):
  num_iterations_first = ((groups-1)*ker_size*ker_size)
  grp_no = 0
  col = 0
  row = 0
  for _ in range(num_iterations_first):
    __loop_pipelining_on__(31, 7, 1)
    addr = ((8*groups) * ker_size * row) + ((8*groups) * col) + grp_no * 8
    data = readModule_convolution(base_addr, addr)

    val = __slice__(data, 56, 63)
    ker_dequant_val = dequant_ker(val, ker_scale, ker_zero_point)
    write_float32('ker_data', ker_dequant_val)

    val = __slice__(data, 48, 55)
    ker_dequant_val = dequant_ker(val, ker_scale, ker_zero_point)
    write_float32('ker_data', ker_dequant_val)

    val = __slice__(data, 40, 47)
    ker_dequant_val = dequant_ker(val, ker_scale, ker_zero_point)
    write_float32('ker_data', ker_dequant_val)

    val = __slice__(data, 32, 39)
    ker_dequant_val = dequant_ker(val, ker_scale, ker_zero_point)
    write_float32('ker_data', ker_dequant_val)

    val = __slice__(data, 24, 31)
    ker_dequant_val = dequant_ker(val, ker_scale, ker_zero_point)
    write_float32('ker_data', ker_dequant_val)

    val = __slice__(data, 16, 23)
    ker_dequant_val = dequant_ker(val, ker_scale, ker_zero_point)
    write_float32('ker_data', ker_dequant_val)

    val = __slice__(data, 8, 15)
    ker_dequant_val = dequant_ker(val, ker_scale, ker_zero_point)
    write_float32('ker_data', ker_dequant_val)

    val = __slice__(data, 0, 7)
    ker_dequant_val = dequant_ker(val, ker_scale, ker_zero_point)
    write_float32('ker_data', ker_dequant_val)

    row = row + 1

    if row == ker_size:
      row = 0
      col = col + 1

    if col == ker_size:
      col = 0
      grp_no = grp_no + 1

  num_chn_left =  in_channels - (8 * (groups-1))
  num_iterations_left = ( ker_size * ker_size)
  grp_no = (groups-1)
  col = 0
  row = 0
  for _ in range(num_iterations_left):
    __loop_pipelining_on__(31, 7, 1)
    addr = ((8*groups) * ker_size * row) + ((8*groups) * col) + grp_no * 8
    data = readModule_convolution(base_addr, addr)

    for chn_no in range(num_chn_left):
      if chn_no == 0:
          val = __slice__(data, 56, 63)
      elif chn_no == 1:
          val = __slice__(data, 48, 55)
      elif chn_no == 2:
          val = __slice__(data, 40, 47)
      elif chn_no == 3:
          val = __slice__(data, 32, 39)
      elif chn_no == 4:
          val = __slice__(data, 24, 31)
      elif chn_no == 5:
          val = __slice__(data, 16, 23)
      elif chn_no == 6:
          val = __slice__(data, 8, 15)
      elif chn_no == 7:
          val = __slice__(data, 0, 7)

      ker_dequant_val = dequant_ker(val, ker_scale, ker_zero_point)

      write_float32('ker_data', ker_dequant_val)
    row = row+1
    if row == ker_size:
      row = 0
      col = col + 1

@llvm.jit(verbose=True)
def writeInpPipePartial(data:uint64,num_chn_present:uint32,
                        cur_stride_movement:uint8,inp_scale:float32,inp_zero_point:float32):
  for chn_no in range(num_chn_present):
    __loop_pipelining_on__(31, 7, 1)
    if chn_no == 0:
        val = __slice__(data, 56, 63)
    elif chn_no == 1:
        val = __slice__(data, 48, 55)
    elif chn_no == 2:
        val = __slice__(data, 40, 47)
    elif chn_no == 3:
        val = __slice__(data, 32, 39)
    elif chn_no == 4:
        val = __slice__(data, 24, 31)
    elif chn_no == 5:
        val = __slice__(data, 16, 23)
    elif chn_no == 6:
        val = __slice__(data, 8, 15)
    elif chn_no == 7:
        val = __slice__(data, 0, 7)

    inp_dequant_val = dequant_inp(val, inp_scale, inp_zero_point)

    if cur_stride_movement == 1:
      write_float32('in_data_4', inp_dequant_val)
    elif cur_stride_movement == 2:
      write_float32('in_data_0', inp_dequant_val)
    # else:
    #   write_float32('hor_slice_pipe', inp_dequant_val)

@llvm.jit(verbose=True)
def fetchHorSlice(base_addr:uint32,ker_size:uint32, in_channels:uint32, groups:uint32,col:uint32,rowStartInd:uint32,in_cols:uint32,
                  inp_scale:float32,inp_zero_point:float32):
  cur_col = col
  num_iterations = (ker_size*groups)
  grp_no = 0
  for _ in range(num_iterations):

    addr = ((8*groups) * in_cols * (rowStartInd+ker_size-1)) + ((8*groups) * (cur_col)) + grp_no * 8
    data = readModule_convolution(base_addr, addr)

    num_chn_present = 0
    if in_channels >= 8 * (grp_no + 1):
        num_chn_present = 8
    else:
        num_chn_present = in_channels - 8 * grp_no

    for chn_no in range(num_chn_present):
      __loop_pipelining_on__(31, 7, 1)
      if chn_no == 0:
          val = __slice__(data, 56, 63)
      elif chn_no == 1:
          val = __slice__(data, 48, 55)
      elif chn_no == 2:
          val = __slice__(data, 40, 47)
      elif chn_no == 3:
          val = __slice__(data, 32, 39)
      elif chn_no == 4:
          val = __slice__(data, 24, 31)
      elif chn_no == 5:
          val = __slice__(data, 16, 23)
      elif chn_no == 6:
          val = __slice__(data, 8, 15)
      elif chn_no == 7:
          val = __slice__(data, 0, 7)

      inp_dequant_val = dequant_inp(val, inp_scale, inp_zero_point)
      write_float32('hor_slice_pipe', inp_dequant_val)

    grp_no = grp_no+1
    if grp_no == groups:
      grp_no = 0
      cur_col = cur_col + 1

@llvm.jit(verbose=True)
def fetchPartial(base_addr:uint32,ker_size:uint32, in_channels:uint32, groups:uint32, in_rows:uint32,in_cols:uint32,
                 out_rows:uint32,out_cols:uint32,inp_scale:uint32,inp_zero_point:uint32):
  cur_stride_movement = 1
  next_stride_movement = 0
  grp_no = 0
  row = 0
  col:int32 = ker_size
  num_iterations = ((out_rows-1) * (out_cols)) * groups*ker_size
  rowStartInd = 0
  colStartInd = 0

  for _ in range(num_iterations):
    addr = ((8*groups) * in_cols * (rowStartInd+row)) + ((8*groups) * (col)) + grp_no * 8
    data = readModule_convolution(base_addr, addr)

    num_chn_present = 0
    if in_channels >= 8 * (grp_no + 1):
        num_chn_present = 8
    else:
        num_chn_present = in_channels - 8 * grp_no
    writeInpPipePartial(data,num_chn_present,cur_stride_movement,inp_scale,inp_zero_point)

    row = row+1
    if cur_stride_movement == 1:
      if row == ker_size:
        row = 0
        grp_no = grp_no+1
      if grp_no == groups:
        grp_no = 0
        col = col + 1
      if col == (in_cols):
        rowStartInd  = rowStartInd +1
        col = col - ker_size-1
        cur_stride_movement = 2
        next_stride_movement = 0
        if rowStartInd<out_rows:
          fetchHorSlice(base_addr,ker_size, in_channels, groups,col+1,
                        rowStartInd,in_cols,inp_scale,inp_zero_point)
          start_fetch = read_uint8('fetch_start')

    elif cur_stride_movement == 2:
      if row == ker_size:
        row = 0
        grp_no = grp_no+1
      if grp_no == groups:
        grp_no = 0
        col = col - 1
      if (col+1) == 0:
        rowStartInd  = rowStartInd +1
        col = col + ker_size+1
        cur_stride_movement = 1
        next_stride_movement = 0
        if rowStartInd<out_rows:
          fetchHorSlice(base_addr,ker_size, in_channels, groups,0,
                        rowStartInd,in_cols,inp_scale,inp_zero_point)
          start_fetch = read_uint8('fetch_start')

@llvm.jit(verbose=True)
def loadForward(num_chn_present: int32,ker_size: int32):
  row = 0
  col = 0
  cur_chn_no = 0
  for _ in range(ker_size*ker_size*num_chn_present):
    __loop_pipelining_on__(31, 7, 1)
    if col == 0:
      inp_val = read_float32('in_data_0')
      write_float32('conv_input_data', inp_val)
    elif col == 1:
      inp_val = read_float32('in_data_1')
      write_float32('conv_input_data', inp_val)
      write_float32('in_data_0', inp_val)
    elif col == 2:
      inp_val = read_float32('in_data_2')
      write_float32('conv_input_data', inp_val)
      write_float32('in_data_1', inp_val)
    elif col == 3:
      inp_val = read_float32('in_data_3')
      write_float32('conv_input_data', inp_val)
      write_float32('in_data_2', inp_val)
    elif col == 4:
      inp_val = read_float32('in_data_4')
      write_float32('conv_input_data', inp_val)
      write_float32('in_data_3', inp_val)

    cur_chn_no = cur_chn_no + 1
    if cur_chn_no == num_chn_present:
      cur_chn_no = 0
      row = row + 1
    if row == ker_size:
      col = col+1
      row = 0

@llvm.jit(verbose=True)
def loadBackward(num_chn_present: int32,ker_size: int32):
  row = 0
  col = 0
  cur_chn_no = 0
  for _ in range(ker_size*ker_size*num_chn_present):
    __loop_pipelining_on__(31, 7, 1)
    if col == 0:
      inp_val = read_float32('in_data_0')
      write_float32('conv_input_data', inp_val)
      write_float32('in_data_1', inp_val)
    elif col == 1:
      inp_val = read_float32('in_data_1')
      write_float32('conv_input_data', inp_val)
      write_float32('in_data_2', inp_val)
    elif col == 2:
      inp_val = read_float32('in_data_2')
      write_float32('conv_input_data', inp_val)
      write_float32('in_data_3', inp_val)
    elif col == 3:
      inp_val = read_float32('in_data_3')
      write_float32('conv_input_data', inp_val)
      write_float32('in_data_4', inp_val)
    elif col == 4:
      inp_val = read_float32('in_data_4')
      write_float32('conv_input_data', inp_val)
    cur_chn_no = cur_chn_no + 1
    if cur_chn_no == num_chn_present:
      cur_chn_no = 0
      row = row + 1
    if row == ker_size:
      col = col+1
      row = 0


@llvm.jit(verbose=True)
def loadNeutral(num_chn_present: int32, ker_size: int32):
  row = 0
  col = 0
  cur_chn_no = 0
  for _ in range(ker_size*ker_size*num_chn_present):
    __loop_pipelining_on__(31, 7, 1)
    if col == 0:
      inp_val = read_float32('in_data_0')
      write_float32('conv_input_data', inp_val)
      if row > 0:
        write_float32('in_data_0', inp_val)

    elif col == 1:
      inp_val = read_float32('in_data_1')
      write_float32('conv_input_data', inp_val)
      if row > 0:
        write_float32('in_data_1', inp_val)

    elif col == 2:
      inp_val = read_float32('in_data_2')
      write_float32('conv_input_data', inp_val)
      if row > 0:
        write_float32('in_data_2', inp_val)

    elif col == 3:
      inp_val = read_float32('in_data_3')
      write_float32('conv_input_data', inp_val)
      if row > 0:
        write_float32('in_data_3', inp_val)

    elif col == 4:
      inp_val = read_float32('in_data_4')
      write_float32('conv_input_data', inp_val)
      if row > 0:
        write_float32('in_data_4', inp_val)

    cur_chn_no = cur_chn_no + 1
    if cur_chn_no == num_chn_present:
      cur_chn_no = 0
      row = row + 1
    if row == ker_size:
      col = col+1
      row = 0

  col = 0
  cur_chn_no = 0
  for _ in range(ker_size*num_chn_present):
    __loop_pipelining_on__(31, 7, 1)
    inp_val = read_float32('hor_slice_pipe')
    if col == 0:
      write_float32('in_data_0', inp_val)

    elif col == 1:
      write_float32('in_data_1', inp_val)

    elif col == 2:
      write_float32('in_data_2', inp_val)

    elif col == 3:
      write_float32('in_data_3', inp_val)

    elif col == 4:
      write_float32('in_data_4', inp_val)

    cur_chn_no = cur_chn_no + 1
    if cur_chn_no == num_chn_present:
      cur_chn_no = 0
      col = col + 1


@llvm.jit(verbose=True)
def loadNeutralLast(num_chn_present:int32, ker_size:int32):
  row = 0
  col = 0
  cur_chn_no = 0
  for _ in range(ker_size*ker_size*num_chn_present):
    __loop_pipelining_on__(31, 7, 1)
    if col == 0:
      inp_val = read_float32('in_data_0')
      write_float32('conv_input_data', inp_val)

    elif col == 1:
      inp_val = read_float32('in_data_1')
      write_float32('conv_input_data', inp_val)

    elif col == 2:
      inp_val = read_float32('in_data_2')
      write_float32('conv_input_data', inp_val)

    elif col == 3:
      inp_val = read_float32('in_data_3')
      write_float32('conv_input_data', inp_val)

    elif col == 4:
      inp_val = read_float32('in_data_4')
      write_float32('conv_input_data', inp_val)

    cur_chn_no = cur_chn_no + 1
    if cur_chn_no == num_chn_present:
      cur_chn_no = 0
      row = row + 1
    if row == ker_size:
      col = col+1
      row = 0


@llvm.jit(verbose=True)
def inputLoader(ker_size: int32, in_channels: int32, groups: int32,
                out_rows: int32,out_cols: int32):
  cur_stride_movement = 1
  next_stride_movement = 0
  grp_no = 0
  col = 0
  num_iterations = (out_rows*out_cols*groups)
  counter = 0
  lastGroup = False
  for _ in range(num_iterations):
    counter += 1
    num_chn_present = 0
    if in_channels >= 8 * (grp_no + 1):
        num_chn_present = 8
    else:
        num_chn_present = in_channels - 8 * grp_no

    if cur_stride_movement == 1:
      loadForward(num_chn_present,ker_size)

    elif cur_stride_movement == 2:
      loadBackward(num_chn_present,ker_size)
    else:
      if lastGroup:
        loadNeutralLast(num_chn_present,ker_size)
      else:
        loadNeutral(num_chn_present,ker_size)

    grp_no = grp_no + 1
    if grp_no == groups:
      grp_no = 0
      col = col + 1
    if col == (out_cols-1):
      if cur_stride_movement == 1:
        next_stride_movement = 2
      elif cur_stride_movement == 2:
        next_stride_movement = 1
      cur_stride_movement = 0

    elif col == (out_cols):
      col = 0
      cur_stride_movement = next_stride_movement
      next_stride_movement = 0
      write_uint8('fetch_start', 1)
    if counter == num_iterations-1:
      lastGroup = True

# num iterattions is out rows * out cols
@llvm.jit(verbose=True)
def kernelLoader(num_iterations: int32,stopCond:int32):
  # num_iterations = (ker_size*ker_size*in_channels)
  counter = 0
  lastGroup = False
  for _ in range(num_iterations):
    __loop_pipelining_on__(31, 7, 1)
    counter = counter + 1
    ker_val_new = read_float32('ker_data')
    if not lastGroup:
      write_float32('ker_data', ker_val_new)
    write_float32('conv_ker_data', ker_val_new)
    if counter == (num_iterations-stopCond):
      lastGroup = True
    # ker_val_new = read_float32('conv_ker_data')

@llvm.jit(verbose=True)
def fetchInputLinear(base_addr: uint32, groups: uint32, in_channels: int32, inp_scale: float32, inp_zero_point: float32):
    for grp_no in range(groups):
        data = readModule_convolution(base_addr, 8 * grp_no)
        num_chn_present = 0
        if in_channels >= 8 * (grp_no + 1):
            num_chn_present = 8
        else:
            num_chn_present = in_channels - 8 * grp_no

        for chn_no in range(num_chn_present):

            if chn_no == 0:
                val = __slice__(data, 56, 63)
            elif chn_no == 1:
                val = __slice__(data, 48, 55)
            elif chn_no == 2:
                val = __slice__(data, 40, 47)
            elif chn_no == 3:
                val = __slice__(data, 32, 39)
            elif chn_no == 4:
                val = __slice__(data, 24, 31)
            elif chn_no == 5:
                val = __slice__(data, 16, 23)
            elif chn_no == 6:
                val = __slice__(data, 8, 15)
            elif chn_no == 7:
                val = __slice__(data, 0, 7)

            inp_dequant_val = dequant_inp(val, inp_scale, inp_zero_point)

            write_uint32('in_data_0', inp_dequant_val)


@llvm.jit(verbose=True)
def fetchKernelLinear(base_addr: uint32,  groups: uint32, chn_no: uint32,in_channels: int32,ker_scale: float32, ker_zero_point: float32):
    for grp_no in range(groups):
        data = readModule_convolution(base_addr, (8 * grp_no) + (groups * chn_no * 8))

        num_chn_present = 0
        if in_channels >= 8 * (grp_no + 1):
            num_chn_present = 8
        else:
            num_chn_present = in_channels - 8 * grp_no

        for chn in range(num_chn_present):

            if chn == 0:
                val = __slice__(data, 56, 63)
            elif chn == 1:
                val = __slice__(data, 48, 55)
            elif chn == 2:
                val = __slice__(data, 40, 47)
            elif chn == 3:
                val = __slice__(data, 32, 39)
            elif chn == 4:
                val = __slice__(data, 24, 31)
            elif chn == 5:
                val = __slice__(data, 16, 23)
            elif chn == 6:
                val = __slice__(data, 8, 15)
            elif chn == 7:
                val = __slice__(data, 0, 7)

            ker_dequant_val = dequant_ker(val, ker_scale, ker_zero_point)

            write_uint32('conv_ker_data', ker_dequant_val)

@llvm.jit(verbose=True)
def inputLoaderLinear(num_iterations: int32,stopCond:int32):
  # num_iterations = (ker_size*ker_size*in_channels)
  counter = 0
  lastGroup = False
  for _ in range(num_iterations):
    __loop_pipelining_on__(31, 7, 1)
    counter = counter + 1
    inp_val_new = read_float32('in_data_0')
    if not lastGroup:
      write_float32('in_data_0', inp_val_new)
    write_float32('conv_input_data', inp_val_new)
    if counter == num_iterations-stopCond:
      lastGroup = True
    # ker_val_new = read_float32('conv_ker_data')

@llvm.jit(verbose=True)
def kernelLoaderLinear(ker_start_addr:uint32, groups:uint32, in_channels:uint32,out_channels:uint32,
                       ker_scale:float32, ker_zero_point:float32):
  for chn_no in range(out_channels):
    fetchKernelLinear(ker_start_addr, groups, chn_no, in_channels, ker_scale, ker_zero_point)

@llvm.jit(verbose=True)
def pooling(pool_cols: int32):
    for i in range(pool_cols):
        r0_val0 = read_uint8('pool_data_fifo_r0')
        r0_val1 = read_uint8('pool_data_fifo_r0')
        r1_val0 = read_uint8('pool_data_lifo_r1')
        r1_val1 = read_uint8('pool_data_lifo_r1')
        if r0_val0 >= r0_val1 and r0_val0 >= r1_val0 and (r0_val0 >= r1_val1):
            maxPoolVal = r0_val0
        elif r0_val1 >= r0_val0 and r0_val1 >= r1_val0 and (r0_val1 >= r1_val1):
            maxPoolVal = r0_val1
        elif r1_val0 >= r0_val0 and r1_val0 >= r0_val1 and (r1_val0 >= r1_val1):
            maxPoolVal = r1_val0
        else:
            maxPoolVal = r1_val1
        write_uint8('pool_out_data', maxPoolVal)

@llvm.jit(verbose=True)
def output_module(out_start_addr:uint32,conv_scale:float32, conv_zero_point:float32,offsetStart:uint32,
                  pool_cols:uint32,isLinear: bool,isFlatten: bool,isActivation: bool,
                  out_rows:uint32,out_cols:uint32,out_channels:uint32,out_grp_no:uint32,out_chn_ind:uint32):
  if isLinear:
    linearOutShift = 8
    linearOutOffset = offsetStart
    for chn_no in range(out_channels):
      out_data = read_float32('conv_out_data')
      
      if isActivation:
        out_data = relu(out_data)
      convOut_quant = uint_quant(out_data, conv_scale, conv_zero_point)
      write_data_linear:uint64 = (convOut_quant << (8 * (linearOutShift - 1)))
      byte_mask_linear = (1<<(linearOutShift - 1))
      writeModule_convolution(out_start_addr, linearOutOffset, write_data_linear, byte_mask_linear)
      linearOutShift = linearOutShift - 1
      if linearOutShift == 0:
          linearOutShift = 8
          linearOutOffset = linearOutOffset + 8
  else:
    col_no = 0
    row_no = 0
    counter = 1
    poolColIndex = 0
    poolRowIndex = 0
    linearOutShift = 8
    linearOutOffset = offsetStart
    for _ in range(out_rows*out_cols):
      out_data = read_float32('conv_out_data')
      
      if isActivation:
        out_data = relu(out_data)
      convOut_quant = uint_quant(out_data, conv_scale, conv_zero_point)
      if row_no % 2 == 0:
          write_uint8('pool_data_fifo_r0', convOut_quant)
      else:
          write_uint8('pool_data_lifo_r1', convOut_quant)

      if counter == (2*out_cols):
        pooling(pool_cols)

        for _ in range(pool_cols):
          conv_out = read_uint8('pool_out_data')
          if isFlatten:
            write_data_flat:uint64 = (conv_out << (8 * (linearOutShift - 1)))
            byte_mask_flat = (1<<(linearOutShift - 1))
            writeModule_convolution(out_start_addr, linearOutOffset, write_data_flat, byte_mask_flat)
            linearOutShift = linearOutShift - 1
            if linearOutShift == 0:
                linearOutShift = 8
                linearOutOffset = linearOutOffset + 8
          else:
            addr = out_channels * pool_cols * poolRowIndex + out_channels * poolColIndex + 8 * out_grp_no
            byte_mask = (1<<(7 - out_chn_ind))
            write_data:uint64 = (conv_out << (8 * (7 - out_chn_ind)))
            writeModule_convolution(out_start_addr, addr, write_data, byte_mask)
          # write_uint8('pool_data_fifo_r0', out)
          poolColIndex = poolColIndex + 1
          if poolColIndex == pool_cols:
            poolColIndex = 0
            poolRowIndex = poolRowIndex + 1
      counter  = counter + 1
      col_no = col_no + 1
      if col_no == out_cols:
        col_no = 0
        row_no = row_no+1

  # write_uint8('out_data', convOut_quant)
  # write_float32('out_data', out_data)

@llvm.jit(verbose=True)
def compute_mul(ker_size: int32, num_chn_present: int32, num_iterations: int32):
    iteration: int32 = 0
    total_count: int32 = 0
    while(total_count < num_iterations):
        __loop_pipelining_on__(31, 7, 1)
        inp_val_new = read_float32('conv_input_data')
        ker_val_new = read_float32('conv_ker_data')
        
        dot_product = fp32_mul_for_ecg(inp_val_new, ker_val_new)
        write_float32('accumulator_pipe_even', dot_product)
        # print("even_product", dot_product, "iteration", iteration)
        iteration = iteration + 1
        total_count = total_count + 1
        if (iteration < ker_size * ker_size * num_chn_present):
            inp_val_new = read_float32('conv_input_data')
            ker_val_new = read_float32('conv_ker_data')
            dot_product = fp32_mul_for_ecg(inp_val_new, ker_val_new)
            write_float32('accumulator_pipe_odd', dot_product)
            # print("odd_product", dot_product, "iteration", iteration)
            iteration = iteration + 1
            total_count = total_count + 1
        else:
            iteration = 0
        if (iteration == ker_size * ker_size * num_chn_present):
            iteration = 0

@llvm.jit(verbose=True)
def compute_accumulate(ker_size: int32, num_chn_present: int32, num_iterations: int32):
    convOutVal: float32 = 0.0
    iteration: int32 = 0
    depth: int32 = ker_size * ker_size * num_chn_present
    total_count: int32 = 0
    while(total_count < num_iterations):
        __loop_pipelining_on__(31, 7, 1)
        val_even: float32 = read_float32('accumulator_pipe_even')
        iteration = iteration + 1
        total_count = total_count + 1
        if (iteration < depth):
            val_odd: float32 = read_float32('accumulator_pipe_odd')
            iteration = iteration + 1
            total_count = total_count + 1
        else:
            val_odd: float32 = 0.0
            iteration = 0
        
        convOutVal: float32 = fp32_add_for_ecg(convOutVal, fp32_add_for_ecg(val_even, val_odd))
        
        if (iteration == 0 or iteration == depth):
            write_float32('conv_out_data', convOutVal)
            convOutVal: float32 = 0.0
            iteration = 0

@llvm.jit(verbose=True)
def compute_mul_linear( num_iterations: int32):
  # counter = 0
  for counter in range(num_iterations):
    __loop_pipelining_on__(31, 7, 1)
    inp_val_new = read_float32('conv_input_data')
    ker_val_new = read_float32('conv_ker_data')
    
    dot_product = fp32_mul_for_ecg(inp_val_new, ker_val_new)
    if counter%2 == 0:
      write_float32('accumulator_pipe_even', dot_product)
    else:
      write_float32('accumulator_pipe_odd', dot_product)

@llvm.jit(verbose=True)
def compute_accumulate_linear(num_chn_present: int32, num_iterations: int32):
    convOutVal: float32 = 0.0
    iteration: int32 = 0
    toatl_count: int32 = 0
    while(iteration < num_iterations):
        __loop_pipelining_on__(31, 7, 1)
        val_even = read_float32('accumulator_pipe_even')
        val_odd = read_float32('accumulator_pipe_odd')
        iteration = iteration + 2
        convOutVal: float32 = fp32_add_for_ecg(convOutVal, fp32_add_for_ecg(val_even, val_odd))
        toatl_count = toatl_count + 2
        if (toatl_count == num_chn_present):
            write_float32('conv_out_data', convOutVal)
            toatl_count = 0
            convOutVal: float32 = 0.0  
      

@llvm.jit(verbose=True)
def convengine(in_start_addr: uint32, out_start_addr: uint32, ker_start_addr: uint32, out_grp_no: uint32, in_rows: int32, in_cols: int32, in_channels: int32, out_channels: uint32, groups: int32, ker_size: int32, pool_cols: int32, inp_scale: float32, inp_zero_point: float32, ker_scale: float32, ker_zero_point: float32, conv_scale: float32, conv_zero_point: float32, padReq: bool, poolReq: bool, isLinear: bool, isActivation: bool, isFlatten: bool, offsetStart:uint32, out_chn_ind: uint32):
    out_rows = in_rows - ker_size + 1
    out_cols = in_cols - ker_size + 1

    poolRowIndex: int32 = 0
    reuseInp: int32 = 1
    reuseData: bool = True
    flattenOutShift = 8
    flattenOutOffset = offsetStart
    if isLinear:
      fetchInputLinear(in_start_addr, groups,in_channels, inp_scale, inp_zero_point)
      num_iterations:int32 = (in_channels*out_channels)
      # Parallel Block Start
      inputLoaderLinear(num_iterations,in_channels)
      kernelLoaderLinear(ker_start_addr, groups, in_channels,out_channels,
                       ker_scale, ker_zero_point)
      compute_mul_linear( num_iterations)
      compute_accumulate_linear(in_channels, num_iterations)
      output_module(out_start_addr,conv_scale, conv_zero_point,offsetStart,
                  pool_cols,isLinear,isFlatten,isActivation,
                  out_rows,out_cols,out_channels,out_grp_no,out_chn_ind)
      # Parallel Block End
    else:
      fetchAll(in_start_addr, groups, ker_size, in_channels ,inp_scale , inp_zero_point )
      fetchKernel(ker_start_addr, groups, ker_size,
                in_channels,ker_scale, ker_zero_point)
      num_iterations:int32 = (out_rows*out_cols*ker_size*ker_size*in_channels)
      # Parallel Block Start
      fetchPartial(in_start_addr,ker_size, in_channels, groups, in_rows,in_cols,
                 out_rows,out_cols,inp_scale,inp_zero_point)
      inputLoader(ker_size, in_channels, groups,
                out_rows,out_cols)
      kernelLoader(num_iterations,ker_size*ker_size*in_channels)
      compute_mul(ker_size, in_channels, num_iterations)
      compute_accumulate(ker_size, in_channels, num_iterations)
      output_module(out_start_addr,conv_scale, conv_zero_point,offsetStart,
                  pool_cols,isLinear,isFlatten,isActivation,
                  out_rows,out_cols,out_channels,out_grp_no,out_chn_ind)
      # Parallel Block End