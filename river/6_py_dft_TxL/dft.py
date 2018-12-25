import math

def dft(fCtD):
    res = []

    w = 0 ; N = len(fCtD)-1
    while w <= 2000:

        num = 0 ; numi = 0 ; n = 1
        while n <= N-1:
            t=n/N
            num  += (fCtD[n]*math.cos(2*math.pi*w*t))
            numi += (fCtD[n]*math.sin(2*math.pi*w*t))
            n += 1
        mo = (num+numi)*2/N
        if mo > 0.3:
            print(w)
        w += 1


fqtp = []
N = 2000 ; w = 1345 ; F=1
for n in range(N+1):
    t=n/N
    fqtp.append(math.sin(2*math.pi*w*t)*F)
print("start")
dft(fqtp)
