figure(1)
positionVector1 = [0, 0.1, 0.5, 0.8];
subplot('Position',positionVector1, 'LineWidth', 1)
subplot(9,1,1);
plot(out.tout, out.h2state(:,1), 'LineWidth', 1);
ylabel('\phi')
subplot(9,1,2);
plot(out.tout, out.h2state(:,2), 'LineWidth', 1);
ylabel('\theta')
subplot(9,1,3);
plot(out.tout, out.h2state(:,3), 'LineWidth', 1);
ylabel('p')
subplot(9,1,4);
plot(out.tout, out.h2state(:,4), 'LineWidth', 1);
ylabel('q')
subplot(9,1,5);
plot(out.tout, out.h2state(:,5), 'LineWidth', 1);
ylabel('a_s')
subplot(9,1,6);
plot(out.tout, out.h2state(:,6), 'LineWidth', 1);
ylabel('b_s')
subplot(9,1,7);
plot(out.tout, out.h2state(:,7), 'LineWidth', 1);
ylabel('r')
subplot(9,1,8);
plot(out.tout, out.h2state(:,8), 'LineWidth', 1);
ylabel('\delta_{ped,int}')
subplot(9,1,9);
plot(out.tout, out.h2state(:,9), 'LineWidth', 1);
ylabel('\psi')

figure(2)
subplot(3,1,1);
plot(out.tout, out.h2state(:,10), 'LineWidth', 1);
ylabel('\delta_{lat}')
subplot(3,1,2);
plot(out.tout, out.h2state(:,11), 'LineWidth', 1);
ylabel('\delta_{lon}')
subplot(3,1,3);
plot(out.tout, out.h2state(:,12), 'LineWidth', 1);
ylabel('\delta_{ped}')