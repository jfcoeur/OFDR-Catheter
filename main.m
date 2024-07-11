function [] = main(in)

% Initialization
clearvars
clc
close all
warning('off','all')

% Calculation
[g, tet1] = catloop(in.dirdata, in.gen);

% Saving
calib = struct('g', g, 'tet1', tet1);
filename = in.savepath + "_calib.mat";
save(filename, "calib");

disp("Calibration task completed");

end % function main
