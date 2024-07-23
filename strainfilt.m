function [x, sigout] = strainfilt(r, x, sig, gen)

res = gen.res(r);
lx = x(2) - x(1);
sampling = round(res/lx);
x = x(1:sampling:end);

for s = 1:size(sig,1)

    for ref = 1:size(sig,3)
    
        sig(s,:,ref) = filloutliers(sig(s,:,ref), "nearest", "movmedian", sampling);
        sig(s,:,ref) = smoothdata(sig(s,:,ref), "rlowess", sampling);
        sigout(s,:,ref) = sig(s,1:sampling:end,ref);      
        
    end % ref = 1:size(sig,3)
    
end % s = 1:size(sig,1)

end % function strainfilt
