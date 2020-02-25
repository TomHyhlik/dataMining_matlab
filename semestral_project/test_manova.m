% Data analysis using the MANOVA tests. The assumptions are checked in file
% test_normRozdeleni.m
clear 
clc
close all

loadedData = readtable('Data.xlsx');

%% Conversion of groups into numerical classes
% Gender
gender = zeros(size(loadedData.Gender));
for i = 1:length(gender)
    if loadedData.Gender{i} == 'M'
        gender(i) = 1;
    elseif loadedData.Gender{i} == 'F'
        gender(i) = 2;
    else
        error("Unexpected data in gender field")
    end
end

% PD, HD, HC
disease = zeros(size(loadedData.Names));
disease(1 : 37) = 1; % PD
disease(37+1 : 2*37) = 2; % HD
disease(2*37 + 1 : 3*37) = 3; % HC

%% subjective rate score
rates = [loadedData.Rater1 loadedData.Rater2 loadedData.Rater3 loadedData.Rater4 loadedData.Rater5 loadedData.Rater6 ...
    loadedData.Rater7 loadedData.Rater8 loadedData.Rater9 loadedData.Rater10];
meanRates = mean(rates, 2);

%% Perform MANOVA and post-hoc differences
% the examined variables
EFNmean = loadedData.EFNMean_dB_;
EFNsd = loadedData.EFNSD_dB_;
EFNtrend = loadedData.EFNTrend_dB_s_;

examinedVariable = meanRates; % here you choose the variable to be analyzed

% MANOVA
[p, table, stats, terms] = anovan(examinedVariable, {disease, gender}, 'varnames', {'disease type', 'gender'}, 'model', 'interaction');

% post-hoc differences using Bonferroni method
[c, m, h, nms] = multcompare(stats, 'dimension', 1, 'ctype', 'bonferroni', 'alpha',0.001);


        
