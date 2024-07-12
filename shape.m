function [xyz, k, alpha, err] = shape(dirload, gen, xin, s1, s2, s3, c)

% Calibration parameters
tet1 = gen.tet1;
tet12 = gen.tet12;
tet23 = gen.tet23;
r1 = gen.r1;
r2 = gen.r2;
r3 = gen.r3;

for r = 1:length(gen.res)

    f1 = s1{r};
    f2 = s2{r};
    f3 = s3{r};
    x = xin{r};
    
    kout = [];
    alphaout = [];
    xyzout = [];

    for ref = 1:size(f1,3)

        for s = 1:size(f1,1)

         	sig1 = f1(s,:,ref,c);
        	sig2 = f2(s,:,ref,c);
        	sig3 = f3(s,:,ref,c);   
         
            % Curvature & orientation
            [ktemp, alphaout(s,:,ref)] = k&alpha(sig1, sig2, sig3, r1, r2, r3, tet1, tet12, tet23);
    
            % Curvature correction
            kout(s,:,ref) = kcorr(dirload, k, r, ref);
            
            % 3D coordinates
            xyzout(s,:,:,ref) = 3Dcoord(x, kout(s,:,ref), alphaout(s,:,ref))     
        
        end % s = 1:size(f1,1)

        % Errors
        errout(:,:,ref) = errors(gen, x, xyzout(:,:,:,ref), kout(:,:,ref), alphaout(:,:,ref), c);
    
    end % ref = 1:size(f1,3)

    k{r} = kout;
    alpha{r} = alphaout;
    xyz{r} = xyzout;
    err{r} = errout;
    
end % r = 1:length(gen.res)

end % function shape
