loadedData = readtable('data_cv05.csv', 'ReadVariableNames', true)


HC_MPT = loadedData.MPT(1: 15)
PD_MPT = loadedData.MPT(16: 30)
HD_MPT = loadedData.MPT(31: end)

HC_RI = loadedData.RI(1: 15)
PD_RI = loadedData.RI(16: 30)
HD_RI = loadedData.RI(31: end)

HC_DVA = loadedData.DVA(1: 15)
PD_DVA = loadedData.DVA(16: 30)
HD_DVA = loadedData.DVA(31: end)

HC_stdF0 = loadedData.stdF0(1: 15)
PD_stdF0 = loadedData.stdF0(16: 30)
HD_stdF0 = loadedData.stdF0(31: end)

figure(2)
histBlockCnt = 10

subplot(221)
histfit(HC_RI, histBlockCnt)
hold on
histfit(PD_RI, histBlockCnt)
hold on
histfit(HD_RI, histBlockCnt)
title("RI")

subplot(222)
histfit(HC_MPT, histBlockCnt)
hold on
histfit(PD_MPT, histBlockCnt)
hold on
histfit(HD_MPT, histBlockCnt)
title("MPT")

subplot(223)
histfit(HC_DVA, histBlockCnt)
hold on
histfit(PD_DVA, histBlockCnt)
hold on
histfit(HD_DVA, histBlockCnt)
title("DVA")

subplot(224)
histfit(HC_stdF0, histBlockCnt)
hold on
histfit(PD_stdF0, histBlockCnt)
hold on
histfit(HD_stdF0, histBlockCnt)
title("stdF0")


%%
% [p,tbl,stats] = anova1(loadedData.MPT, loadedData.group)
anova1(loadedData.RI, loadedData.group)
anova1(loadedData.MPT, loadedData.group)

%%


disp(mean(HC_DVA))
disp(mean(HC_stdF0))






%%
vartestn(loadedData.RI, loadedData.group)
%%
vartestn(loadedData.MPT, loadedData.group)
%%

plot(xcorr(HC_MPT, PD_MPT))






