function [train_indices, test_indices]=train_test_indices(N,k)
%% Funkce rozdeli dataset na trenov
x=randperm(N);
test_indices=x(1:round(N*k));
train_indices=x(round(N*k)+1:end);