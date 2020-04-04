A = [0 1;0 -1];
B = [0;1];
C = [1 0];
D = 0;
Q = [1 0;0 0.5];
R = 0.01;
sys_c = ss(A, B, C, D);
[F, P, e] =lqr(A, B, Q, R)
[Gm, Pm, Wcg, Wcp] = margin(A,B,F,0)
margin(sys_f)
figure(1)
margin(A,B,F,0)
figure(2)
nyquist(A,B,F,0)