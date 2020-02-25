% This script tests if the data are drawn from a normal distribution
% and the variances are homogenous across the different DVs -> necessary
% for ANOVA tests
clear all
clc

loadedData = readtable('Data.xlsx', 'ReadVariableNames', true);

N = 37;      % number of group samples

range_PD = 1 : N;
range_HD = N+1 : 2*N;
range_HC = 2*N+1 : 3*N;

%% Data normality - using Shapiro-Wilcoxon test
alpha = 0.05;
[normalityEFNmean.HC_H, normalityEFNmean.HC_p] = swtest(loadedData.EFNMean_dB_(range_HC));
[normalityEFNmean.PD_H, normalityEFNmean.PD_p] = swtest(loadedData.EFNMean_dB_(range_PD));
[normalityEFNmean.HD_H, normalityEFNmean.HD_p] = swtest(loadedData.EFNMean_dB_(range_HD));

[normalityEFNSD.HC_H, normalityEFNSD.HC_p] = swtest(loadedData.EFNSD_dB_(range_HC));
[normalityEFNSD.PD_H, normalityEFNSD.PD_p] = swtest(loadedData.EFNSD_dB_(range_PD));
[normalityEFNSD.HD_H, normalityEFNSD.HD_p] = swtest(loadedData.EFNSD_dB_(range_HD));

[normalityEFNTrend.HC_H, normalityEFNTrend.HC_p] = swtest(loadedData.EFNTrend_dB_s_(range_HC));
[normalityEFNTrend.PD_H, normalityEFNTrend.PD_p] = swtest(loadedData.EFNTrend_dB_s_(range_PD));
[normalityEFNTrend.HD_H, normalityEFNTrend.HD_p] = swtest(loadedData.EFNTrend_dB_s_(range_HD));

%% Homogenity of variance test

[homVarEFNmean.p, homVarEFNmean.stat] = vartestn([loadedData.EFNMean_dB_(range_HC) loadedData.EFNMean_dB_(range_PD) ...
    loadedData.EFNMean_dB_(range_HD)], 'TestType', 'Bartlett');

[homVarEFNSD.p, homVarEFNSD.stat] = vartestn([loadedData.EFNSD_dB_(range_HC) loadedData.EFNSD_dB_(range_PD) ...
    loadedData.EFNSD_dB_(range_HD)], 'TestType', 'Bartlett');

[homVarEFNTrend.p, homVarEFNTrend.stat] = vartestn([loadedData.EFNTrend_dB_s_(range_HC) loadedData.EFNTrend_dB_s_(range_PD) ...
    loadedData.EFNTrend_dB_s_(range_HD)], 'TestType', 'Bartlett');

%% histograms
% figure()
% 
% subplot(311)
% histfit(loadedData.EFNMean_dB_(range_PN) , 10)
% hold on
% histfit(loadedData.EFNMean_dB_(range_HD) , 10)
% hold on
% histfit(loadedData.EFNMean_dB_(range_HC) , 10)
% title("EFNMean_dB_")
% 
% subplot(312)
% histfit(loadedData.EFNSD_dB_(range_PN) , 10)
% hold on
% histfit(loadedData.EFNSD_dB_(range_HD) , 10)
% hold on
% histfit(loadedData.EFNSD_dB_(range_HC) , 10)
% title("EFNSD_dB_")
% 
% subplot(313)
% histfit(loadedData.EFNTrend_dB_s_(range_PN) , 10)
% hold on
% histfit(loadedData.EFNTrend_dB_s_(range_HD) , 10)
% hold on
% histfit(loadedData.EFNTrend_dB_s_(range_HC) , 10)
% title("EFNTrend_dB_s_")




