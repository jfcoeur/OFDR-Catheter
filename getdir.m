function [directories] = getdir(task, rawname, loadname, savename)

switch filesep
    case "\"
        dirmain = "D:\";        
    case "/"
        dirmain = "/media/jfcoeur/T7 Shield/";
    otherwise
        disp('Error in operating system')
end

% Matlab directory
dircodes = dirmain + "Matlab codes" + filesep + "OFDR-Catheter" + filesep;

% Task directory
dirtask = dircodes + task + filesep;

% Needle directory
dircatheter = dirmain + "Distributed catheter" + filesep;

% Raw data directory
dirraw = dircatheter + "Raw data" + filesep + rawname + filesep;

if task == "Strain"
    fibers = fun(dirraw);
    dirraw = dirraw + fibers;
end

% Processed data directory
dirproc = dircatheter + "Processed data" + filesep;

% Loading directory
dirload.sig = dirproc + loadname.sig;
dirload.calib = dirproc + loadname.calib;

% Saving directory
dirsave = dirproc + savename;

% Output structure
directories = struct('functions', dirtask, 'raw', dirraw, 'load', dirload, 'save', dirsave);

%%%%%%%%
function [fibers] = fun(direct)

list = dir(direct);
names = string({list.name});
names = names(3:end);
folderflags = [list.isdir];
folderflags = folderflags(3:end);
numf = length(folderflags);

if all(folderflags,'all') && numf == 3
    fibers = names + filesep;
else
    fibers = "";
end

end % function fiberpaths
%%%%%%%%

end % function getdir
