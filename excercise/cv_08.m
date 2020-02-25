loadedData = readtable('data_cv08.csv', 'ReadVariableNames', true)


%%
anova1(loadedData.UPDRS_III_bradykinesia, loadedData.gender)
%%
anova1(loadedData.VOT, loadedData.group)
%%


HC = loadedData.jitter(1: 15)
PD = loadedData.jitter(16: end)

N_HC = 15
N_PD = 17


%%
figure(1)
plot(PD)
hold on 
plot(HC)
title("jitter")


%%



%%
% regresni analiza HC
x_HC = 1:N_HC;

% linearized model y = w1x^2 + w2x + w3
% y = 2*x.^2 - 5*x + 10 + 20*randn(size(x));
y_HC = HC

% plot data
figure(),
% plot(x_HC)

plot(x_HC, y_HC,'x')
xlabel('x');
ylabel('y');

% 
% figure(2)
% f = polyval(x_HC, y_HC)
% 
% plot(x_HC,y_HC,'o',x_HC,f,'-') 


% regressor matrix
X_HC = [x_HC(:).^2 x_HC(:) ones(length(x_HC),1)];

% estimate the weights using ordinary least-squares
w_HC = inv(X_HC'*X_HC)*X_HC'*y_HC(:)

% estimate the model fit
modelfit_HC = X_HC*w_HC;

% estimate the squared error
squarederror = sum((y_HC(:)-modelfit_HC).^2)

hold on;
plot(x_HC,modelfit_HC,'k-','LineWidth',2);


%% regresni analiza PD


x_PD = 1:N_PD;

% linearized model y = w1x^2 + w2x + w3
% y = 2*x.^2 - 5*x + 10 + 20*randn(size(x));
y_PD = PD

% plot data
hold on


plot(x_PD, y_PD,'x')
xlabel('x');
ylabel('y');

% regressor matrix
X_PD = [x_PD(:).^2 x_PD(:) ones(length(x_PD),1)];

% estimate the weights using ordinary least-squares
w_PD = inv(X_PD'*X_PD)*X_PD'*y_PD(:)

% estimate the model fit
modelfit_PD = X_PD*w_PD;

% estimate the squared error
squarederror = sum((y_PD(:)-modelfit_PD).^2)

hold on;
plot(x_PD,modelfit_PD,'k-','LineWidth',2);



%%


[h, p] = kstest2(y_HC, modelfit_HC)
