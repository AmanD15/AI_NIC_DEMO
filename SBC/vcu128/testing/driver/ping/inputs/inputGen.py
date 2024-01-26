import random

f = open("input.txt",'w')
for i in range(224*224*3):
    val = random.randint(0,255)
    f.write(str(val)+"\n")

f.close()
