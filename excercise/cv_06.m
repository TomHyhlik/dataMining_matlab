loadedData = readtable('data_cv06.csv', 'ReadVariableNames', true)

HC_border = 13

HC_DDKR = loadedData.DDKR(1: HC_border)
EP_DDKR = loadedData.DDKR(HC_border+1: end)

HC_DDKG = loadedData.DDKG(1: HC_border)
EP_DDKG = loadedData.DDKG(HC_border+1: end)

HC_stdF0 = loadedData.stdF0(1: HC_border)
EP_stdF0 = loadedData.stdF0(HC_border+1: end)

HC_jiter = loadedData.jitter(1: HC_border)
EP_jiter = loadedData.jitter(HC_border+1: end)

%%
loadedData = readtable('data_cv06_large_dataset.csv', 'ReadVariableNames', true)

HC_border = 28

HC_DDKR = loadedData.DDKR(HC_border+1: end)
EP_DDKR = loadedData.DDKR(1: HC_border)

HC_DDKG = loadedData.DDKG(HC_border+1: end)
EP_DDKG = loadedData.DDKG(1: HC_border)

HC_stdF0 = loadedData.stdF0(HC_border+1: end)
EP_stdF0 = loadedData.stdF0(1: HC_border)

HC_jiter = loadedData.jitter(HC_border+1: end)
EP_jiter = loadedData.jitter(1: HC_border)






%% VIZUALIZACE


figure(2)
histBlockCnt = 30

subplot(221)
histfit(HC_DDKR, histBlockCnt)
hold on
histfit(EP_DDKR, histBlockCnt)
title("DDKR")

subplot(222)
histfit(HC_DDKG, histBlockCnt)
hold on
histfit(EP_DDKG, histBlockCnt)
title("DDKG")


subplot(223)
histfit(HC_stdF0, histBlockCnt)
hold on
histfit(EP_stdF0, histBlockCnt)
title("stdF0")

subplot(224)
histfit(HC_jiter, histBlockCnt)
hold on
histfit(EP_jiter, histBlockCnt)
title("jiter")


%% maji signaly normalni rozdeleni?



 variable = HC_DDKR
% variable = EP_DDKR
% 
% variable = HC_DDKG
%  variable = EP_DDKG
% 
% variable = HC_stdF0
% variable = EP_stdF0
% 
% variable = HC_jiter
% variable = EP_jiter 



[h,p]=kstest((variable-mean(variable))/std(variable)) 

fprintf("Signal ma normalni rozdeleni?\n");

if p > 0.55
    fprintf("ANO\n")
else
    fprintf("NE\n")
end



%%
% Spočítejte Cohenovo d 
%%

HC_mean = mean(HC_DDKR)
PD_mean = mean(EP_DDKR)

N_PD = 26

N_HC = 26

HC_SmerOdchylka = std(HC_DDKR)
PD_SmerOdchylka = std(EP_DDKR)

% delta = sqrt((HC_SmerOdchylka.*2 + PD_SmerOdchylka.*2)/ 2)


delta = sqrt(((N_HC - 1)*HC_SmerOdchylka^2 + (N_PD - 1)*PD_SmerOdchylka^2)/(N_HC + N_PD + 2))
d = (PD_mean - HC_mean)/delta

fprintf("Cohenovo d DDKR mezi skupinami HC a EP: %d\n", d) 


%%

HC_mean = mean(HC_DDKG)
PD_mean = mean(EP_DDKG)

N_PD = 26

N_HC = 26

HC_SmerOdchylka = std(HC_DDKG)
PD_SmerOdchylka = std(EP_DDKG)

% delta = sqrt((HC_SmerOdchylka.*2 + PD_SmerOdchylka.*2)/ 2)


delta = sqrt(((N_HC - 1)*HC_SmerOdchylka^2 + (N_PD - 1)*PD_SmerOdchylka^2)/(N_HC + N_PD + 2))
d = (PD_mean - HC_mean)/delta

fprintf("Cohenovo d DDKG mezi skupinami HC a EP: %d\n", d) 


%%

HC_mean = mean(HC_stdF0)
PD_mean = mean(EP_stdF0)

N_PD = 26

N_HC = 26

HC_SmerOdchylka = std(HC_stdF0)
PD_SmerOdchylka = std(EP_stdF0)

% delta = sqrt((HC_SmerOdchylka.*2 + PD_SmerOdchylka.*2)/ 2)


delta = sqrt(((N_HC - 1)*HC_SmerOdchylka^2 + (N_PD - 1)*PD_SmerOdchylka^2)/(N_HC + N_PD + 2))
d = (PD_mean - HC_mean)/delta

fprintf("Cohenovo d stdF0 mezi skupinami HC a EP: %d\n", d) 


%%

HC_mean = mean(HC_jiter)
PD_mean = mean(EP_jiter)

N_PD = 26

N_HC = 26

HC_SmerOdchylka = std(HC_jiter)
PD_SmerOdchylka = std(HC_jiter)

% delta = sqrt((HC_SmerOdchylka.*2 + PD_SmerOdchylka.*2)/ 2)


delta = sqrt(((N_HC - 1)*HC_SmerOdchylka^2 + (N_PD - 1)*PD_SmerOdchylka^2)/(N_HC + N_PD + 2))
d = (PD_mean - HC_mean)/delta

fprintf("Cohenovo d jiter mezi skupinami HC a EP: %d\n", d) 



