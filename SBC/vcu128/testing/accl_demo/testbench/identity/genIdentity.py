arr = [0 for i in range(16*16*9)]
for i in range(16):
    arr[144*i+9*i+4] = 1

for i in range(16*16*9):
    print(arr[i])
