function [g, tet1] = paramfilt(r, g, tet1, gen)

for ref = 1:size(g,2)

    % Remove outliers
    g(:,ref) = filloutliers(g(:,ref),"center");
    tet1(:,ref) = filloutliers(tet1(:,ref),"center");
    
    % Smoothing
    g(:,ref) = smoothdata(g(:,ref),"sgolay", gen.wins(r));    
    tet1(:,ref) = smoothdata(tet1(:,ref),"sgolay", gen.wins(r));

end % ref = 1:size(g,2)
    
end % function paramfilt