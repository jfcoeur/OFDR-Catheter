function [x, sigout] = strainfilt(r, x, sig, gen)

res = gen.res(r);
lx = x(2) - x(1);
sampling = res/lx;

for s = 1:size(sig,1)

    for ref = 1:size(sig,3)
    
        x = x(1:sampling:end);
        sigout(s,:,ref) = sig(s,1:sampling:end,ref);
        sigout(s,:,ref) = filloutliers(sigout(s,:,ref), "nearest", "movmedian", gen.wino(r));
        sigout(s,:,ref) = smoothdata(sigout(s,:,ref), "rlowess", gen.wins(r));        
        
    end % ref = 1:size(sig,3)
    
end % s = 1:size(sig,1)

end % function strainfilt
