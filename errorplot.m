function [out] = errorplot(curv, err)

for c = 1:3
    for r = 1:5
        temp = reshape(err(c,4,1,:,r), [1,size(err,4)]);

        if c == 3
            temp = temp(1:5);
        end

        rmse_ave(c,r) = mean(temp);
        rmse_std(c,r) = std(temp);
    end
end

out = [];

for r = 1:5
    errorbar(curv,rmse_ave(:,r),rmse_std(:,r),'_','LineWidth',3,'MarkerSize',35)
    hold on
end

legend('1 mm','3 mm','5 mm','8 mm','10 mm')
xlabel('Curvature [m^{-1}]', 'FontSize', 40)
ylabel('Error [mm]', 'FontSize', 40)
xlim([0,30])
set(gca, 'FontSize', 40)
title("Valdiation Results", 'FontSize', 40)
subtitle("RMSE", 'FontSize', 35)

end % function

    
    



    


   