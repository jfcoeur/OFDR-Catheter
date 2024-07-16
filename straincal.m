function [x, sig] = straincal(filesref, filessamp, gen)

numrefs = length(filesref);
numsamps = length(filessamp);

for r = 1:numrefs

    ref = filesref(r);

    for s = 1:numsamps

        samp = filessamp(s);
        [x, sigout] = wvlshift(ref, samp, gen);
        sig(s,:,r) = sigout';    
    
    end % s = 1:numsamps
    
end % r = 1:numrefs

end % function straincal
