
clc;
clear all;
close all;

data=csvread('test.csv');

% data=load('mydata');
X=data;
epsilon=1;
MinPts=37;
C=0;
n=size(X,1);


[IDX, isnoise]=DBSCANf(X,epsilon,MinPts);

distM1=squareform(pdist(data));
k = unique(IDX);
k(k==0) = [];

