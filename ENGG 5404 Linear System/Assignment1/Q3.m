clear
clc

syms t s 
A = str2sym('[s+1/4 0 1/2;0 s -1/2;-5 10 s+50]')
C = [0 1 0]
B = [1/10 0 0]'
x0 = [1 2 0]'
c=inv(A)
result_unit = C*c*B*(1/s)+C*c*x0
result_impulse = C*c*B+C*c*x0

A_num = [-1/4 0 -1/2;0 0 1/2;5 -10 -50]
[vect, value]=eig(A_num)
diag(value)