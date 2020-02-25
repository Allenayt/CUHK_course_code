syms s F K
A = [0 1 0 0;-K -F K F;0 0 0 1;K F -K -F]
B = [0 1 0 0]'
C = [0 0 1 0]
G = C * inv(s*eye(4)-A) * B
eig(A)

Qc1 = [B A*B A*A*B A*A*A*B]
rank(Qc1)
Q0 = [C;C*A;C*A*A;C*A*A*A]
rank(Q0)