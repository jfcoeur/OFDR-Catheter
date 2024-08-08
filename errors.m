function [Merr, xyzr, xyze] = errors(gen, x, xyz, k, alpha, c)

x = x';
alphar = 360*ones(size(x));
kr = gen.curv(c)*ones(size(x));

xyzr = tricoord(x, kr, alphar);
xyze = reshape(xyz, size(xyzr));

% Registration
xyze = pointCloud(xyze');
xyzr_temp = pointCloud(xyzr');
[~,output] = pcregistericp(xyze,xyzr_temp);
xyze = output.Location;
xyze = xyze';
%

[err_xyz, rmse_xyz] = fun(xyzr, xyze);
[err_k, rmse_k] = fun(kr, k);
[err_alpha, rmse_alpha] = fun(alphar, alpha);

colxyz = funcall(err_xyz, rmse_xyz);
colk = funcall(err_k, rmse_k);
colalpha = funcall(err_alpha, rmse_alpha);

Merr = [colxyz, colk, colalpha];

%%%%%%%%
function [err, rmse] = fun(truth, exp)

    subs = truth - exp;    
    err2 = sum(subs.^2, 1);
    err = sqrt(err2);
    rmse = sqrt(sum(err2)/length(err2)); 

end % function fun
%%%%%%%%

%%%%%%%%
function [out] = funcall(err, rmse)

    out(1) = mean(err);
    out(2) = std(err);
    out(3) = err(end);
    out(4) = rmse;
    out = out';

end % function funcall
%%%%%%%%

end % function errors
