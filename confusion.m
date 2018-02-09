function [sensitivity fpRate values] = confusion(Alg_image, ground_truth, threshold)
  
%initializing values to zero

    TP = 0;
    TN =0;
    FP = 0;
    FN = 0;
    sensitivity = 0;
    specificity = 0;
    
%thresholding the input image at the provided threshold     
Alg_image = im2bw(Alg_image, threshold);

%converting the ground truth image into a binary image
ground_truth = im2bw (ground_truth,0);


%calculating TP, FP,TN and FN values
for i = 1:size(Alg_image,1)
        for j = 1: size(ground_truth,2)
            
            if (Alg_image(i,j) == 1 && ground_truth(i,j) == 1)
                TP = TP+1;
                
            else if (Alg_image(i,j) == 0 && ground_truth(i,j) == 0)
                    
                    TN = TN + 1;
                    
                else if (Alg_image(i,j) == 1 && ground_truth(i,j) == 0)
                        
                        FP = FP + 1;
                        
                    else if (Alg_image(i,j) == 0 && ground_truth(i,j) == 1)
                            
                            FN = FN + 1 ;
                 
            
                        end
                    end
                end
            end
        end
end
    
%return sensitivity and fp rate at the nd of loop
    values = [TP TN FP FN];
    sensitivity = TP /(TP+FN);
    fpRate = (FP / (FP + TN)); % false positive
end
