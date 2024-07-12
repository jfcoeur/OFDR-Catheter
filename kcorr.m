function [k] = kcorr(gen, k, r)

idx = gen.idx;
kprox = mean(k(idx));

% Gauge determination
g = gauge(kprox, r);
k = k./g;

end % function kcorr
