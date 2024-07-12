function [in] = inputs(task, directories)

gen = general;

switch task
    case "Strain"
        in = strain(directories, gen);
        
    case "Calibration"
        in = calib(directories, gen);
    
    case "Validation"
        in = valid(directories, gen);
    
    case "Shape"

    
    otherwise
        disp('Error in task name')
end

%%%%%%%%
function [out] = strain(directories, gen)
    
    out.dirraw = directories.raw;
    out.gen = gen;
    out.dirsave = directories.save;

end % function strain
%%%%%%%%

%%%%%%%%
function [out] = calib(directories, gen)

    out.gen = gen;
    out.dirload = directories.load;
    out.dirsave = directories.save;

end % function calib
%%%%%%%%

%%%%%%%%
function [out] = valid(directories, gen)

    out.gen = gen;
    out.dirload = directories.load;

end % function valid
%%%%%%%%

%%%%%%%%
function [out] = shape()
end % function shape
%%%%%%%%

end % function inputs
