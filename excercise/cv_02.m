loadedData = readtable('data_cv02.csv', 'ReadVariableNames', true)

data = loadedData.VOT
figure(1)
plot(data)

figure(2)
histfit(data, 20)


med = median(data);
prumer = mean(data)
standartSmerOdchylka = std(data, 1)
mabsdev = mad(data);
mabsdev = mad(data,1);

fprintf("Median: %d\n", med)
fprintf("Prumer: %d\n", prumer) 
fprintf("Standartni smerodatna odchylka: %d\n", standartSmerOdchylka)
fprintf("Medianova absolutni odchylka: %d\n", mabsdev)

    
figure(3)
% kernel density estimation
X = [0:0.1:50]; % generate time vector
% plot(data,0.05,'rx')
% hold on
[f,x] = ksdensity(data,X); % estimation of probability distribution via kernel density estimation 
% f = f/sum(f); % normalize distribution to the area of 1
plot(X,f,'k','LineWidth',2) % plotting the resulting probability distribution 


sem=std(data)/sqrt(length(data)); % compute standard error of the mean
ci = sem * 1.96; % compute 95% confidence interval
fprintf("95 percetnt confidence interval: %d\n", ci)



