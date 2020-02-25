function vlivVek(dataSet)

loadedData = readtable('Data.xlsx', 'ReadVariableNames', true);
N = 37;      % number of group samples

range_PD = 1 : N;
range_HD = N+1 : 2*N;
range_HC = 2*N+1 : 3*N;


x = loadedData.Age_years_(range_HC)
y = dataSet(range_HC)

h1 = plot(x, y, 'r.','MarkerSize',20);
% regressor matrix
X = [x(:).^2 x(:) ones(length(x),1)];
% estimate the weights using ordinary least-squares
w = inv(X'*X)*X'*y(:)
% estimate the model fit
modelfit = X*w;
% estimate the squared error
squarederror = sum((y(:)-modelfit).^2)
hold on;
plot(x ,modelfit, 'r-', 'LineWidth', 4);


hold on


x = loadedData.Age_years_(range_HD)
y = dataSet(range_HD)

h2 = plot(x, y, 'g.','MarkerSize',20);
% regressor matrix
X = [x(:).^2 x(:) ones(length(x),1)];
% estimate the weights using ordinary least-squares
w = inv(X'*X)*X'*y(:)
% estimate the model fit
modelfit = X*w;
% estimate the squared error
squarederror = sum((y(:)-modelfit).^2)
hold on;
plot(x ,modelfit, 'g-', 'LineWidth', 4);


hold on


x = loadedData.Age_years_(range_PD)
y = dataSet(range_PD)

h3 = plot(x, y, 'b.','MarkerSize',20);
% regressor matrix
X = [x(:).^2 x(:) ones(length(x),1)];
% estimate the weights using ordinary least-squares
w = inv(X'*X)*X'*y(:)
% estimate the model fit
modelfit = X*w;
% estimate the squared error
squarederror = sum((y(:)-modelfit).^2)
hold on;
plot(x ,modelfit, 'b-', 'LineWidth', 4);


xlabel("Age")
legend([h1 h2 h3],{'HC' 'HD' 'PD'},'Location','NorthEast');

end