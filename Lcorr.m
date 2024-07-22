function [coef] = Lcorr(L, fun, coef)

    % Length correction       
    Lnew = integral(fun,0,2*coef*pi);
    while abs(L - 1e-3*Lnew) > 0.000001
        coef = coef - 1e-6;
        Lnew = integral(fun,0,2*coef*pi);
    end

end % function Lcorr