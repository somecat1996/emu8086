import random

a = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']
b = []
for i in range(60):
    tmp = ''
    for j in range(4):
        tmp += random.choice(a)
    tmp = '0'+tmp+'H'
    if tmp not in b:
        b.append(tmp)
for i in b:
    print i + ',',
