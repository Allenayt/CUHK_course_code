clear
x0 = 0.002;
v0 = 0.0012;
omega = 1.5 * pi;
zeta = [0 0.1 1 5];
for i = 1:4
    V = zeros(1,801);
    V(1)=v0;
    num = [0 x0 v0+2*zeta(i)*omega*x0];
    den = [1 2*zeta(i)*omega omega^2];
    [A, B, C, D] = tf2ss(num,den);
    %sys = ss(A, B, C, D)
    %x0 = [0.002, 0.0012]
    t = 0:0.01:8;
    Y= impulse(num, den, t)
    for j = 1:800
        V(j+1) = (Y(j+1)-Y(j))/0.01;
    end
    plot(t, V)
    hold on
    grid on
    %initial(sys, t)
end
title('V(t)-t Impulse Response')

