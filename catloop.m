function [g, tet1] = catloop(dirload, gen)

% Strain signals file
filename = dirload.sig + "_sig.mat";
results = load(filename).results;

% Data
x = results.x;
sig1 = results.fiber1;
sig2 = results.fiber2;
sig3 = results.fiber3;

% Curvatures
curv = gen.curv;
exclude = curv(1:2); % 1:2 2:3 [1,3]

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

    Mg = [];
    Mtet1 = [];

    for k = 1:size(gout,1)
    
        temp_g = gout{k,r};
        temp_tet1 = tet1out{k,r};        
        Mg(:,:,k) = temp_g;
        Mtet1(:,:,k) = temp_tet1;
    
    end % k = 1:size(gout,1)

    g{r} = mean(Mg,3); % {r}
    tet1{r} = mean(Mtet1,3); % {r}

    % xval = x{r};
    % xval = xval(1:length(g));

    % gval = mean(g(:,1:6),2);
    % tet1val = mean(tet1(:,1:6),2);

    % gval = g(:,1);
    % tet1val = tet1(:,1);

    % subplot(1,2,1)
    % plot(xval, gval, 'LineWidth', 3)
    % title('K_\epsilon', 'FontSize', 40)
    % xlabel('Position [m]', 'FontSize', 40)
    % ylabel('Amplitude', 'FontSize', 40)
    % set(gca, 'FontSize', 40)
    % 
    % subplot(1,2,2)
    % plot(xval, tet1val-360, 'LineWidth', 3)
    % title('\phi_1', 'FontSize', 40)
    % xlabel('Position [m]', 'FontSize', 40)
    % ylabel('Amplitude (deg)', 'FontSize', 40)
    % set(gca, 'FontSize', 40)    

end % r = 1:length(gen.res)

end % function catloop