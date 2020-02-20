clear
clc
syms s 
A = str2sym('[s+1/2 1/2 -1/2;1/2 s+1/2 1/2;1/2 -1/2 s+3/2]')
C = [0 1 0]
B = [1/2 1/2 1/2]'
c = inv(A)
C*c*B