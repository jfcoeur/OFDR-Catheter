function [out] = shapeplot(exp, truth, fontsize, tit)

% Ground truth
plot3(truth(1,:), truth(2,:), truth(3,:), 'LineWidth', 3)
hold on

% Reconstruction
for s = 1:size(exp,1)
    exp_plot = reshape(exp(s,:,:), [3,size(exp,3)]);
    plot3(exp_plot(1,:), exp_plot(2,:), exp_plot(3,:), 'LineWidth', 2)
    hold on
end % s = 1:size(exp,1)

axis equal
set(gca, 'FontSize', fontsize)
xlabel('x [mm]', 'FontSize', fontsize)
ylabel('y [mm]', 'FontSize', fontsize)
zlabel('z [mm]', 'FontSize', fontsize)
title(tit, 'FontSize', 1.5*fontsize)

out = [];

end % function shapeplot
