function [gen] = general(needle)

gen.res = [0.001 0.003 0.005 0.008 0.01]; % Resolution [m]
gen.wino = [9 3 2 1 1]; % Outlier window sizes
gen.wins = [9 3 2 1 1]; % Smoothing window sizes

% Geometrical parameters


% Indices
idx_full = [41:410; 10:379; 15:384];
idx_sin = [102:358; 71:327; 76:332];
idx_exp = [150:358; 119:327; 124:332];

end % function general

