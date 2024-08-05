function [] = shapeplot(exp, truth, fontsize, tit)

% Ground truth
plot3(truth(1,:), truth(2,:), truth(3,:), 'LineWidth', 3)
hold on

% Reconstruction
plot3(exp(1,:), exp(2,:), exp(3,:), 'LineWidth', 2)
hold off

axis equal
set(gca, 'FontSize', fontsize)
xlabel('x [mm]', 'FontSize', fontsize)
ylabel('y [mm]', 'FontSize', fontsize)
zlabel('z [mm]', 'FontSize', fontsize)
title(titre, 'FontSize', 1.5*fontsize)

end % function shapeplot
