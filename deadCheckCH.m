function [counter1] =  deadCheckCH(cAr,th)

for i =1:cAr.No_of_Cluster
    counter =0;
   
        ch = cAr.CHSet(i,1) ;
        if ch == 0
        counter = counter +1;
        else if cAr.node(ch).energy < th
            counter = counter +1;
            end
        end
        
        j = i-1;
        if j > 0
        for k = 1:(nnz(cAr.CCOSet(i,:)))
            CCO = cAr.CCOSet(i,k);
         if CCO == 0
        counter = counter +1;
        else if cAr.node(CCO).energy < th
            counter = counter +1;
            end
         end
        end
        end
            
  
 counter1 = counter;   
end
