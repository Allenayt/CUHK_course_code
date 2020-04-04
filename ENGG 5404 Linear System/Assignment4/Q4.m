plot(out.tout, out.LQG(:,1), 'LineWidth', 1.5)
hold on
plot(out.tout, out.LQG(:,2), 'LineWidth', 1.5)
hold on
legend('x_{1}', 'x_{1}dot')
axis([0 6 -0.6 1.2])
grid on