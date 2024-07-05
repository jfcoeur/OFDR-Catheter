function [filesref, filessamp] = ovapaths(dirref, dirsamp)

% References
filesref = getpaths(dirref + "/*.csv");

% Samples
filessamp = getpaths(dirsamp + "/*.csv");

%%%%%%%%
function [paths] = getpaths(direct)

    list = dir(direct); 
    names = {list.name};
    names = cellfun(@convertCharsToStrings,names);
    folders = {list.folder};
    folders = cellfun(@convertCharsToStrings,folders);
    paths = append(folders,"/",names);
    
end % function getpaths
%%%%%%%%

end % function ovapaths
