%% Segmentation
% Claudia Carcamo 
% 03 - 14 - 2020 
%% save the directory information here for the rest
% REQUIREMENTS
    % FUNCTION: my_directory_function('color',)
    % Must Start In Directory Of Interest
    % Directory must be made in jupyter notebook script
my_directory = 'C:\Users\carca\OneDrive - Johns Hopkins University\Ha_CCarcamo\Data\Projects\SWR1 Project\sliding + Cas9 marker\2020-03-04-Cy5_dCas9_Cy3_SWR1\';
cd(my_directory)
my_directory_function('red', 'green');
%% Extract and save kymograph information
% REQUIREMENTS
    % FUNCTION: my_kymodata_structure --> no input arguments
    % Must Start In "Container" directory
    % Final data structure includes all colors 
my_directory = 'C:\Users\carca\OneDrive - Johns Hopkins University\Ha_CCarcamo\Data\Projects\SWR1 Project\sliding + Cas9 marker\2020-03-04-Cy5_dCas9_Cy3_SWR1\';
cd(my_directory)
cd(container)
my_kymodata_structure
%% segment different color channels
% REQUIREMENTS
    % FUNCTION: structure_name = my_segment_kymos(start_var, end_var, which_color)
    % Must Start In "Container" directory
my_directory = 'C:\Users\carca\OneDrive - Johns Hopkins University\Ha_CCarcamo\Data\Projects\SWR1 Project\sliding + Cas9 marker\2020-03-04-Cy5_dCas9_Cy3_SWR1\';
cd(my_directory)
cd([my_directory, 'container'])
load('data.mat')
red_segmentation = my_segment_kymos(1, length(data), 'green');