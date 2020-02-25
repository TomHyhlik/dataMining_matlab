loadedData = readtable('data_cv03.csv', 'ReadVariableNames', true)

data = loadedData.VOT

N_HC = 29
N_PD = 59 - N_HC

HC = data(1: N_HC)
PD = data(N_HC + 1: 59)

figure(2)
histfit(HC, 20)
hold on
histfit(PD, 20)

%%
% Spočítejte Cohenovo d mezi skupinami HC a PD. 

HC_mean = mean(HC)
PD_mean = mean(PD)

HC_SmerOdchylka = std(HC)
PD_SmerOdchylka = std(PD)

% delta = sqrt((HC_SmerOdchylka.*2 + PD_SmerOdchylka.*2)/ 2)


delta = sqrt(((N_HC - 1)*HC_SmerOdchylka^2 + (N_PD - 1)*PD_SmerOdchylka^2)/(N_HC + N_PD + 2))
d = (PD_mean - HC_mean)/delta
%%
fprintf("Cohenovo d mezi skupinami HC a PD: %d\n", d) 

figure(3)
% kernel density estimation
X = [0:0.1:50]; % generate time vector
% plot(data,0.05,'rx')
% hold on
[HC_f,x] = ksdensity(HC,X); % estimation of probability distribution via kernel density estimation 
% f = f/sum(f); % normalize distribution to the area of 1
plot(X,HC_f, 'g' ) % plotting the resulting probability distribution 
hold on
[PD_f,x] = ksdensity(PD,X); % estimation of probability distribution via kernel density estimation 
% f = f/sum(f); % normalize distribution to the area of 1
plot(X,PD_f,'r') % plotting the resulting probability distribution 

bod_X = data(60)

fprintf("bod_X = %f\n", bod_X)

pd = makedist('Normal', 'mu', 0, 'sigma', d);
x = [0:50];

y = cdf(pd,x)

figure (5)
plot(out)





