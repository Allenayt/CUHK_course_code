clear all
%%
eps=0.1;
A = [0 0 1 0 0 0 0.0009 0 0
     0 0 0 0.9992 0 0 -0.0389 0 0
     0 0 -0.0302 -0.0056 -0.0003 585.1165 11.4448 -59.529 0
     0 0 0 -0.0707 267.7499 -0.0003 0 0 0
     0 0 0 -1 -3.3607 2.2223 0 0 0
     0 0 -1 0 2.4483 -3.3607 0 0 0
     0 0 0.0579 0.0108 0.0049 0.0037 -21.9557 114.2 0
     0 0 0 0 0 0 -1 0 0
     0 0 0 0.0389 0 0 0.9992 0 0
    ];
B = [0 0 0
     0 0 0
     0 0 43.3635
     0 0 0
     0.2026 2.5878 0
     2.5878 -0.0663 0
     0 0 -83.1883
     0 0 -3.8500
     0 0 0
     ];
 C1 = [1 0 0 0 0 0 0 0 0
      0 1 0 0 0 0 0 0 0
      0 0 1 0 0 0 0 0 0 
      0 0 0 1 0 0 0 0 0
      0 0 0 0 0 0 1 0 0
      0 0 0 0 0 0 0 0 1
      ];
 C2 = [1 0 0 0 0 0 0 0 0
      0 1 0 0 0 0 0 0 0
      0 0 0 0 0 0 0 0 1
      ];
 C2_=[C2; eps*eye(9); zeros(3,9)];
 D1 = zeros(6,3);
 D1_ = [D1 zeros(6,9) eps*eye(6)];
 D2 = zeros(3,3);
 D2_=[D2; zeros(9,3); eps*eye(3)];
 
 E = [0 0 0
     0 0 0 
     -0.0001 0.1756 -0.0395
     0 0.0003 0.0338
     0 0 0
     0 0 0 
     -0.002 -0.3396 0.6424
     0 0 0
     0 0 0
     ];
 E_ = [E eps*eye(9) zeros(9,6)];
 x0 = [0 -0.1 0 0 0 0 0 0 0.1]';
 
 %%
P = h2care(A,B,C2_,D2_);
F = -inv(D2_'*D2_)*(D2_'*C2_+B'*P);
Q = h2care(A',C1',E_',D1_');
K = -(Q*C1'+E_*D1_')*inv(D1_*D1_');
g2 = sqrt(trace(E'*P*E)+trace((A'*P+P*A+C2'*C2)*Q));
eigP = eig(P)
eigQ = eig(Q)

%%
Acmp = A+B*F+K*C1;
Bcmp = -K;
Ccmp = F;
Dcmp = 0;
%%
Acl = [A B*Ccmp;Bcmp*C1 Acmp];
Bcl = [E;Bcmp*D1];
Ccl = [C2 D2*Ccmp];
Dcl = zeros(3,3);
stablization = eig(Acl)
sigma(Acl,Bcl,Ccl,Dcl)
%%
wind.signals.values = zeros(4001,3);
wind.time = zeros(1,4001);
wind.signals.dimensions = 3;

for i = 0:0.01:40
    wind.time(int32(1+100*i)) = i;
end

for i = 10:0.01:30
    wind.signals.values(int32(1+100*i),1)= 10*cos(2*pi/40*(i-20));
    wind.signals.values(int32(1+100*i),2)= 10*cos(2*pi/40*(i-20));
    wind.signals.values(int32(1+100*i),3)= 3*cos(2*pi/40*(i-20));
end
 
    
 
 