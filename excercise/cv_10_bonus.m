clear all 
close all 

loadedData = readtable('data_cv10_bonus.csv', 'ReadVariableNames', true)

data = table2array(loadedData)

x0 = data(loadedData.group==0,3)
y0 = data(loadedData.group==0,4)
x1 = data(loadedData.group==1,3)
y1 = data(loadedData.group==1,4)

%%
figure()
plot(x0, y0,'r.','MarkerSize',20)
hold on
plot(x1, y1,'b.','MarkerSize',20)
ezpolar(@(x)1);ezpolar(@(x)2);
xlabel('x')
ylabel('y')

%%

data3 = [[x0, y0]; [x1, y1]];
theclass = ones(219,1);
theclass(1:100) = -1;


% Train the SVM Classifier
cl = fitcsvm(data3,theclass,'KernelFunction','rbf',...
    'BoxConstraint',Inf,'ClassNames',[-1,1]);

% Predict scores over the grid
d = 0.02;
[x1Grid,x2Grid] = meshgrid(min(data3(:,1)):d:max(data3(:,1)),...
    min(data3(:,2)):d:max(data3(:,2)));
xGrid = [x1Grid(:),x2Grid(:)];
[~,scores] = predict(cl,xGrid);

cl2 = fitcsvm(data3,theclass,'KernelFunction','rbf');
[~,scores2] = predict(cl2,xGrid);

figure();
h(1:2) = gscatter(data3(:,1),data3(:,2),theclass,'rb','.');
hold on
ezpolar(@(x)1);
h(3) = plot(data3(cl2.IsSupportVector,1),data3(cl2.IsSupportVector,2),'ko');
contour(x1Grid,x2Grid,reshape(scores2(:,2),size(x1Grid)),[0 0],'k');
legend(h,{'-1','+1','Support Vectors'});

%%


z0 = x0.*x0 + y0.*y0
z1 = x1.*x1 + y1.*y1

figure()
plot3(x0,y0,z0,'r.','MarkerSize',20);
hold on
plot3(x1, y1, z1,'b.','MarkerSize',20);
xlabel('x')
ylabel('y')
zlabel('z')

hold on

% X(:,1) = loadedData.x
% X(:,2) = loadedData.y
% X(:,3) = loadedData.x .* loadedData.x + loadedData.y .* loadedData.y


[train, test] = train_test_indices(219, 0.2)

classification_dataset = [[x0, y0, z0];[x1, y1, z1]];


SVMModel = fitcsvm (classification_dataset(train,:), loadedData.group(train,:),'Standardize',true,...
    'KernelFunction','RBF','BoxConstraint',1,'KernelScale',1);

% predikce
label = predict(SVMModel,classification_dataset(test,:));

C = confusionmat( loadedData.group(test),label);
ACC = (C(1,1)+C(2,2))/sum(C(:));
SENZ = C(1,1)/(C(1,1)+C(1,2));
SPEC = C(2,2)/(C(2,1)+C(2,2));

