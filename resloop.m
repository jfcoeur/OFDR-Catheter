function [x, sig] = resloop(dirref, dirsamp, categories, gen)

numres = length(gen.res);

for r = 1:numres

    sigout = [];

    if ~isempty(categories)

        for c = 1:length(categories)
        
            field = char(categories(c));
            field = field(1:end-1);
            gen.idx = gen.(field);   

            [xout, siginit] = fun(dirref, dirsamp(c), gen, r);   
            sigout.(field) = siginit;
            
        end % c = 1:length(categories)
    
    else
        [xout, sigout] = fun(dirref, dirsamp, gen, r);
    end

    x{r} = xout;
    sig{r} = sigout;

end % r = 1:numres

%%%%%%%%
function [x, sig] = fun(dirref, dirsamp, gen, r)

    % Files paths
    [filesref, filessamp] = ovapaths(dirref, dirsamp);
    
    % Strain calculation
    [x, sig] = straincal(filesref, filessamp);
    
    % Filtering    
    [x, sig] = strainfilt(r, x, sig, gen);

end % function fun
%%%%%%%%

end % function resloop
