function [k, alpha] = sin2D(L, coef, numx)

    fun = @(t) sqrt((4.25*10)^2 + (70*cos(t)).^2);
    % coef = Lcorr(L, fun, coef);

    temp = 0:0.01:2*coef*pi;
    x = temp*4.25*10;
    y = 70*sin(temp);

    output = interp(x, y, 0, 2, numx);
    x = output(:,1);
    y = output(:,2);

    der = (70/42.5)*cos(x/42.5);
    der2 = (-70/(42.5^2))*sin(x/42.5);

    k = curv(2, der, der2);
    alpha = zeros(size(k));

end % function sin2D