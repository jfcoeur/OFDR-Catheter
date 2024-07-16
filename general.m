function [gen] = general()

gen.res = [0.001 0.003 0.005 0.008 0.01]; % Resolution [m]
gen.wino = [9 3 2 1 1]; % Outlier window sizes
gen.wins = [9 3 2 1 1]; % Smoothing window sizes

% Geometrical parameters
gen.r1 = 70e-6; % [m]  % 89.5e-6
gen.r2 = 70e-6; % [m] 
gen.r3 = 70e-6; % [m] 
gen.tet12 = 240; % [deg] 
gen.tet23 = -120; % [deg]

% Calibration curvatures
radius = [24.8 51.4 66]*1e-2/(2*pi);
gen.curv = 1./radius;

% Indices
gen.Sinus = [2026:7151; 1380:6505; 1508:6633];
gen.Exponential = [2967:7152; 2324:6509; 2460:6645];
gen.Full = gen.Sinus;

% Lengths
% Lfull = ;
% Lsin = ;
% Lexp = ;

end % function general
