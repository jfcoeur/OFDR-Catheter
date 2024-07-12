function [Terr] = errors(gen, x, xyz, k, alpha, c)

ang = -gen.ang + 270;
kr = gen.curv(c)*ones(size(x));
rownames = {'err_ave' 'err_std' 'tip_ave' 'tip_std' 'rmse_ave' 'rmse_std'};
colnames = {'xyz' 'k' 'alpha'};

% Theoretical shape
for a = 1:length(ang)

    alphar = ang(a)*ones(size(x));
    xyzr = 3Dcoord(x, kr, alphar);
    [err_xyz(a,:), rmse_xyz(a)] = fun(xyzr, xyz(a,:,:));
    [err_k(a,:), rmse_k(a)] = fun(kr, k(a,:));
    [err_alpha(a,:), rmse_alpha(a)] = fun(alphar, alpha(a,:));

end % a = 1:length(gen.ang)

colxyz = funcall(err_xyz, rmse_xyz);
colk = funcall(err_k, rmse_k);
colalpha = funcall(err_alpha, rmse_alpha);

Terr = table(colxyz, colk, colalpha,'VariableNames', colnames, 'RowNames', rownames);

%%%%%%%%
function [err, rmse] = fun(truth, exp)

    subs = truth - exp;    
    err2 = sum(subs.^2, 2);
    err = sqrt(err2);
    rmse = sqrt(sum(err2)/length(err2)); 

end % function fun
%%%%%%%%

%%%%%%%%
function [out] = funcall(err, rmse)

    out{1} = mean(err,"all");
    out{2} = std(err,0,"all");
    out{3} = mean(err(:,end));
    out{4} = std(err(:,end));
    out{5} = mean(rmse);
    out{6} = std(rmse);
    out = out';

end % function funcall
%%%%%%%%

end % function errors
