% My goal is to perform 2D guassian fitting to locate position of dCas9 on
% the lambda DNA. This is using scan data. Eventually, I would like to
% correlate the FWHM for different z-positions, once I find where this
% information is stored in the metadata. 

my_directory = 'C:\Users\carca\OneDrive - Johns Hopkins University\Ha_CCarcamo\Data\Projects\SWR1 Project\cas9\point spread functions for dCas9 data\20200310 red dCas9 cy5 specific binding\';
cd(my_directory)
path_start = strcat(pwd, '\');
listing = dir();
stringis = strcat(listing.name);
if not(contains(stringis, 'container'))
    mkdir container;
else
    rmdir container s;
    mkdir container;
end
container_path_dir = [path_start,'container\'];
cd(container_path_dir)
save('container_path_dir', 'container_path_dir');
save('path_start', 'path_start');
% scan_mat_green_dir = [path_start,'scan_mat_green\'];
% save('scan_mat_green_dir', 'scan_mat_green_dir');
    scan_mat_red_dir = [path_start,'scan_mat_red\'];
    save('scan_mat_red_dir', 'scan_mat_red_dir');
% change here%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
scantime_dir = [path_start,'scantime\'];
save('scantime_dir', 'scantime_dir');
pixeltime_dir = [path_start,'pixeltime\'];
save('pixeltime_dir', 'pixeltime_dir');
pixelsize_dir = [path_start,'pixelsize\'];
save('pixelsize_dir', 'pixelsize_dir');
disp('Done');
%%
% Initialize
scan_name = {}; 
scan_file_name = {};
file_names = {};
%Load matlab structures containing path information
mat = dir('*.mat'); 
for q = 1:length(mat)
    load(mat(q).name);
end
% red_scan = dir(scan_mat_red_dir);
% green_scan = dir(scan_mat_green_dir);
red_scan = dir(scan_mat_red_dir);
scantime = dir(scantime_dir);
pattern = [".", ".."];
counter = 1;
for i = 1:length(scantime) % Get name of kymos
    if not(startsWith(scantime(i).name, pattern))
    str = scantime(i).name;
    match = ["scantime_",".mat"];
    name = erase(str,match);
    scan_name{counter,1} = name;
    counter = counter +1;
    end
end

disp('....');
listing = dir();
stringis = strcat(listing.name);
if contains(stringis, 'green')
  cd(scan_mat_green_dir)
  counter = 1;
    for i = 1:length(green_scan) %Get file names of green kymos
        if not(startsWith(green_scan(i).name, pattern))
        name = green_scan(i).name;
        scan_file_name{counter,1} = name;
        counter = counter +1;
        end
    end
    for i = 1: length(scan_name) % Get kymo object array
        file_to_open = find(contains(scan_file_name,scan_name{i}));
        load (scan_file_name{file_to_open})
        scan_name{i,2} = double(green);
    end  
elseif contains(stringis, 'red')
    cd(scan_mat_red_dir)
    counter = 1;
    for i = 1:length(red_scan) %Get file names of green kymos
        if not(startsWith(red_scan(i).name, pattern))
        name = red_scan(i).name;
        scan_file_name{counter,1} = name;
        counter = counter +1;
        end
    end
    for i = 1: length(scan_name) % Get kymo object array
        file_to_open = find(contains(scan_file_name,scan_name{i}));
        load (scan_file_name{file_to_open})
        scan_name{i,2} = double(red);
    end  
end

disp('...');
cd(pixeltime_dir)
counter = 1;
pixeltime = dir(pixeltime_dir);
for i = 1:length(pixeltime) %Get file names of linetimes
    if not(startsWith(pixeltime(i).name, pattern))
    name = pixeltime(i).name;
    linetime_filename{counter,1} = name;
    counter = counter +1;
    end
end
for i = 1: length(scan_name) % Get linetimes
    file_to_open = find(contains(linetime_filename,scan_name{i}));
    load (linetime_filename{file_to_open})
    scan_name{i,3} = double(pixeltime);
end


cd(scantime_dir)
counter = 1;
for i = 1:length(scantime) %Get file names of linetimes
    if not(startsWith(scantime(i).name, pattern))
    name = scantime(i).name;
    linetime_filename{counter,1} = name;
    counter = counter +1;
    end
end
for i = 1: length(scan_name) % Get linetimes
    file_to_open = find(contains(linetime_filename,scan_name{i}));
    load (linetime_filename{file_to_open})
    scan_name{i,4} = double(scantime);
end
disp('..');


cd(pixelsize_dir)
pixelsize = dir(pixelsize_dir);

counter = 1;
for i = 1:length(pixelsize) %Get file names of linetimes
    if not(startsWith(pixelsize(i).name, pattern))
    name = pixelsize(i).name;
    linetime_filename{counter,1} = name;
    counter = counter +1;
    end
end
for i = 1: length(scan_name) % Get linetimes
    file_to_open = find(contains(linetime_filename,scan_name{i}));
    load (linetime_filename{file_to_open})
    scan_name{i,5} = double(pixelsize);
end
disp('.');

for i = 1:length(scan_name) % Save into a structured array
    scan_data(i).name = scan_name{i,1};
%     scan_data(i).green_scan = scan_name{i,2};
    scan_data(i).red_scan = scan_name{i,2};    
    scan_data(i).pixeltime = scan_name{i,3};
    scan_data(i).scantime = scan_name{i,4};
    scan_data(i).pixelsize = scan_name{i,5};
end
cd(container_path_dir)
save('scan_data.mat', 'scan_data');
disp('Done.');
%%


