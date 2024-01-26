f = open("tmp.txt",'w')
for i in range(2048):
    f.write(format(0x220000+i,'x')+" "+format(0xf1e2d3c4,'x')+"\n")

f.close()
