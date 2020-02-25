% Experimental Data Analysis: Lecture 7
close all, clear all, clc

%% MATLAB EXAMPLE 1 %%
% Two-way ANOVA

% load data  
data = [
1	1	5
1	1	7
1	1	8
1	2	5
1	2	5
1	2	4
2	1	8
2	1	17
2	1	11
2	2	10
2	2	15
2	2	10
3	1	29
3	1	22
3	1	18
3	2	18
3	2	13
3	2	11
];

group = data(:,1); % 1st Factor: Group
sex = data(:,2); % 2nf Factor: Sex
sample = data(:,3); % Individual scores

% calculate two-way ANOVA
[p table stats terms] = anovan(sample, {group, sex},'varnames',{'group', 'sex'},'model','interaction');

% calculate post-hoc differences
[c,m,h,nms] = multcompare(stats,'dimension',1,'ctype','bonferroni','alpha',0.05)

%% MATLAB EXAMPLE 2 %%
% Three-way ANOVA

load meanF0; % load data for mean F0
load meanINT; % load data for mean Intensity
load duration; % load data for duration of word
load rozsahF0; % load data for range of F0
load rozsahINT; % load data for range of Intensity
load SPI; % load data for Stress Patterns Index

variable = SPI; % choose the variable you want to analyze

data = variable(:,1); % variable
speaker = variable(:,2); % 1st Factor: Speaker Group
stress = variable(:,3); % 2nd Factor: Stress Condition
keyword = variable(:,4)'; % 3rd Factor: Keyword Order

% calculate three-way ANOVA
[p table stats terms] = anovan(data, {speaker, stress, keyword},'varnames',{'group', 'stress','keyword'},'model','interaction');

% calculate post-hoc differences
[c,m,h,nms] = multcompare(stats,'dimension',3,'ctype','bonferroni','alpha',0.05)
