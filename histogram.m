%%
close all

% for i = 15:5:45
% specifier = 'velocity';
% % variables
% condition1 = 'ATP 70mM KCl';
% color1 = [0    0.4470    0.7410];% Blue
% color1_n = 'blue';
% first_compare = Dsalt(saltsalt ==70);
% str1 = [condition1, ' (', color1_n, ') n= ', num2str(length(first_compare))];
% 
% condition2 = 'ATP 200mM KCl';
% color2 = [0.8500    0.3250    0.0980];%Orange
% color2_n = 'orange';
% second_compare =  Dsalt(saltsalt ==200);
% str2 = [condition2, ' (', color2_n, ') n= ', num2str(length(second_compare))];

% condition3 = 'ATP 25mM KCl';
% color3 = [ 0.9290    0.6940    0.1250]; %yellow
% color3_n = 'yellow';
% third_compare = Dr2greater08_25mMKCl_noNaN;
% str3 = [condition3, ' (', color3_n, ') n= ', num2str(length(third_compare))];

condition2 =  'ATP 200mM KCl';
color2 = [0.4940    0.1840    0.5560]; %purple
color2_n = 'purple';
second_compare =  Dsalt(saltsalt ==200);
str2 = [condition2, ' (', color2_n, ') n= ', num2str(length(second_compare))];

% condition2 = 'Cas9';
% color1 = [0.4660    0.6740    0.1880]; %green
% color1_n = 'green';
% first_compare = Cas9_5pND;

% condition2 = 'ATP 25mM KCl' ;
% color2 = [0.6350    0.0780    0.1840];
% color2_n = 'dark red';
% second_compare =  randsample(diffusioncoefficientsATP,length(diffusioncoefficientsgamma));
% second_compare = Dsalt(saltsalt ==25);
% str2 = [condition2, ' (', color2_n, ') n= ', num2str(length(second_compare))];

binlims = [0, .14];
% binlims = [0, 0.125];

bins = 30;
str_title = ['' condition2];%, ' and ', condition2];
% str_final = [str_title, ' bins equals ', num2str(bins), ' ', specifier];

figure 
% histogram(first_compare, bins,  'BinLimits', binlims, 'FaceColor' , color1, 'Normalization', 'probability');
% hold on
histogram(second_compare, bins,'BinLimits', binlims,'FaceColor', color2,'Normalization', 'probability');
% histogram(third_compare, bins,  'BinLimits', binlims, 'FaceColor' , color3, 'Normalization', 'probability');

% Annotate Figure 
dim = [.5 .6 .3 .3];
str = [str2];% , newline, str2]%, newline, str3];   

annotation('textbox',dim,'String',str,'FitBoxToText','on','LineStyle', ...
    'none');
% xlabel('velocity: nm/sec');
xlabel('diffusion coefficient um^2/sec');
ylabel('% of traces');
title(str_title);
hold off

% saveas (gcf, strcat(str_final, '.png'), 'png')
% % end