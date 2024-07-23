function [g, tet1ave] = gauge(gen, s1, s2, s3, c)

% Initial parameters
alpha = 0;
r1 = gen.r1; % [m]  
r2 = gen.r2; % [m] 
r3 = gen.r3; % [m] 
tet12 = gen.tet12; % [deg] 
tet23 = gen.tet23; % [deg]

for r = 1:length(gen.res)

    f1 = s1{r};
    f2 = s2{r};
    f3 = s3{r};

    fields = fieldnames(f1);

    f1c = f1.(fields{c});
    f2c = f2.(fields{c});
    f3c = f3.(fields{c});

    k = [];
    tet1 = [];

    for ref = 1:size(f1c,3)

        for a = 1:size(f1c,1)
        
        	sig1 = f1c(a,:,ref);
        	sig2 = f2c(a,:,ref);
        	sig3 = f3c(a,:,ref);
        	
        	[k(a,:), tet1(a,:)] = k_tet1(alpha, sig1, sig2, sig3, r1, r2, r3, tet12, tet23);            
        
        end % a = 1:size(sig1,1)

        kave = mean(k,1);
        tet1ave(:,ref) = mean(tet1,1);
        g(:,ref) = kave./gen.curv(c);
    
    end % ref = 1:size(f1,3)
    
    [g{r}, tet1ave{r}] = paramfilt(r, g, tet1ave, gen);    
        
end % r = 1:length(gen.res)

end % function gauge
