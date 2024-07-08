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
    g = gauge(gen, sig1, sig2, sig3, c);
    
end % c = 1:length(curv)

% Resolution loop
for r = 1:length(gen.res)

    for k = 1:size(Mout,2)
    
        p = Mout{r,k};
        m(:,:,k) = p;         
    
    end % k = 1:size(Mout,2)
    
    M{r} = m;

end % r = 1:length(gen.res)

end % function catloop
