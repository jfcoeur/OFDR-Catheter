function [x, sig] = wvlshift(fileref, filesamp, gen)

% Reference and sample data
ref = importdata(fileref, '\t', 8);
samp = importdata(filesamp, '\t', 8);

% Light speed and ref. idx.
c = physconst('LightSpeed');
n = 1.444;

% Positions
t = ref.data(:,1);
x = c/n*t*1e-9/2;

% Wavelengths
refwav = ref.data(gen.idx,3);
sampwav = samp.data(gen.idx,3);

% Strain
sig = (sampwav - refwav)./refwav;

end % function wvlshift
