function cAr2 = rnSelection(cAr,th,numNodes,r,p)

for i=1:numNodes
    if strcmp(cAr.node(i).type,'RN') 
      cAr.node(i).type = 'NN';
      cAr.node(i).G = 0;
      cAr.node(i).RN = 0;
      cAr.RNSet = 0;
      cAr.node(i).bel = 0;
    end
end

for i=1:cAr.No_of_Cluster 
    n=1;
    count =0;
if i > 1
    loweer = loweer + cAr.size(i-1).totalNode;
    uppeer = uppeer + cAr.size(i).totalNode;
end

if i ==1
    loweer =1;
    uppeer = cAr.size(i).totalNode;
end

 index1=1;
   for j = 1: cAr.size(i).sl
       dist =0;  index =1;
    for k=loweer:uppeer
        
         sumdist =0;
        avgdist =0;
        
    if (strcmp(cAr.node(k).type,'NN') && cAr.node(k).energy >=th && cAr.node(k).subclusterID == j)
        energy = cAr.node(k).energy;
        NN1_X = cAr.node(k).x;
        NN1_Y = cAr.node(k).y;
        
        for l=loweer:uppeer  
          if (strcmp(cAr.node(l).type,'NN') && cAr.node(l).energy >=th && cAr.node(l).subclusterID == j)   
              NN2_X = cAr.node(l).x;
              NN2_Y = cAr.node(l).y;
              sumdist = ((NN1_X -NN2_X)^2 + (NN1_Y -NN2_Y)^2)^(0.5);
              avgdist = avgdist + sumdist;
          end
         end
         dist(1,index) = (avgdist/energy);
         dist(2,index)=k;
         index = index+1;
    end
    end
    [a b] = min(dist(1,:));
    if b > 0 && a > 0
    pos = dist(2,b);
    cAr.node(pos).type = 'RN';
    cAr.RNSet(i,index1) = pos;
    index1 = index1+1;
    for ll=loweer:uppeer  
          if (strcmp(cAr.node(ll).type,'NN') && cAr.node(ll).energy >=th && cAr.node(ll).subclusterID == j)   
              cAr.node(ll).bel =pos;
   end
    end
    end
   end           
   end

cAr2  = cAr;
end
