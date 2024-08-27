function [k, alpha] = paramfilt(r, k, alpha, gen)

% Remove outliers
k = filloutliers(k,"center");
alpha = filloutliers(alpha,"center");

% Smoothing
k = smoothdata(k,"sgolay", gen.wins(r));    
alpha = smoothdata(alpha,"sgolay", gen.wins(r));
    
end % function paramfilt
