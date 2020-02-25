%% Cohen's D
s=sqrt(((numel(HC)-1)*var(HC)+(numel(PD)-1)*var(PD))/(numel(HC)+numel(PD)-2));
d=(mean(HC)-mean(PD))/s

%% parametry normalniho rozdeleni HC a PD - pozor! one-tail hypotezy je nutne manualne korigovat
x=X.VOT;

HC_mu=mean(HC);
HC_sd=std(HC);

PD_mu=mean(PD);
PD_sd=std(PD);

p_HC=cdf('norm',x,HC_mu,HC_sd)
p_PD=cdf('norm',x,PD_mu,PD_sd)


%% bootstrapping
dmean=mean(HC)-mean(PD);
N=numel(T.VOT);
for i=1:10000 
    subsample_HC=T.VOT(randi([1 N],round(N/2),1));
    subsample_PD=T.VOT(randi([1 N],round(N/2),1));
    iterative_mean(i)=mean(subsample_HC)-mean(subsample_PD);
    
    % randomization
%     subsample_HC=HC(randperm(numel(HC),10));
%     subsample_PD=PD(randperm(numel(PD),10));
end
% hist(iterative_mean,50)
p=mean(abs(iterative_mean)>abs(dmean))
[~,p]=ttest2(HC,PD)