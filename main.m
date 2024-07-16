function [out] = main(in)

% Initialization %
clearvars
clc
close all
warning('off','all')
%%%%%%%%%%%%%%%%%%

% Inputs
dirraw = in.dirraw;
gen = in.gen;

for f = 1:3    

    % Directories
    dirref = dirraw(f) + "References" + filesep;
    dirsamp = dirraw(f) + "Samples" + filesep;
    categories = listfolders(dirsamp);
    dirsamp = dirsamp + categories;

    [x, sig] = resloop(dirref, dirsamp, categories, gen);

    field = ['fiber' num2str(f)];
    results.(field) = sig;

end % f = 1:3

% Saving
results.x = x;
filename = in.dirsave + "_sig.mat";
save(filename,"results")

out = [];
disp("Strain task completed");

end % function main
