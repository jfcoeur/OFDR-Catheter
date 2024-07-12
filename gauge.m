function [g] = gauge(k, r, dirload)

filecalib = dirload + "_calib.mat";
calib = load(filecalib);

if k < 1.6
    coef = calib.scoef(:,:,r);
else
    coef = calib.lcoef(:,:,r);
end

for c = 1:size(coef,1)

    C(c) = poly3(k, coef(c,1), coef(c,2), coef(c,3), coef(c,4));

end % c = 1:size(coef,1)

if k < 1.6
    g = poly3(x, C(1), C(2), C(3), C(4));
else
    g = exp2(x, C(1), C(2), C(3), C(4));
end

%%%%%%%%
function [y] = poly3(x, p1, p2, p3, p4)

    for s = 1:length(x)
        y(s) = p1*x(s)^3+p2*x(s)^2+p3*x(s)+p4;
    end

end % function poly3
%%%%%%%%

%%%%%%%%
function [y] = exp2(x, a, b, c, d)

    for s = 1:length(x)
        y(s) = a*exp(b*x(s))+c*exp(d*x(s));
    end

end % function exp2
%%%%%%%%

end % function gauge
