function [out] = main(in)

% Initialization
clearvars
clc
close all
warning('off','all')

[out.xyz, out.k, out.alpha, out.err] = kloop(in.dirload, in.gen)

% Step
disp("Validation task completed");

end % function main
