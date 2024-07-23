function [out] = main(in)

gen = in.gen;

% Calculation
[g, tet1] = catloop(in.dirload, gen);

% Saving
calib = struct('g', g, 'tet1', tet1);
filename = in.dirsave + "_calib.mat";
save(filename, "calib");

out = [];
disp("Calibration task completed");

end % function main
