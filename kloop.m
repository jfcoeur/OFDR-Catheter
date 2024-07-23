function [Mxyz, Mk, Malpha, Merr] = kloop(dirload, gen)

% Strain signals file
filename = dirload + "_sig.mat";
results = load(filename).results;

% Data
x = results.x;
sig1 = results.fiber1;
sig2 = results.fiber2;
sig3 = results.fiber3;

% Calibration file
filecalib = dirload + "_calib.mat";
calib = load(filecalib).calib;

% Curvatures
curv = gen.curv;

% Curvature loop
for c = 1:length(curv)

    [xyz(c,:), k(c,:), alpha(c,:), err(c,:,:)] = shape(calib, gen, x, sig1, sig2, sig3, c);

end % c = 1:length(curv)

% Resolution loop
for r = 1:length(gen.res)

    for c = 1:size(xyz,1)
    
        temp = xyz{c,r};
        mxyz(:,:,:,:,c) = temp; 
        
        temp = k{c,r};
        mk(:,:,:,c) = temp; 
        
        temp = alpha{c,r};
        malpha(:,:,:,c) = temp; 
        
        for ref = 1:size(err,3)
            temp = err{c,r,ref};
            merr{ref,c} = temp;
        end % ref = 1:size(err,3)   
        
    end % c = 1:size(xyz,1)
    
    Mxyz{r} = mxyz;
    Mk{r} = mk;
    Malpha{r} = malpha;
    Merr(r,:,:) = merr;

end % r = 1:length(gen.res)

end % function kloop
