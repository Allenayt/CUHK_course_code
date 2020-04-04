A = [0 1;0 -1];
B = [0;1];
C = [1 0];
D = 0;
Q = [1 0;0 0.5];
R = 0.01;
sys_c = ss(A, B, C, D);
[K, P, e] =lqr(A, B, Q, R)
sys_f = ss(A-B*K, B, C, D)
[Gm, Pm, Wcg, Wcp] = margin(sys_f)
margin(sys_f)