function [g, tet1] = step1(dirdata, gen)

% Strain signals file
filename = dirdata + "_sig.mat";
results = load(filename);

% Data
x = results.x;
sig1 = results.fiber1;
sig2 = results.fiber2;
sig3 = results.fiber3;

% Exclude for validation
exclude = [1, 2, 3];

% Samples loop
i = 1;
for c = 1:length(curv)

    k = curv(c);
    bool = ismember(k, exclude);
    
    if bool
        continue;
    end
    
    % Experimental gauge
    g = gauge(gen, sig1, sig2, sig3, c);
    
    % Gauge fitting
    [exp2(i,:,:), poly3(i,:,:)] = gtrend(gen, x, g, curv(c));
    
    % Geometrical parameters
    Mout{:,i} = geoparam(gen, sig1, sig2, sig3, x, g, c);
    
    i  = i + 1;
    
end % c = 1:length(curv)

% Resolution loop
for r = 1:length(gen.res)

    for k = 1:size(Mout,2)
    
        p = Mout{r,k};
        m(:,:,k) = p;         
    
    end % k = 1:size(Mout,2)
    
    M{r} = m;

end % r = 1:length(gen.res)

end % function step1
