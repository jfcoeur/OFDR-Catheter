function [g, tet1] = paramfilt(r, g, tet1, gen)

% Remove outliers
g = filloutliers(g,"center");
tet1 = filloutliers(tet1,"center");

% Smoothing
g = smoothdata(g,"sgolay", gen.wins(r));    
tet1 = smoothdata(tet1,"sgolay", gen.wins(r));
    
end % function paramfilt
