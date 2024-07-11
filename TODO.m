%% TODO
% General
task = "";
loadname = "";
savename = "";

% Directories
directories = getdir(task, loadname, savename);

% Inputs
in = inputs(task, directories);

% Task execution
cd(directories.functions)
out = main(in);
