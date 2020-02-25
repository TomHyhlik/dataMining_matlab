function [ACC, SENZ, SPEC]=SVM_leave_one_out(data,group)
%% Funkce provede klasifikacni experiment leave-one-out cross-validaci 
% pomoci SVM. Vstupem je matice dat (radky jsou jednotlive subjekty,
% sloupce jsou priznaky). Skupiny ziskane pomoci k-means nastavite
% argumentem group. Do kodu je nutne doplnit vypocet positive predictive 
% value a negative predictive value z konfuzni matice (radek 33 a 34).

% SVM parameters
BoxConstraint=0.1:0.1:2;
KernelScale=0.1:0.1:2;

% init
ACC=nan(numel(BoxConstraint),numel(KernelScale));
PPV=nan(numel(BoxConstraint),numel(KernelScale));
NPV=nan(numel(BoxConstraint),numel(KernelScale));

for k=1:numel(KernelScale)
    for j=1:numel(BoxConstraint)
        
        % init
        test=nan(size(group));
        
        % leave one out
        for i=1:size(data,1)
            SVMModel = fitcsvm(data(1:size(data,1) ~= i,:),group(1:size(data,1) ~= i),'Standardize',true,...
                'KernelFunction','RBF','BoxConstraint',BoxConstraint(j),'KernelScale',KernelScale(k));
            test(i) = predict(SVMModel,data(i,:));
        end
        
        % evaluation
        C=confusionmat(group,test);
        ACC(j,k)=(C(1,1)+C(2,2))/sum(C(:));
        PPV(j,k)=...% doplnte vypocet positive predictive value
        NPV(j,k)=...% doplnte vypocet negative predictive value

    end
end

figure;
surf(BoxConstraint,KernelScale,ACC);
xlabel('BoxConstraint');
ylabel('KernelScale');
zlabel('ACC');

figure;
surf(BoxConstraint,KernelScale,PPV);
xlabel('BoxConstraint');
ylabel('KernelScale');
zlabel('PPV');

figure;
surf(BoxConstraint,KernelScale,NPV);
xlabel('BoxConstraint');
ylabel('KernelScale');
zlabel('NPV');

end