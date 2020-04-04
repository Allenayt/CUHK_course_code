plot(out.tout, out.LQG(:,1), 'LineWidth', 1.2)
hold on
plot(out.tout, out.LQG(:,2), 'LineWidth', 1.2)
hold on
legend('x_{1}', 'x_{1}dot')
axis([0 15 -0.6 1.2])
grid on