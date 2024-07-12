function [xyz, k, alpha, err] = shape(gen, xin, s1, s2, s3, moy, c)

ang = -gen.ang;

for r = 1:length(gen.res)    

    f1 = s1{r};
    f2 = s2{r};
    f3 = s3{r};
    x = xin{r};

    % Calibration parameters
    calib = moy{r};
    tet1 = calib(1,:);
    tet12 = calib(2,:);
    tet23 = calib(3,:);
    r1 = calib(4,:);
    r2 = calib(5,:);
    r3 = calib(6,:);    

    kout = [];
    alphaout = [];
    xyzout = [];    
    
    for a = 1:length(ang)
    
    	sig1 = f1(a,:,c);
    	sig2 = f2(a,:,c);
    	sig3 = f3(a,:,c);

        % Curvature & orientation
        [ktemp, alphaout(a,:)] = k&alpha(sig1, sig2, sig3, r1, r2, r3, tet1, tet12, tet23);

        % Curvature correction
        kout(a,:) = kcorr(gen, ktemp, r);
        
        % 3D coordinates
        xyzout(a,:,:) = 3Dcoord(x, kout(a,:), alphaout(a,:))
    	    
    end % a = 1:length(gen.ang)
    
    k{r} = kout;
    alpha{r} = alphaout;
    xyz{r} = xyzout;
    
    % Errors
    err{r} = errors(gen, x, xyzout, kout, alphaout, c);    
    
end % r = 1:length(gen.res)

end % function shape
