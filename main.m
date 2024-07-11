function [] = main(in)

% Initialization
clearvars
clc
close all
warning('off','all')

gen = in.gen;
gen.curv = gen.curvatures(in.dataset,:);

% Calculation
[g, tet1] = catloop(in.dirload, gen);

% Saving
calib = struct('g', g, 'tet1', tet1);
filename = in.dirsave + "_calib.mat";
save(filename, "calib");

disp("Calibration task completed");

end % function main
