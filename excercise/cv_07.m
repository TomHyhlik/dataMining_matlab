% loadedData = readtable('data_cv07.csv', 'ReadVariableNames', true)
loadedData = readtable('data_cv07_large_dataset.csv', 'ReadVariableNames', true)




%[p table stats terms] = anovan(loadedData.RST, {loadedData.group, loadedData.gender},'varnames',{'group', 'gender'},'model','interaction');

anovan(loadedData.RST, {loadedData.group, loadedData.gender},'varnames',{'group', 'gender'},'model','interaction');


%%


anova1(loadedData.motor, loadedData.dysarthria)





