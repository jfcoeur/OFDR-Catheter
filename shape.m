function [xyz, k, alpha, err] = shape(calib, gen, xin, s1, s2, s3, c)

% Calibration parameters
tet12 = gen.tet12;
tet23 = gen.tet23;
r1 = gen.r1;
r2 = gen.r2;
r3 = gen.r3;

for r = 1:length(gen.res)

    f1 = s1{r};
    f2 = s2{r};
    f3 = s3{r};

    fields = fieldnames(f1);

    f1c = f1.(fields{c});
    f2c = f2.(fields{c});
    f3c = f3.(fields{c});
    
    x_temp = xin{r};
    tet1_temp = calib(r).tet1;
    g_temp = calib(r).g;
    
    kout = [];
    alphaout = [];
    xyze = [];

    for ref = 1:size(f1c,3)

        tet1 = tet1_temp(:,ref)';
        g = g_temp(:,ref)';
        x = x_temp(1:length(g));

        for s = 1:size(f1c,1)

         	sig1 = f1c(s,:,ref);
        	sig2 = f2c(s,:,ref);
        	sig3 = f3c(s,:,ref);   
         
            % Curvature & orientation
            [ktemp, alphaout] = k_alpha(sig1, sig2, sig3, r1, r2, r3, tet1, tet12, tet23);
            alphaout = deg2rad(alphaout);
            alphaout = unwrap(alphaout);
            alphaout(s,:,ref) = rad2deg(alphaout);
    
            % Curvature correction
            kout(s,:,ref) = ktemp./g;            
            
            % 3D coordinates
            xyzout = tricoord(x, kout(s,:,ref), alphaout(s,:,ref))     
        
        end % s = 1:size(f1c,1)

        % Errors
        [errout, xyzr, xyze(s,:,:,ref)] = errors(gen, x, xyzout, kout(s,:,ref), alphaout(s,:,ref), c);
        moy(s,ref) = mean(errout,"all");
        Merr(:,:,s,ref) = errout;        
    
    end % ref = 1:size(f1c,3)

    k{r} = kout;
    alpha{r} = alphaout;
    xyz{r} = xyzout;
    err(r,:) = errout;
    
end % r = 1:length(gen.res)

end % function shape
