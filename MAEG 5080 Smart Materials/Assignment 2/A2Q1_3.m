v_end = 100;
v = 0.52:0.01:v_end;
num = 100 * v_end - 51;
x_v = zeros(1,num);
t = 0:0.01:6;
x = zeros(1,601);
x1 = zeros(1,601);
x2 = zeros(1,601);
x3 = zeros(1,601);
x4 = zeros(1,601);
for j = 1:num
    for i = 1:600
        x1(i) = distance1(v(j), t(i));
        x2(i) = distance2(v(j), t(i));
        x3(i) = distance3(v(j), t(i));
        x4(i) = distance4(v(j), t(i));
    end
    x = x1+x2+x3+x4;
    x_v(j) = max(x);    
end
x_min = min(x_v)
v_min = 0.51 + find(x_v == min(x_v))/100
x_max = max(x_v)
v_max = 0.51 + find(x_v == max(x_v))/100
plot(v, x_v)
xlabel('v(m/s)')
ylabel('xmax(m)')
title('Maximum Magnitude - Velocity ')
