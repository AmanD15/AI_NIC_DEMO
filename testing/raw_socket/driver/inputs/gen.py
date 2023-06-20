
f = open("file.txt", 'w')

for i in range(16*16*16):
    f.write(str(1) + "\n")

f.close()


