[k, alpha] = realShape("Sinus2D", 0.4, 41);
k = 1000*k;

%%
subplot(1,2,1)
plot(xval, k, 'LineWidth', 3)
title('\kappa', 'FontSize', 40)
xlabel('Position [m]', 'FontSize', 40)
ylabel('[m^{-1}]', 'FontSize', 40)
xlim([xval(1), xval(end)])
set(gca, 'FontSize', 40)
    
subplot(1,2,2)
% plot(xval, tet1-360, 'LineWidth', 3)
% hold on
plot(xval, tet1_sinus, 'LineWidth', 3)
title('\phi_1', 'FontSize', 40)
xlabel('Position [m]', 'FontSize', 40)
ylabel('[\circ]', 'FontSize', 40)
xlim([xval(1), xval(end)])
set(gca, 'FontSize', 40)

%%
idx{1} = 1:16;
idx{2} = 17:25;
idx{3} = 26:41;
xtemp = xval(idx{2});

drum{1} = tet1(idx{1}) - abs(tet1(11)-tet1_sinus(11));
drum{2} = tet1(idx{2}) - 360;
drum{3} = tet1(idx{3}) - abs(tet1(31)-tet1_sinus(31));

sin{1} = tet1_sinus(idx{1});
sin{2} = tet1_sinus(idx{2});
sin{3} = tet1_sinus(idx{3});

fig = tiledlayout(2,3,'TileSpacing','Compact');

nexttile
plot(xval(idx{1}), k(idx{1}), 'LineWidth', 3)
set(gca, 'FontSize', 40)
xlabel('','FontSize',0.01)
ylabel("[m^{-1}]", 'FontSize', 40)

nexttile
plot(xval(idx{2}), k(idx{2}), 'LineWidth', 3)
set(gca, 'FontSize', 40)
xlabel('','FontSize',0.01)
ylabel('','FontSize',0.01)
title('\kappa', 'FontSize', 40)
xlim([xtemp(1), xtemp(end)])

nexttile
plot(xval(idx{3}), k(idx{3}), 'LineWidth', 3)
set(gca, 'FontSize', 40)
xlabel('','FontSize',0.01)
ylabel('','FontSize',0.01)

nexttile
plot(xval(idx{1}), sin{1}, 'LineWidth', 3)
hold on
plot(xval(idx{1}), drum{1}, 'LineWidth', 3)
set(gca, 'FontSize', 40)
xlabel('','FontSize',0.01)
ylabel("[\circ]", 'FontSize', 40)

nexttile
plot(xval(idx{2}), sin{2}, 'LineWidth', 3)
hold on
plot(xval(idx{2}), drum{2}, 'LineWidth', 3)
set(gca, 'FontSize', 40)
xlabel('','FontSize',0.01)
ylabel('','FontSize',0.01)
title('\phi_1', 'FontSize', 40)
xlim([xtemp(1), xtemp(end)])

nexttile
plot(xval(idx{3}), sin{3}, 'LineWidth', 3)
hold on
plot(xval(idx{3}), drum{3}, 'LineWidth', 3)
set(gca, 'FontSize', 40)
xlabel('','FontSize',0.01)
ylabel('','FontSize',0.01)

xlabel(fig, 'Position [m]', 'FontSize', 40)
legend('Sine curve calibration', 'Drum calibration', 'FontSize', 30)

%%
x = [1,3,5,8,10];
errorbar(x,rmse_ave(1,:),rmse_std(1,:),'-o','LineWidth',3,'MarkerSize',35)
hold on
errorbar(x,rmse_ave(2,:),rmse_std(2,:),'-o','LineWidth',3,'MarkerSize',35)
hold on
errorbar(x,rmse_ave(3,:),rmse_std(3,:),'-o','LineWidth',3,'MarkerSize',35)
legend('9.52 m^{-1}', '12.22 m^{-1}', '25.34 m^{-1}')
xlabel('Spatial resolution [mm]', 'FontSize', 40)
ylabel('RMSE [mm]', 'FontSize', 40)
title('Catheter validation results', 'FontSize', 40)
set(gca, 'FontSize', 40)
