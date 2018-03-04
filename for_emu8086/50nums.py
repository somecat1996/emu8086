import random

a = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F']
b = {}
for i in range(50):
    tmp = ''
    key = 0
    for j in range(4):
        t = random.choice(range(16))
        tmp += a[t]
        if j == 0 and t > 7:
            key -= 2**16
        key += t*16**(3-j)
    tmp = '0'+tmp+'H'
    b[key] = tmp
b_keys = b.keys()
b_keys.sort()
for i in b_keys:
    print b[i] + ',',