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

        for s = 1:7 % 1:size(f1c,1)

            sig1 = f1c(s,:,ref);
            sig2 = f2c(s,:,ref);
            sig3 = f3c(s,:,ref);   
         
            % Curvature & orientation
            [ktemp, alphatemp] = k_alpha(sig1, sig2, sig3, r1, r2, r3, tet1, tet12, tet23);
            alphatemp = deg2rad(alphatemp);
            alphatemp = unwrap(alphatemp);
            alphatemp = rad2deg(alphatemp);
    
            % Curvature correction
            ktemp = ktemp./g;            
            
            % 3D coordinates
            [kout(s,:,ref), alphaout(s,:,ref)] = paramfilt(r, ktemp, alphatemp, gen);
            xyzout = tricoord(x, kout(s,:,ref), alphaout(s,:,ref));

            % Errors
            [errout, xyzr, xyze_temp] = errors(gen, x, xyzout, kout(s,:,ref), alphaout(s,:,ref), c);
            xyze(s,:,:,ref) = xyze_temp;
            moy(s,ref) = errout(4,1); % mean(errout,"all");
            Merr(:,:,s,ref) = errout;

        end % s = 1:size(f1c,1)
    
    end % ref = 1:size(f1c,3)

    [err(:,:,:,r), xyz_min, k_min, alpha_min] = refmin(moy, Merr, kout, alphaout, xyze);
    % shapeplot(xyz_min, xyzr, 20, 'Drum size: 25.34m^{-1}');

    k{r} = k_min;
    alpha{r} = alpha_min;
    xyz{r} = xyz_min;
    
end % r = 1:length(gen.res)

end % function shape
