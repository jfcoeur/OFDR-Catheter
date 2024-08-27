[k, alpha] = realShape("Sinus2D", 0.4, 395);
k = 1000*k;

%%
subplot(1,2,1)
plot(xval, k, 'LineWidth', 3)
title('\kappa', 'FontSize', 40)
xlabel('Position [m]', 'FontSize', 40)
ylabel('Amplitude [m^{-1}]', 'FontSize', 40)
xlim([xval(1), xval(end)])
set(gca, 'FontSize', 40)
    
subplot(1,2,2)
% plot(xval, tet1-360, 'LineWidth', 3)
% hold on
plot(xval, tet1_sinus, 'LineWidth', 3)
title('\phi_1', 'FontSize', 40)
xlabel('Position [m]', 'FontSize', 40)
ylabel('Amplitude [deg]', 'FontSize', 40)
xlim([xval(1), xval(end)])
set(gca, 'FontSize', 40)

%%
idx1 = 1:164;
idx2 = 165:231;
idx3 = 232:395;

drum1 = tet1(idx1) - abs(tet1(100)-tet1_sinus(100));
drum2 = tet1(idx2) - 360;
drum3 = tet1(idx3) - abs(tet1(297)-tet1_sinus(297));

sin1 = tet1_sinus(idx1);
sin2 = tet1_sinus(idx2);
sin3 = tet1_sinus(idx3);

subplot(2,3,1)
plot(xval(idx1), k(idx1), 'LineWidth', 3)
xlabel('Position [m]', 'FontSize', 40)
ylabel('Amplitude [m^{-1}]', 'FontSize', 40)
xlim([xval(idx1(1)), xval(idx1(end))])
set(gca, 'FontSize', 40)

subplot(2,3,2)
plot(xval(idx2), k(idx2), 'LineWidth', 3)
xlabel('Position [m]', 'FontSize', 40)
ylabel('Amplitude [m^{-1}]', 'FontSize', 40)
title('\kappa', 'FontSize', 40)
xlim([xval(idx2(1)), xval(idx2(end))])
ylim([k(idx2(1)), k(idx2(end))])
set(gca, 'FontSize', 40)

subplot(2,3,3)
plot(xval(idx3), k(idx3), 'LineWidth', 3)
xlabel('Position [m]', 'FontSize', 40)
ylabel('Amplitude [m^{-1}]', 'FontSize', 40)
xlim([xval(idx3(1)), xval(idx3(end))])
set(gca, 'FontSize', 40)

subplot(2,3,4)
plot(xval(idx1), sin1, 'LineWidth', 3)
hold on
plot(xval(idx1), drum1, 'LineWidth', 3) 
xlabel('Position [m]', 'FontSize', 40)
ylabel('Amplitude [deg]', 'FontSize', 40)
xlim([xval(idx1(1)), xval(idx1(end))])
ylim([-115, 245])
set(gca, 'FontSize', 40)

subplot(2,3,5)
plot(xval(idx2), sin2, 'LineWidth', 3)
hold on
plot(xval(idx2), drum2, 'LineWidth', 3) 
xlabel('Position [m]', 'FontSize', 40)
ylabel('Amplitude [deg]', 'FontSize', 40)
title('\phi_1', 'FontSize', 40)
xlim([xval(idx2(1)), xval(idx2(end))])
ylim([-270, 90])
set(gca, 'FontSize', 40)

subplot(2,3,6)
plot(xval(idx3), sin3, 'LineWidth', 3)
hold on
plot(xval(idx3), drum3, 'LineWidth', 3) 
xlabel('Position [m]', 'FontSize', 40)
ylabel('Amplitude [deg]', 'FontSize', 40)
xlim([xval(idx3(1)), xval(idx3(end))])
ylim([-405, -45])
set(gca, 'FontSize', 40)
legend('Sine curve calibration', 'Drum calibration', 'FontSize', 40)

%%
x = [1,3,5,8,10];
plot(x, rmse_ave(1,:), '-o', 'LineWidth', 3, 'MarkerSize', 35)
hold on
plot(x, rmse_ave(2,:), '-o', 'LineWidth', 3, 'MarkerSize', 35)
hold on
plot(x, rmse_ave(3,:), '-o', 'LineWidth', 3, 'MarkerSize', 35)
legend('9.52 m^{-1}', '12.22 m^{-1}', '25.34 m^{-1}')
xlabel('Spatial resolution [mm]', 'FontSize', 40)
ylabel('RMSE [mm]', 'FontSize', 40)
title('Catheter', 'FontSize', 40)
set(gca, 'FontSize', 40)
