clear all
clc

loadedData = readtable('Data.xlsx', 'ReadVariableNames', true);
N = 37;      % number of group samples

range_PD = 1 : N;
range_HD = N+1 : 2*N;
range_HC = 2*N+1 : 3*N;


subplot(311)
vlivVek(loadedData.EFNMean_dB_)
ylabel("EFNMean_dB_")


subplot(312)
vlivVek(loadedData.EFNSD_dB_)
ylabel("EFNSD_dB_")


subplot(313)
vlivVek(loadedData.EFNTrend_dB_s_)
ylabel("EFNTrend_dB_s_")






