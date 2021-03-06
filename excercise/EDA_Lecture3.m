% Experimental Data Analysis: Lecture 3
close all, clear all, clc

%% MATLAB EXAMPLE 1 %%
% estimate the 95% confidence interval

% load data related to velocity of gait from N=62 healthy subjects
velocity = [135.7 154.4 113.3 123.5 110.3 122.5 150.8 130.9 151.3 164.6 134 123.6 ...
    127.7 114 99.6 127.4 106.6 106.2 119.8 117.2 137.9 119.2 125.1 123.5 123.6 ...
    119.4 131.8 108.9 130.4 104.4 77.8 104.3 133.3 148.6 146.7 131.9 114 124.5 ...
    121.5 121.1 119.7 132.1 117.5 107.6 138.2 156.2 121.7 117.9 147.2 112.9 97.5 ...
    160.4 101.3 128.8 101.7 155.3 132.5 121.5 138.2 112.9 104 139.3];

% make a figure
figure();
hist(velocity, 20);
hold on
set(gca, 'Box', 'on')
set(gca, 'YLim', [0, 10])
ylabel ('Frequency','FontSize',12, 'FontName','Georgia')
xlabel ('Velocity (cm/s)','FontSize',12, 'FontName','Georgia')
set(gca, 'Box', 'off')

[h,p,ci] = ttest(velocity) % perform one-sample t-test
% h =  t-test of the hypothesis that the data in the vector come from
% a distribution with mean zero
% p = p-value
% ci = returns confidence interval for the true mean of the vector

% plot confidence intervals
plot([ci(1) ci(1)], [0 10],'r','linewidth',2)
plot([ci(2) ci(2)], [0 10],'r','linewidth',2)

%% MATLAB EXAMPLE 2 %%
% estimate group difference between speakers with Parkinson's disease
% and normal healthy controls for intonation variability using
% t-test

% load data
F0 = [1.04 1.12 0.89 1.26 0.99 1.87 1.80 1.19 1.05 0.80 1.57 1.28 1.19 ...
    1.20 2.16 2.77 0.90 2.17 1.09 1.14 2.31 1.91 0.67 2.08 1.80 1.76 ...
    1.50 1.70 1.90 2.43 1.84 2.64 1.72 1.93 2.93 1.15 2.19 2.02 2.37 ...
    2.44 1.87 2.16 2.77 1.48 3.36 2.26];

parkinson = F0(1:23); % N=23 speakers with Parkinson's disease and
healthy = F0(24:end); % N=23 healthy control speakers

% make a figure
figure();
[N,X] = hist(parkinson, 20);
bar(X, N, 'b');
hold on
[N,X] = hist(healthy, 20);
bar(X, N, 'r');
set(gca, 'Box', 'on')
set(gca, 'YLim', [0, 5])
ylabel ('Frequency','FontSize',12, 'FontName','Georgia')
xlabel ('F0 (st)','FontSize',12, 'FontName','Georgia')
set(gca, 'Box', 'off')
legend('parkinson','healthy')

% perform t-test
[h,p,ci,stats] = ttest2(parkinson, healthy)

% perform t-test if variances are unequal
std(parkinson)
std(healthy)
[h,p,ci,stats] = ttest2(parkinson, healthy,'Vartype','unequal')


%% MATLAB EXAMPLE 3 %%
% estimate group difference between speakers with Huntington's disease
% and normal healthy controls for number of voice breaks using
% Wilcoxon rank sum test

% load data
nvb = [0 5.29 3 0.833 1 0.5 3 0.167 0.857 3.857 3.5 0 0.177 3.5 50.8 1.6 1.4 ...
       0.5 0 20.2 0 0.667 3.167 39 1.167 0.25 2.5 1 2.88 0.75 0.167 7.29 0.25 ...
       3.25 6 7 7 0 0 0.25 3.75 0 0 0 0 2.25 0 0 0 3.5 0 0.5 0 0 0 0 0.5 0 0 ...
       0 2.25 0 0 1.25 0 0 0 0];

huntington = nvb(1:34); % N=34 speakers with Huntington's disease and
healthy = nvb(35:end); % N=34 healthy control speakers

% make a figure
figure(),
subplot(121);
[N,X] = hist(huntington, 40);
bar(X, N, 'b');
set(gca, 'XLim', [0, 60])
set(gca, 'YLim', [0, 30])
ylabel ('Frequency','FontSize',12, 'FontName','Georgia')
xlabel ('nvb (-)','FontSize',12, 'FontName','Georgia')
set(gca, 'Box', 'off')
title('Huntington','FontSize',12, 'FontName','Georgia')

subplot(122);
[N,X] = hist(healthy, 5);
bar(X, N, 'r');
set(gca, 'XLim', [0, 60])
set(gca, 'YLim', [0, 30])
ylabel ('Frequency','FontSize',12, 'FontName','Georgia')
xlabel ('nvb (-)','FontSize',12, 'FontName','Georgia')
set(gca, 'Box', 'off')
title('Healthy','FontSize',12, 'FontName','Georgia')

[p,h,stats] = ranksum(huntington, healthy) % perform Wilcoxon rank sum test

% compare the performance with t-test
[h,p] = ttest2(huntington, healthy)

%% MATLAB EXAMPLE 4 %%
% Independent versus paired t-test

% load data of 20 patients with Parkinsonís disease at the
% baseline an one year after introduction of dopaminergic drugs
weight = [71.5 75.5;
    75 78;86 91;
    70.5 70.5;
    71 61;
    92 89;
    69.8 66;
    103 114;
    82.3 83;
    97.2 96.2;
    77 82;
    90 88.5;
    74.8 76;
    70 82.5;
    63.2 57;
    84 95;
    96 98;
    93 102.6;
    88.9 95.6;
    96 105.2];

baseline = weight(:,1); % baseline data
year = weight(:,2); % re-test after one year

subplot(121)
plot(1,baseline,'rx')
hold on
plot(2,year,'bx')
plot([1,2], [baseline,year],'k')
ylabel ('Weight (kg)')
set(gca, 'XLim', [0, 3])
subplot(122)
boxplot(weight);

[h,p] = ttest2(baseline, year) % Independent t-test

[h,p] = ttest(baseline, year) % Paired t-test
