function [x, sig, ite, hh] = straincal(filesref, filessamp, ite, itetot, hh)

numrefs = length(filesref);
numsamps = length(filessamp);

for r = 1:numrefs

    ref = filesref(r);

    for s = 1:numsamps

        samp = filessamp(s);
        [x, sigout] = wvlshift(ref, samp);
        sig(s,:,r) = sigout;

        % Waitbar
        ite = ite + 1;
        waitbar(ite/itetot, hh)         
    
    end % s = 1:numsamps
    
end % r = 1:numrefs

end % function straincal
