A1 = [[-3; 26; 30; 30] [-3; 36; 39; 43] [1; -3; -2; -3] [0; -25; -27; -32]];
B1 = [3 -2 0 0;3 -1 3 1]';
Qc1 = [B1 A1*B1 A1*A1*B1 A1*A1*A1*B1]

rank(Qc1)

T1=[B1 [1;0;1;0] [1;1;0;0]]
A1_=inv(T1)*A1*T1
B1_=inv(T1)*B1

eig([-53 -150;18 51])
rank([1 0 -5 -7;0 1 4 6])
rank([-3*eye(4)-A1_ B1_])
rank([1*eye(4)-A1_ B1_])
