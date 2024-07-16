function [out] = main(in)

[out.xyz, out.k, out.alpha, out.err] = kloop(in.dirload, in.gen)

% Step
disp("Validation task completed");

end % function main
