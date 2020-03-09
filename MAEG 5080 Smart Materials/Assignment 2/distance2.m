function x2 = distance2(v, t)
%   Detailed explanation goes here
m = 1000;
c = 2500;
k = 158000;
h = 0.075; 
L = 3;

t_delay = t - L/v;

omega_n = sqrt(k/m);
zeta = c / (2 * m * omega_n);
omega_d = omega_n * sqrt(1 - zeta^2);
phi = atan(zeta / sqrt(1-zeta^2));
if t < L/v
    x2 = 0;
end
if t >= L/v
    x2 = (h/2) * (1 - (exp(-zeta*omega_n*t_delay))/(sqrt(1 - zeta^2)) * cos(omega_d*t_delay-phi));
end
end

