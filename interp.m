function [out] = interp(x, y, z, ndim, numx)

    switch ndim
        case 2
            out = interparc(numx,x,y,'spline');
        case 3
            out = interparc(numx,x,y,z,'spline');
        otherwise
            disp('Error in # of dimensions')
    end

end % function interp