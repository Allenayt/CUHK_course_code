%v = 20;
v = 11.96;
%v = 1000
t = 0:0.01:6;
x = zeros(1,601);
x1 = zeros(1,601);
x2 = zeros(1,601);
x3 = zeros(1,601);
x4 = zeros(1,601);
for i = 1:600
    x1(i) = distance1(v, t(i));
    x2(i) = distance2(v, t(i));
    x3(i) = distance3(v, t(i));
    x4(i) = distance4(v, t(i));
end
x = x1+x2+x3+x4;

plot(t, x, 'LineWidth', 2)
hold on
plot(t, x1, 'LineWidth', 1)
hold on 
plot(t, x2, 'LineWidth', 1)
hold on
plot(t, x3, 'LineWidth', 1)
hold on
plot(t, x4, 'LineWidth', 1)
xlabel('time(s)')
ylabel('x(m)')
title('Response (v=vmin) ')
legend('x-total','x1','x2','x3','x4')
grid on