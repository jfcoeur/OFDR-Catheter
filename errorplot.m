function [out] = errorplot(curv, err)

% temp2 = []; % ajout

for c = 1:3

    % temp = []; % ajout

    for r = 1:5
        out = reshape(err(c,4,1,:,r), [1,size(err,4)]);

        if c == 3
            temp = out(1:5); % ajout (r,:)
        else
            temp = out; % ajout (r,:)
        end

        rmse_ave(c,r) = mean(temp);
        rmse_std(c,r) = std(temp);        
    end

    % rmse_ave(c) = mean(temp,"all"); % ajout
    % rmse_std(c) = std(temp,0,"all");  % ajout

    % temp2 = [temp2, temp]; % ajout

end

% rmse_ave = mean(temp2,2); % ajout
% rmse_std = std(temp2,0,2);  % ajout

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
