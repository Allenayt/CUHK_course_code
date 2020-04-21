clear all
epsilon = 0.01;

A =[0 1;0 -1];
B = [0;1];
E = [0 0 epsilon 0 0
     1 0 0 epsilon 0];
E_origin = [0 0 
     1 0 ];
C1 = [1 0];
D1 = [0 1 0 0 epsilon];
D1_origin = [0 1];
C2 = [0 1;epsilon 0;0 epsilon;0 0];
C2_origin = [0,1];
D2 = [0;0;0;epsilon];
D2_origin = 0;


P = h2care(A,B,C2,D2)
F = -inv(D2'*D2)*(D2'*C2+B'*P)%h2state(A,B,C2,D2,1)
Q = h2care(A',C1',E',D1')
K = -(Q*C1'+E*D1')*inv(D1*D1')%h2state(A',C1',E',D1',1))'
g2 = sqrt(trace(E'*P*E)+trace((A'*P+P*A+C2'*C2)*Q));

Acmp = A+B*F+K*C1
Bcmp = -K
Ccmp = F
Dcmp = 0

Acl = [A B*Ccmp;Bcmp*C1 Acmp]
Bcl = [E_origin;Bcmp*D1_origin]
Ccl = [C2_origin D2_origin*Ccmp]
Dcl = zeros(1,2)
sigma(Acl,Bcl,Ccl,Dcl);

% sig = zeros(800,2);
% x = zeros(800,1);
% for i=1:800 
%     x(i)=power(10, -5+i*0.01);
%     
%     Tzw = Ccl*inv(x(i).*eye(4)-Acl)*Bcl;
%     n(i) = norm(Tzw,2);
%     k = svd(Tzw);
%     sig(i,1)= k(1);
%     sig(i,2)= k(2);
% end
% semilogx(x,sig(:,1),'LineWidth',1.5)
% hold on
% semilogx(x,sig(:,2),'LineWidth',1.5)
% xlim([10^(-5),10^(3)])
% xlabel('Frequency (rad/sec)')
% ylabel('Magnitude')
% grid on
% 
