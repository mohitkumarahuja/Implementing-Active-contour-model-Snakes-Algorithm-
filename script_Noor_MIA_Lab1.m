%% Algorithm 1

VALUES = [];

for k=1:17

% Image 1
A1I1 = imread('alg1/rdb005ll.tif');
A1G1 = imread('Ground Truth/rdb005ll.tif');

%histogram(A1I1);
TG = 0;
A1G1 = im2bw(A1G1, TG);

    
T = [0.05 0.1 0.15 0.2 0.25 0.3 0.35 0.4 0.45 0.5 0.55 0.6 0.65 0.7 0.75 0.8 0.85];
A1I1 = im2bw(A1I1, T(k));

% A1I1 = wthresh(A1I1, 's', T);

TP = 0;
FP = 0;
FN = 0;
TN = 0;    
    
for i=1:1080
    for j=1:650
        if(A1I1(i,j) == 1 && A1G1(i,j) == 1) 
            TP = TP + 1;
        elseif(A1I1(i,j) == 0 && A1G1(i,j) == 0)
            TN = TN + 1;
        elseif(A1I1(i,j) == 1 && A1G1(i,j) == 0)
            FP = FP + 1;
        elseif(A1I1(i,j) == 0 && A1G1(i,j) == 1)
            FN = FN + 1;
        end
    end
end
VALUES = [VALUES; TP FP FN TN];
end


RATES = []; % [TP_rate FP_rate] == [Sensitivity 1-Specificity]
for k=1:17
     V = VALUES(k,:);
     TP_rate = V(1)/(V(1)+V(3));
     FP_rate = V(2)/(V(2)+V(4));
     RATES = [RATES; TP_rate FP_rate];
end

figure(2);
plot(RATES(:,2), RATES(:,1));


