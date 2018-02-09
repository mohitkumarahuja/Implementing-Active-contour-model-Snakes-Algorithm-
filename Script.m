%% script
clc
clear
close all;

 
% Initializing cells to store images from all 6 algorithms

IM_A1={};
IM_A2={};
IM_A3={};
IM_A4={};
IM_A5={};
IM_A6={};
IM_G={};

% Directory names
Alg1 = dir('alg1/*.tif');
Alg2 = dir('alg2/*.tif');
Alg3 = dir('alg3/*.tif');
Alg4 = dir('alg4/*.tif');
Alg5 = dir('alg5/*.tif');
Alg6 = dir('alg6/*.tif');
G = dir('Ground Truth/*.tif');

% For loop to store images in the cells
for k = 1:length(Alg1)
filename = ['alg1\' Alg1(k).name];
I = imread(filename);
IM_A1{k}=I;

filename = ['alg2\' Alg2(k).name];
I = imread(filename);
IM_A2{k}=I;

filename = ['alg3\' Alg3(k).name];
I = imread(filename);
IM_A3{k}=I;

filename = ['alg4\' Alg4(k).name];
I = imread(filename);
IM_A4{k}=I;

filename = ['alg5\' Alg5(k).name];
I = imread(filename);
IM_A5{k}=I;

filename = ['alg1\' Alg6(k).name];
I = imread(filename);
IM_A6{k}=I;

filename = ['Ground Truth\' G(k).name];
I = imread(filename);
IM_G{k}=I;

end

% Threshold values. provided between the range 0-1
threshold = 0.05:0.05:1;

% Allocating memory for matrices holding TP, TN, FP FN values for all
% thresholds. Will be used to calculate similarity/dissimilarity measures.

vals_A1 = zeros(length(threshold),length(IM_G));
vals_A2 = zeros(length(threshold),length(IM_G));
vals_A3 = zeros(length(threshold),length(IM_G));
vals_A4 = zeros(length(threshold),length(IM_G));
vals_A5 = zeros(length(threshold),length(IM_G));
vals_A6 = zeros(length(threshold),length(IM_G));

% Loop to calculate sensitivity and fp rate and TP, TN ,FP, FN values for all images at each
% threshold value
for i =1:length(IM_G)
  
    for j = 1 : length(threshold)

[S_A1(i,j), FP_A1(i,j) vals_A1(j,:)] = confusion (IM_A1{i}, IM_G{i} , threshold(j));

[S_A2(i,j), FP_A2(i,j) vals_A2(j,:)] = confusion (IM_A2{i}, IM_G{i} , threshold(j));

[S_A3(i,j), FP_A3(i,j) vals_A3(j,:)] = confusion (IM_A3{i}, IM_G{i} , threshold(j));

[S_A4(i,j), FP_A4(i,j) vals_A4(j,:)] = confusion (IM_A4{i}, IM_G{i} , threshold(j));

[S_A5(i,j), FP_A5(i,j) vals_A5(j,:)] = confusion (IM_A5{i}, IM_G{i} , threshold(j));

[S_A6(i,j), FP_A6(i,j) vals_A6(j,:)] = confusion (IM_A6{i}, IM_G{i} , threshold(j));


    end
end


% Plotting
figure
plot(FP_A1(1,:),S_A1(1,:),'r');
hold on
plot(FP_A1(2,:),S_A1(2,:),'g');
hold on
plot(FP_A1(3,:),S_A1(3,:),'b');
plot(FP_A1(4,:),S_A1(4,:),'y');
title('ROCs for algorithm 1');
xlabel('FP rate');
ylabel('Specifivity');
legend('IMG 1','IMG 2', 'IMG 3', 'IMG 4');
axis([0 0.02 0 0.6])


figure
plot(FP_A2(1,:),S_A2(1,:),'r');
hold on
plot(FP_A2(2,:),S_A2(2,:),'g');
plot(FP_A2(3,:),S_A2(3,:),'b');
hold on
plot(FP_A2(4,:),S_A2(4,:),'y');
title('ROCs for algorithm 2');
xlabel('FP rate');
ylabel('Specifivity');
legend('IMG 1','IMG 2', 'IMG 3', 'IMG 4');
axis([0 0.02 0 0.6])


figure
plot(FP_A3(1,:),S_A3(1,:),'r');
hold on
plot(FP_A3(2,:),S_A3(2,:),'g');
plot(FP_A3(3,:),S_A3(3,:),'b');
plot(FP_A3(4,:),S_A3(4,:),'y');
title('ROCs for algorithm 3');
xlabel('FP rate');
ylabel('Specifivity');
legend('IMG 1','IMG 2', 'IMG 3', 'IMG 4');
axis([0 0.02 0 0.6])


figure
plot(FP_A4(1,:),S_A4(1,:),'r');
hold on
plot(FP_A4(2,:),S_A4(2,:),'g');
hold on
plot(FP_A4(3,:),S_A4(3,:),'b');
hold on
plot(FP_A4(4,:),S_A4(4,:),'y');
title('ROCs for algorithm 4');
xlabel('FP rate');
ylabel('Specifivity');
legend('IMG 1','IMG 2', 'IMG 3', 'IMG 4');
axis([0 0.02 0 0.6])



figure
plot(FP_A5(1,:),S_A5(1,:),'r');
hold on
plot(FP_A5(2,:),S_A5(2,:),'g');
hold on
plot(FP_A5(3,:),S_A5(3,:),'b');
hold on
plot(FP_A5(4,:),S_A5(4,:),'y');
title('ROCs for algorithm 5');
xlabel('FP rate');
ylabel('Specifivity');
legend('IMG 1','IMG 2', 'IMG 3', 'IMG 4');
axis([0 0.02 0 0.6])


figure
plot(FP_A6(1,:),S_A6(1,:),'r');
hold on
plot(FP_A6(2,:),S_A6(2,:),'g');
hold on
plot(FP_A6(3,:),S_A6(3,:),'b');
hold on
plot(FP_A6(4,:),S_A6(4,:),'y');
title('ROCs for algorithm 6');
xlabel('FP rate');
ylabel('Specifivity');
legend('IMG 1','IMG 2', 'IMG 3', 'IMG 4');
axis([0 0.02 0 0.6])


 [jaccard dice] = coefficients(vals_A1, 1);
