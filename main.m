function [out] = main(in)

% Initialization
clearvars
clc
close all
warning('off','all')

in.gen.ang = in.gen.angles(in.dataset,:);
in.gen.curv = in.gen.curvatures(in.dataset,:);

% Step
switch in.step
    case 1
        [out.M, out.exp2, out.poly3] = step1(in.dirdata, in.gen);
        
    case 2
        [small, large, moy] = step2(in.M, in.exp2, in.poly3, in.gen);
        
        calib = struct('geo', moy, 'scoef', small, 'lcoef', large);
        filename = in.savepath + "_calib.mat";
        save(filename, "calib");

        out = [];
        disp("Calibration task completed");

    otherwise
      disp('Error')
end

end % function main
