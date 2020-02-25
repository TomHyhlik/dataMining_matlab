clear 
clc
close all

loadedData = readtable('Data.xlsx');
set(groot,'defaulttextinterpreter','latex');  
set(groot, 'defaultAxesTickLabelInterpreter','latex');  
set(groot, 'defaultLegendInterpreter','latex'); 

EFNmean = loadedData.EFNMean_dB_;
EFNsd = loadedData.EFNSD_dB_;
EFNtrend = loadedData.EFNTrend_dB_s_;

rates = [loadedData.Rater1 loadedData.Rater2 loadedData.Rater3 loadedData.Rater4 loadedData.Rater5 loadedData.Rater6 ...
    loadedData.Rater7 loadedData.Rater8 loadedData.Rater9 loadedData.Rater10];
meanRates = mean(rates, 2);

N = 37;      % number of group samples

range_PD = 1 : N;
range_HD = N+1 : 2*N;
range_HC = 2*N+1 : 3*N;

% boxplots
figure(1)
set(gca, 'Color', 'none');
subplot(131)
boxplot([EFNmean(range_HC), EFNmean(range_HD), EFNmean(range_PD)], 'Labels', {'HC', 'HN', 'PN'})
ylim([-50 -20])
line([1 1], [-23 -22], 'Color', 'black', 'LineWidth', 1)
line([1 2], [-22 -22], 'Color', 'black', 'LineWidth', 1)
line([2 2], [-23 -22], 'Color', 'black', 'LineWidth', 1)
text(1.5, -22 + 0.05, '**', 'HorizontalAlignment', 'center')
title('\bf EFN mean')
ylabel('EFN mean [dB]')

subplot(132)
boxplot([EFNsd(range_HC), EFNsd(range_HD), EFNsd(range_PD)], 'Labels', {'HC', 'HN', 'PN'})
ylim([0 12])
line([1 1], [11 11.5], 'Color', 'black', 'LineWidth', 1)
line([1 2], [11.5 11.5], 'Color', 'black', 'LineWidth', 1)
line([2 2], [11 11.5], 'Color', 'black', 'LineWidth', 1)
text(1.5, 11.5 + 0.05, '***', 'HorizontalAlignment', 'center')
title('\bf EFN SD')
ylabel('EFN SD [dB]')

subplot(133)
boxplot([meanRates(range_HC), meanRates(range_HD), meanRates(range_PD)], 'Labels', {'HC', 'HN', 'PN'})
ylim([-0.2 2.5])
line([1 1], [1.95 2.05], 'Color', 'black', 'LineWidth', 1)
line([1 2], [2.05 2.05], 'Color', 'black', 'LineWidth', 1)
line([2 2], [1.95 2.05], 'Color', 'black', 'LineWidth', 1)
text(1.5, 2.05 + 0.025, '***', 'HorizontalAlignment', 'center')
line([2 2], [2.1 2.2], 'Color', 'black', 'LineWidth', 1)
line([2 3], [2.2 2.2], 'Color', 'black', 'LineWidth', 1)
line([3 3], [2.1 2.2], 'Color', 'black', 'LineWidth', 1)
text(2.5, 2.2 + 0.025, '**', 'HorizontalAlignment', 'center')
line([1 1], [2.25 2.35], 'Color', 'black', 'LineWidth', 1)
line([1 3], [2.35 2.35], 'Color', 'black', 'LineWidth', 1)
line([3 3], [2.25 2.35], 'Color', 'black', 'LineWidth', 1)
text(2, 2.35 + 0.025, '**', 'HorizontalAlignment', 'center')
title('\bf mean rates')
ylabel('mean score [-]')
%%
export_fig boxplot.eps -transparent