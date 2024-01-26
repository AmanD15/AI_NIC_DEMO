import random

def weightGen(rk,ck,cho,chi,filename):
    f = open(filename,'w')
    num_elements = rk*ck*cho*chi
    for i in range(num_elements):
        val = random.randint(0,255)
        f.write(str(val)+"\n")
    f.close()


weightGen(3,3,64,3,"weights1.txt")
weightGen(3,3,64,64,"weights2.txt")
weightGen(3,3,64,128,"weights3.txt")
weightGen(3,3,128,128,"weights4.txt")
weightGen(3,3,128,256,"weights5.txt")
weightGen(3,3,256,256,"weights6.txt")
weightGen(3,3,256,512,"weights7.txt")
weightGen(3,3,512,512,"weights8.txt")
weightGen(2,2,512,256,"weights9.txt")
weightGen(3,3,512,256,"weights10.txt")
weightGen(3,3,256,256,"weights11.txt")
weightGen(2,2,256,128,"weights12.txt")
weightGen(3,3,256,128,"weights13.txt")
weightGen(3,3,128,128,"weights14.txt")
weightGen(2,2,128,64,"weights15.txt")
weightGen(3,3,128,64,"weights16.txt")
weightGen(3,3,64,64,"weights17.txt")
weightGen(3,3,3,64,"weights18.txt")
