function [out] = kloop(dirload, gen)

% Strain signals file
filename = dirload.sig + "_sig.mat";
results = load(filename).results;

% Data
x = results.x;
sig1 = results.fiber1;
sig2 = results.fiber2;
sig3 = results.fiber3;

% Calibration file
filecalib = dirload.calib + "_calib.mat";
calib = load(filecalib).calib;

% Curvatures
curv = gen.curv;

% Curvature loop
for c = 1:length(curv)

    [xyz(c,:), k(c,:), alpha(c,:), err(c,:,:,:,:)] = shape(calib, gen, x, sig1, sig2, sig3, c);    

end % c = 1:length(curv)
errorplot(curv, err);

out = [];

end % function kloop
