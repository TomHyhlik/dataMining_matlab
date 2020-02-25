loadedData = readtable('data_cv04.csv', 'ReadVariableNames', true)

loadedData.UPDRS_III_U
    
figure(1)
subplot(231); histfit(loadedData.UPDRS_III_U , 10)
subplot(232); histfit(loadedData.UPDRS_III_T, 10)

subplot(233); histfit(loadedData.stdPWR_U, 10)
subplot(234); histfit(loadedData.stdPWR_T, 10)

subplot(235); histfit(loadedData.stdF0_U, 10)
subplot(236); histfit(loadedData.stdF0_T, 10)



variable = loadedData.stdPWR_T;

[h,p]=kstest((variable-mean(variable))/std(variable)) 

fprintf("Signal ma normalni rozdeleni?\n");

if p > 0.55
    fprintf("ANO\n")
else
    fprintf("NE\n")
end




























