function [g, tet1] = catloop(dirload, gen)

% Strain signals file
filename = dirload + "_sig.mat";
results = load(filename).results;

% Data
x = results.x;
sig1 = results.fiber1;
sig2 = results.fiber2;
sig3 = results.fiber3;

% Curvatures
curv = gen.curv;
exclude = []; %%%% Enter values to exclude

% Curvature loop
i = 1;
for c = 1:length(curv)

    k = curv(c);
    bool = ismember(k, exclude);
    
    if bool
        continue;
    end  
    
    [gout(i,:), tet1out(i,:)] = gauge(gen, sig1, sig2, sig3, c);

    i  = i + 1;
    
end % c = 1:length(curv)

% Resolution loop
for r = 1:length(gen.res)

    for k = 1:size(gout,1)
    
        temp_g = gout{r,k};
        temp_tet1 = tet1out{r,k};        
        Mg(:,:,k) = temp_g;
        Mtet1(:,:,k) = temp_tet1;
    
    end % k = 1:size(gout,1)
    
    g{r} = mean(Mg,3);
    tet1{r} = mean(Mtet1,3);

end % r = 1:length(gen.res)

end % function catloop
