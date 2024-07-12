function [k] = kcorr(dirload, k, r, ref)

% Gauge
filecalib = dirload + "_calib.mat";
g = load(filecalib).g{r};

% Curvature correction
k = k./g(:,ref);

end % function kcorr
