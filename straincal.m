function [x, sig, ite, hh] = straincal(filesref, filessamp, gen, ite, itetot, hh)

numrefs = length(filesref);

for r = 1:numrefs
    ref = filesref(r);
    [x, sig(:,:,r), ite, hh] = fun(ref, filessamp, gen, ite, itetot, hh);
end % r = 1:numrefs

%%%%%%%%
function [x, sig, ite, hh] = fun(ref, samps, gen, ite, itetot, hh)

    for s = 1:length(samps)

        samp = samps(s);

        [x, sigout] = time2strain(ref, samp, gen);
        sig(s,:) = sigout;

        % Waitbar
        ite = ite + 1;
        waitbar(ite/itetot, hh) 
    
    end % s = 1:length(samps)
  
end % function fun
%%%%%%%%

end % function straincal
