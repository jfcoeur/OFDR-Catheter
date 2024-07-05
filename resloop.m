function [x, sig] = resloop(dirref, dirsamp, categories, gen, itetot)

numres = length(gen.res)

for r = 1:numres

    % Waitbar
    hh = waitbar(0);
    ite = 0;

    if ~isempty(categories)

        for c = 1:length(categories)
        
            [xout, siginit] = fun(dirref, dirsamp(c), gen, ite, itetot, hh, r);
            sigout(:,:,:,c) = siginit;
            
        end % c = 1:length(categories)
    
    else
        [xout, sigout] = fun(dirref, dirsamp, gen, ite, itetot, hh, r);
    end

    x{r} = xout;
    sig{r} = sigout;
    close(hh)

    % Display progress
    prog = string(r) + "/" + string(numres);
    fprintf('%s\r', prog);

end % r = 1:numres

%%%%%%%%
function [x, sig] = fun(dirref, dirsamp, gen, ite, itetot, hh, r)

    % Files paths
    [filesref, filessamp] = ovapaths(dirref, dirsamp);
    
    % Strain calculation
    [x, sig, ite, hh] = straincal(filesref, filessamp, ite, itetot, hh);
    
    % Filtering    
    sig = strainfilt(r, x, sig, gen);

end % function fun
%%%%%%%%

end % function resloop
