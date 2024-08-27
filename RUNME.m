% Initialization %
clearvars
clc
close all
warning('off','all')
%%%%%%%%%%%%%%%%%%

% TODO
task = "Validation"; % Validation
rawname = "";
loadname.sig = "Calibration";
loadname.calib = "Calibration";
savename = "Calibration";

% Directories
directories = getdir(task, rawname, loadname, savename);

% Inputs
in = inputs(task, directories);

% Task execution
cd(directories.functions)
out = main(in);