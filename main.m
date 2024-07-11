function [] = main(in)

% Initialization %
clearvars
clc
close all
warning('off','all')
%%%%%%%%%%%%%%%%%%

% Inputs
dirdata = in.dirdata;
gen = in.gen;

results = struct;

for f = 1:3    

    % Directories
    dirref = dirdata(f) + "/References";
    dirsamp = dirdata(f) + "/Samples";
    categories = listfolders(dirsamp);
    dirsamp = dirsamp + categories;

    [x, sig] = resloop(dirref, dirsamp, categories, gen, in.itetot);

    field = ['fiber' num2str(f)];
    results.(field) = sig;

end % f = 1:3

% Saving
results.x = x;
filename = in.dirsave + "_sig.mat";
save(filename,"results")

disp("Strain task completed");

end % function main
