function [tet1, g] = catloop(dirdata, gen)

% Strain signals file
filename = dirdata + "_sig.mat";
results = load(filename);

% Data
x = results.x;
sig1 = results.fiber1;
sig2 = results.fiber2;
sig3 = results.fiber3;

% Curvatures
curv = gen.curv;

% Curvature loop
for c = 1:length(curv)

    k = curv(c);    
    [gout{:,c}, tet1out{:,c}] = gauge(gen, sig1, sig2, sig3, c);
    
end % c = 1:length(curv)

% Resolution loop
for r = 1:length(gen.res)

    for k = 1:length(curv)
    
        temp_g = gout{r,k};
        temp_tet1 = tet1out{r,k}        
        Mg(:,:,k) = temp_g;
        Mtet1(:,:,k) = temp_tet1;
    
    end % k = 1:length(curv)
    
    g{r} = Mg;
    tet1{r} = Mtet1;

end % r = 1:length(gen.res)

end % function catloop
