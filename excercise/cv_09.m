close all, clear all

%%
loadedData = readtable('data_cv09.csv', 'ReadVariableNames', true)


a = loadedData.stdPWR
b = loadedData.stdF0
a1 = a(1:20)
a2 = a(21:end)
b1 = b(1:20)
b2 = b(21:end)
figure(); hold on; 
h1 = plot(  a1, b1,      'b.','MarkerSize',20);
h2 = plot(  a2, b2,     'ko','MarkerSize',6);



X = loadedData; % features

y(1:20) = 0; % the first half of data belonging to group 1
y(21:40) = 1; % the second half of data belonging to group 2
% 
% % visualize the data
% figure(); hold on;
% h1 = plot(X(y==0,3),X(y==0,4),'b.','MarkerSize',20);
% h2 = plot(X(y==1,3),X(y==1,4)','ko','MarkerSize',6);
% legend([h1 h2],{'Huntington' 'Healthy'},'Location','NorthEast');
% xlabel('Articulation rate');
% ylabel('Vowel articulation');


legend([h1 h2],{'HC' 'PD'},'Location','NorthEast');
xlabel('stdPWR');
ylabel('stdF0');


clear X

X(:,1) = loadedData.stdPWR
X(:,2) = loadedData.stdF0

modelparams = glmfit(X,y','binomial','link','logit');



% compute the class assignment (probabilities) of the trained model for each data point
modelfitLR = glmval(modelparams,X,'logit') >= 0.3;

% estimate final classification accuracy
LRcorrect = sum(modelfitLR==y')/length(y)*100

% create a grid matrix to visualise the model
ax = axis; % automatically compute handles
xvals = linspace(ax(1),ax(2),1000); % range of 1. feature values
yvals = linspace(ax(3),ax(4),1000); % range of 2. feature values
[xx,yy] = meshgrid(xvals,yvals); % create a grid for image
gridX = [xx(:) yy(:)]; % transform grid into N x number of features vector suitable for classification

% perform a logistic regression with all grid points
outputimageLR = glmval(modelparams,gridX,'logit');

% transform grid back to image
outputimageLR = reshape(outputimageLR,[length(yvals) length(xvals)]);

% draw a decision boundary line
[~,h3] = contour(xvals,yvals,outputimageLR,[.5 .5]); % decision at the point 0.5
set(h3,'LineWidth',2,'LineColor',[0 0 0]);  

hold on

%%

% Support Vector Machine
SVMModel = fitcsvm(X,y)
sv = SVMModel.SupportVectors;
gscatter(X(:,1),X(:,2),y)
hold on
plot(sv(:,1),sv(:,2),'ko','MarkerSize',20)

y_pr = predict(SVMModel, X)


% estimate final classification accuracy
LRcorrect = sum(y_pr==y')/length(y)*100

% create a grid matrix to visualise the model
ax = axis; % automatically compute handles
xvals = linspace(ax(1),ax(2),1000); % range of 1. feature values
yvals = linspace(ax(3),ax(4),1000); % range of 2. feature values
[xx,yy] = meshgrid(xvals,yvals); % create a grid for image
gridX = [xx(:) yy(:)]; % transform grid into N x number of features vector suitable for classification

% perform a logistic regression with all grid points
outputimageLR = glmval(modelparams,gridX,'logit');

% transform grid back to image
outputimageLR = reshape(outputimageLR,[length(yvals) length(xvals)]);

% draw a decision boundary line
[~,h3] = contour(xvals,yvals,outputimageLR,[.5 .5]); % decision at the point 0.5
set(h3,'LineWidth',2,'LineColor',[0 0 0]);  

hold on



