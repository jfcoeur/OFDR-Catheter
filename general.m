function [gen] = general()

gen.res = [0.001 0.003 0.005 0.008 0.01]; % Resolution [m]
gen.wino = [9 3 2 1 1]; % Outlier window sizes
gen.wins = [9 3 2 1 1]; % Smoothing window sizes
gen.curvatures = [0.5 1.6 2.0 2.5 3.2 4.0; 0.25 0.8 1.0 1.25 3.125 NaN];

% Geometrical parameters
gen.r1 = 70e-6; % [m]  % 89.5e-6
gen.r2 = r1; % [m] 
gen.r3 = r1; % [m] 
gen.tet12 = 240; % [deg] 
gen.tet23 = -120; % [deg]

% Indices
idx_full = [41:410; 10:379; 15:384];
idx_sin = [102:358; 71:327; 76:332];
idx_exp = [150:358; 119:327; 124:332];

% Lengths
Lfull = ;
Lsin = ;
Lexp = ;

end % function general
