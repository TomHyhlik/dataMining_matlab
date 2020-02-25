clear variables
loadedData = readtable('data_cv11.csv', 'ReadVariableNames', true)
loadedData = removevars(loadedData, {'subject'})
data = table2array(loadedData)


%% K-means


figure()
for i=1:100
    % perform k-means
    [objy, ctrs] = kmeans(data, 2)

    % assign found centroids to formant frequencies
    F1u = ctrs(1,1);
    F2u = ctrs(1,2);
    F1t = ctrs(2,1);
    F2t = ctrs(2,2);

    % plot vowel space triangle
    hold on

    plot(data(:,1),data(:,2),'kx');
    hold on
    plot(F1u,F2u,'rx','markersize', 20,'LineWidth',4)
    plot(F1t,F2t,'gx','markersize', 20,'LineWidth',4)
    set(gca,'box','off')
    
end


%% EM algorithm

% data = [data(:,1) ; data(:,2)]
% run EM algorithm


datax(:,1) = data(:,1)
datax(:,2) = data(:,2)

for i=1:100

    objx = fitgmdist(datax, 2);

    % assign found centroids to formant frequencies
    F1t = objx.mu(1,1);
    F2t = objx.mu(1,2);
    F1u = objx.mu(2,1);
    F2u = objx.mu(2,2);

    % plot vowel space triangle
    plot(data(:,1),data(:,2),'kx');
    hold on
    plot(F1t,F2t,'rx','markersize', 20,'LineWidth',3)
    plot(F1u,F2u,'gx','markersize', 20,'LineWidth',4)
    set(gca,'box','off')

    
    cluster(objx, datax)
%     F = [F1t F2t; F1u F2u];
%     DT = delaunayTriangulation(F(:,1),F(:,2));
%     [k, v] = convexHull(DT);
%     plot(DT.Points(k,1),DT.Points(k,2),'c','LineWidth',4);


end




