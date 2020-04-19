clear all
epsilon = 0.01;
A =[0 1;0 -1];
B = [0;1];
E = [0 0;1 0];
C1 = [1 0];
D1 = [0 1];
C2 = [0 1;epsilon 0;0 epsilon;0 0];
C2_origin = [0,1];
D2 = [0;0;0;epsilon];
D2_origin = 0;
gamma = 1

%gm8star(A,B,C2,D2,E)

P = h8care(A,B,C2,D2,E,gamma)
F = -inv(D2'*D2)*(D2'*C2+B'*P)
Q = h8care(A',C1',E',D1',C2',gamma)
K = -(Q*C1'+E*D1')*inv(D1*D1')
% g2 = sqrt(trace(E'*P*E)+trace((A'*P+P*A+C2'*C2)*Q));
% 
Acmp = A+E*E'*P/gamma^2+B*F+inv(eye(2)-Q*P/gamma^2)*K*(C1+D1*E'*P/gamma^2)
Bcmp = -inv(eye(2)-Q*P/gamma^2)*K
Ccmp = F
Dcmp = 0;

Acl = [A B*Ccmp;Bcmp*C1 Acmp];
Bcl = [E;Bcmp*D1];
Ccl = [C2 D2*Ccmp];
Dcl = [0 0
       0 0
       0 0
       0 0];
eig(P*Q)
[MAG,PHASE,W] = bode(Acl,Bcl,Ccl,Dcl)
semilogx(W,MAG)
%sigma(Acl,Bcl,Ccl,Dcl) ;

% sig = zeros(12000,2);
% x = zeros(12000,1);
% for i=1:12000 
%     x(i)=power(10, -6+i*0.001);
%     
%     Tzw = Ccl*inv(x(i).*eye(4)-Acl)*Bcl;
%     n(i) = norm(Tzw,inf);
%     k = svd(Tzw);
%     sig(i,1)= k(1);
%     sig(i,2)= k(2);
% end
% Hinf = vpa(max(n),4)
% % semilogx(x,n,'LineWidth',1.5)
% semilogx(x,sig(:,1),'LineWidth',1.5)
% hold on
% semilogx(x,sig(:,2),'LineWidth',1.5)
% xlim([10^(-6),10^(6)])
% xlabel('Frequency (rad/sec)')
% ylabel('Magnitude (gamma=gmstar)')
% grid on

