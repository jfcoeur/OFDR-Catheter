function [Terr] = errors(gen, x, xyz, k, alpha, c)

alphar = zeros(size(x));
kr = gen.curv(c)*ones(size(x));
rownames = {'err_ave' 'err_std' 'tip_ave' 'tip_std' 'rmse_ave' 'rmse_std'};
colnames = {'xyz' 'k' 'alpha'};

% Theoretical shape
for s = 1:size(xyz,1)
    
    xyzr = tricoord(x, kr, alphar);
    [err_xyz(s,:), rmse_xyz(s)] = fun(xyzr, xyz(s,:,:));
    [err_k(s,:), rmse_k(s)] = fun(kr, k(s,:));
    [err_alpha(s,:), rmse_alpha(s)] = fun(alphar, alpha(s,:));

end % s = 1:size(xyz,1)

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
