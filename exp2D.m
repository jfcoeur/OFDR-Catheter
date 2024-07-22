function [k, alpha] = exp2D(L, coef, numx)

    fun = @(t) sqrt((4.25*10)^2 + (0.1*2.35*exp(t)).^2);
    % coef = Lcorr(L, fun, coef);

    temp = 0:0.01:2*coef*pi;
    x = temp*4.25*10;
    y = 0.1*2.35*exp(temp);

    output = interp(x, y, 0, 2, numx);
    x = output(:,1);
    y = output(:,2);

    der = (0.235/42.5)*exp(x/42.5);
    der2 = (0.235/(42.5^2))*exp(x/42.5);

    k = curv(2, der, der2);
    alpha = zeros(size(k));

end % function exp2D