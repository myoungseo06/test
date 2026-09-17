%
clear; close all; clc;

%붓꽃 데이터 불러오기
%meas 1열: sepal length
%meas 2열: sepal width
%meas 3열: petal length
%meas 4열: petal width
%species: 꽃종류

load fisheriris;

%% 특징그려보기 (sepal length, width)
figure;
plot(meas(:,1),meas(:,2),'k.');
xlabel('Sepal length');
ylabel('Sepal length');

%% 각 종을 숫자로 표현 1: setosa, 2: versicolor, 3: virginica
spcs2num=[];
for k=1:1:length(species)
    if strcmp(species(k),'setosa')==1
        spcs2num(k,1)=1;
    elseif strcmp(species(k),'versicolor')==1
        spcs2num(k,1)=2;
    elseif strcmp(species(k),'virginica')==1
        spcs2num(k,1)=3;
    end
end

%% 종별로 다른 색으로 그려보기
idx1 = find(spcs2num==1);
idx2 = find(spcs2num==2);
idx3 = find(spcs2num==3);

figure;
plot(meas(idx1,1),meas(idx1,2),'r.'); hold on;
plot(meas(idx2,1),meas(idx2,2),'go'); hold on;
plot(meas(idx3,1),meas(idx3,2),'bx'); hold on;
xlabel('Sepal length');
ylabel('Sepal width');

figure;
plot(meas(idx1,3),meas(idx1,4),'r.'); hold on;
plot(meas(idx2,3),meas(idx2,4),'go'); hold on;
plot(meas(idx3,3),meas(idx3,4),'bx'); hold on;
xlabel('Petal length');
ylabel('Petal width');


%% 학습데이터와 평가데이터 나누기





tr_id=[71:1:100 121:1:150];
Training_data=meas(tr_id,:);
Training_label=spcs2num(tr_id,:);

ts_id=[51:1:70 101:1:120];
Test_data=meas(ts_id,:);
Test_label=spcs2num(ts_id,:);