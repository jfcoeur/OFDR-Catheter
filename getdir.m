function [directories] = getdir(task, loadname, savename)

switch filesep
    case "\"
        dirmain = "D:\";        
    case "/"
        dirmain = "/home/jfcoeur/Documents/";
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
dirraw = dircatheter + "Raw data" + filesep + savename + filesep;

if task == "Strain"
    fibers = fun(dirraw);
    dirraw = dirraw + fibers;
end

% Processed data directory
dirproc = dircatheter + "Processed data" + filesep;

% Loading directory
dirload = dirproc + loadname;

% Saving directory
dirsave = dirproc + savename;

% Output structure
directories = struct('functions', dirtask, 'raw', dirraw, 'processed', dirproc, 'load', dirload, 'save', dirsave);

%%%%%%%%
function [fibers] = fun(direct)

list = dir(direct);
list = [list.isdir];
folderflags = list(3:end);
numf = length(folderflags);

if all(folderflags,'all') && numF == 3
    fibers = cellfun(@convertCharsToStrings, {list.name}) + filesep;
else
    fibers = "";
end

end % function fiberpaths
%%%%%%%%

end % function getdir
