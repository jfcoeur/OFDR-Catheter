function [k, tet1] = k_tet1(alpha, sig1, sig2, sig3, r1, r2, r3, tet12, tet23)

D12 = sig1 - sig2;
D13 = sig1 - sig3;

for i = 1:length(D12)

    % Tet1
    f = @(tet1) (r3*cosd(tet1 + tet12 + tet23 - alpha) - r1*cosd(tet1 - alpha))*D12(i) - (r2*cosd(tet1 + tet12 - alpha) - r1*cosd(tet1 - alpha))*D13(i);
    tet1(i) = mod(fzero(f, 0),360);
    
    % Curvature
    k(i) = D12(i)/(r2*cosd(tet1(i) + tet12 - alpha) - r1*cosd(tet1(i) - alpha));
    
    if k(i) < 0
        k(i) = -k(i);
        if tet1(i) < 180
	        tet1(i) = tet1(i) + 180;
        else
	        tet1(i) = tet1(i) - 180;
        end
    end

end % i = 1:length(D12)

end % function k_tet1
