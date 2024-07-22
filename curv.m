function [k] = curv(ndim, der, der2)

    for i = 1:size(der,1)
    
        switch ndim
            case 2
                k(i) = der2(i)/((1+(der(i))^2)^(3/2));
            case 3
                mu(i) = norm(der(i,:));
                cp = cross(der,der2);
                k(i) = norm(cp(i,:))/(mu(i)^3);
            otherwise
                disp('Error in # of dimensions')
        end
    
    end % i = 1:size(der,1)

end % function curv