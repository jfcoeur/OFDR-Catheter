function [Mxyz, Mk, Malpha, Merr] = kloop(dirload, gen)

% Strain signals file
filename = dirload + "_sig.mat";
results = load(filename);

% Data
x = results.x;
sig1 = results.fiber1;
sig2 = results.fiber2;
sig3 = results.fiber3;

% Calibration file
filecalib = dirload + "_calib.mat";
calib = load(filecalib).moy;

% Curvatures
curv = gen.curv;

% Curvature loop
for c = 1:length(curv)

    k = curv(c);
    [xyz{:,c}, k{:,c}, alpha{:,c}, err{:,c}] = shape(dirload, gen, x, sig1, sig2, sig3, calib, c);

end % c = 1:length(curv)

% Resolution loop
for r = 1:length(gen.res)

    for k = 1:size(xyz,2)
    
        temp = xyz{r,k};
        mxyz(:,:,:,:,k) = temp; 
        
        temp = k{r,k};
        mk(:,:,:,k) = temp; 
        
        temp = alpha{r,k};
        malpha(:,:,:,k) = temp; 
        
        temp = err{r,k};
        merr(:,:,:,k) = temp;   
        
    end % k = 1:size(xyz,2)
    
    Mxyz{r} = mxyz;
    Mk{r} = mk;
    Malpha{r} = malpha;
    Merr{r} = merr;

end % r = 1:length(gen.res)

end % function kloop
