function [jaccard dice] = coefficients (values, threshold)
   jaccard = 0;
   dice = 0;
   
   TP = values(threshold,1);
   TN = values(threshold,2);
   FP = values(threshold,3);
   FN = values(threshold,4);
   
   jaccard = TP/(FP+FN-TP);
   