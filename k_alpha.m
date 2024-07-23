function [k, alpha] = k_alpha(sig1, sig2, sig3, r1, r2, r3, tet1, tet12, tet23)

D12 = sig1 - sig2;
D13 = sig1 - sig3;
tet2 = tet1 + tet12;
tet3 = tet2 + tet23;
    
for i = 1:length(D12)

    % Alpha
    f = @(alpha) (r3*cosd(tet3(i) - alpha) - r1*cosd(tet1(i) - alpha))*D12(i) - (r2*cosd(tet2(i) - alpha) - r1*cosd(tet1(i) - alpha))*D13(i);
    alpha(i) = mod(fzero(f, 0),360);

    % Curvature
    k(i) = D12(i)/(r2*cosd(tet2(i) - alpha(i)) - r1*cosd(tet1(i) - alpha(i)));
    
    if k(i) < 0
        k(i) = -k(i);
        if alpha(i) < 180
		alpha(i) = alpha(i) + 180;
        else
		alpha(i) = alpha(i) - 180;
        end
    end
    
end % i = 1:length(D12)

end % function k&alpha
