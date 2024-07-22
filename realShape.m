function [k, alpha] = realShape(shape, L, numx)

coef = 1;

switch shape
    case "Sinus2D"
        [k, alpha] = sin2D(L, coef, numx);
    case "Sinus3D"
        [k, alpha] = sin3D(L, coef, numx);
    case "Exponential2D"
        [k, alpha] = exp2D(L, coef, numx);
    case "Exponential3D"
        [k, alpha] = exp3D(L, coef, numx);
    otherwise
        disp('Real shape error')
end

end % function realShape