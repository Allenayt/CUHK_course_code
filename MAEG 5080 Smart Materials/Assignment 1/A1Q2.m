clear
x0 = 0.002;
v0 = 0.0012;
omega = 1.5 * pi;
zeta = [0 0.1 1 5];
for i = 1:4
    num = [0 x0 v0+2*zeta(i)*omega*x0];
    den = [1 2*zeta(i)*omega omega^2];
    t = 0:0.01:8;
    impulse(num, den, t)
    grid on 
    hold on
end
title('X(t)-t Impulse Response')

