function [out] = main(in)

% Initialization
clearvars
clc
close all
warning('off','all')

gen = in.gen;
gen.ang = gen.angles(in.dataset,:);
gen.curv = gen.curvatures(in.dataset,:);

[out.xyz, out.k, out.alpha, out.err] = kloop(in.dirload, gen)

% Step
disp("Validation task completed");

end % function main
