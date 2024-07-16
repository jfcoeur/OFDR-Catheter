function [gen] = getidx(gen, field, f)

switch field
    case {'Full', 'Large', 'Medium', 'Small'}
        idx_temp = gen.Full;
    case {'Sinus', 'Sinus2D', 'Sinus3D'}
        idx_temp = gen.Sinus;
    case {'Exponential', 'Exponential2D', 'Exponential3D'}
        idx_temp = gen.Exponential;
    otherwise
        disp('Field error')    
end

gen.idx = idx_temp(f,:);

end % function getidx
