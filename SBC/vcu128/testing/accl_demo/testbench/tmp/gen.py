f = open("2.txt",'w')
for i in range(9*16*16):
    f.write(str(i%256)+"\n")

f.close()
