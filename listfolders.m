function [folders] = listfolders(path)

list = dir(path);
list = {list(3:end)};
folderflags = [list.isdir];

if all(folderflags,'all')
    folders = cellfun(@convertCharsToStrings, {list.name}) + filesep;
else
    folders = "";
end

end % function listfolders
