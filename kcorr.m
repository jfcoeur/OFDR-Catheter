function [kout] = kcorr(dirload, k, r)

% Gauge
filecalib = dirload + "_calib.mat";
g = load(filecalib).g{r};

% Curvature correction
for ref = 1:size(g,2)

    kout(ref,:) = k./g(:,ref);

end % ref = 1:size(g,2)

end % function kcorr
