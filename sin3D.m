function [k, alpha] = sin3D(L, coef, numx)

    fun = @(t) sqrt((4.25*10)^2 + (70*cos(t)).^2);
    % coef = Lcorr(L, fun, coef);

    temp = 0:0.01:2*coef*pi;
    x = temp*4.25*10;
    y = 70*sin(temp);

    r = 491.5/(2*pi);
    temp = (x(end)-x(1))/r;
    teta = 0:temp/(numx-1):temp;

    x = r.*sin(teta);
    y = 70*sin(r*teta/42.5);
    z = r.*cos(teta);

    output = interp(x, y, z, 3, numx);
    x = output(:,1);
    y = output(:,2);
    z = output(:,3);

    teta = acos(z/r);

    der = [-r*sin(teta), r/42.5*70*cos(r*teta/42.5), r*cos(teta)];
    der2 = [-r*cos(teta), -(r/42.5)^2*70*sin(r*teta/42.5), -r*sin(teta)];    

    k = curv(3, der, der2);
    h = sqrt(z.^2+y.^2);
    alpha = acosd(y./h);    

end % function sin3D