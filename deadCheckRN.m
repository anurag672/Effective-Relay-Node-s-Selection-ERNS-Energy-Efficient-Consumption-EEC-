function [counter1] =  deadCheckRN(cAr,th)
[a b] = size(cAr.RNSet);
for i =1:a
    counter =0;
   n= nnz(cAr.RNSet(i,:));
        rn = cAr.RNSet(i,1) ;
     if rn == 0
        counter = counter +1;
       
     else
         for j =1:n
             rn = cAr.RNSet(i,j);
         if cAr.node(rn).energy < th
            counter = counter +1;
         end
     end
     end
end
 counter1 = counter;   
end
