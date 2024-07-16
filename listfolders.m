function [folders] = listfolders(path)

list = dir(path);
names = string({list.name});
names = names(3:end);
folderflags = [list.isdir];
folderflags = folderflags(3:end);

if all(folderflags,'all')
    folders = names + filesep;
else
    folders = "";
end

end % function listfolders
