function [cAr2, p] = energy(cAr,cAr1, nAr,rAr,z,r,numNodes,th, par)

  ETX = cAr.Energy.transfer;
  ERX = cAr.Energy.receive;
  EDA = cAr.Energy.aggr;
  Emp = cAr.Energy.multiPath;
  Efs = cAr.Energy.freeSpace;
  packetLength = rAr.packetLength;
  d0 = sqrt(nAr.Energy.freeSpace / nAr.Energy.multiPath);
  bsx = nAr.Sink.x;
  bsy = nAr.Sink.y;
[aa bb] = size(cAr.RNSet);  
for i = 1:aa
    
    flag = 0; flag1 =0; flag2=0;

    if i > 1
    loweer = loweer + cAr.size(i-1).totalNode;
    uppeer = uppeer + cAr.size(i).totalNode;
end

if i ==1
    loweer =1;
    uppeer = cAr.size(i).totalNode;
end

if cAr.RNSet(i,1) > 0
%NN to RN
for j=loweer:uppeer
   if (strcmp(cAr.node(j).type,'NN') && cAr.node(j).energy >=th)
       NN=j;
       RN = cAr.node(j).bel;
       if RN > 0
    dist = ((cAr.node(NN).x - cAr.node(RN).x)^2 + (cAr.node(NN).y - cAr.node(RN).y)^2)^(0.5);
    if(dist >= d0)
      cAr.node(NN).energy = cAr.node(NN).energy -((ETX) * packetLength + Emp * packetLength * (dist ^ 4));
    else
      cAr.node(NN).energy = cAr.node(NN).energy - ((ETX) * packetLength + Efs * packetLength * (dist ^ 2));
    end
    cAr.node(RN).energy = cAr.node(RN).energy - ((ERX + EDA) * packetLength );
   end
   end
end
  
% RN to CH
   
   for k = 1:(nnz(cAr.RNSet(i,:)))
       RN = cAr.RNSet(i,k);
       CH = cAr.CHSet(i,1);
       if CH > 0   % sending the data RN to CH
  dist = ((cAr.node(RN).x - cAr.node(CH).x)^2 + (cAr.node(RN).y - cAr.node(CH).y)^2)^(0.5);
    if(dist >= d0)
      cAr.node(RN).energy = cAr.node(RN).energy -((ETX) * packetLength + Emp * packetLength * (dist ^ 4));
    else
      cAr.node(RN).energy = cAr.node(RN).energy - ((ETX) * packetLength + Efs * packetLength * (dist ^ 2));
    end
    cAr.node(CH).energy = cAr.node(CH).energy - ((ERX) * packetLength );
    
    
      %{ 
      else % sending the data direct to BS
           dist = ((cAr.node(RN).x - bsx)^2 + (cAr.node(RN).y - bsy)^2)^(0.5);
    if(dist >= d0)
      cAr.node(RN).energy = cAr.node(RN).energy -((ETX) * packetLength + Emp * packetLength * (dist ^ 4));
    flag = flag+1;
    else
      cAr.node(RN).energy = cAr.node(RN).energy - ((ETX) * packetLength + Efs * packetLength * (dist ^ 2));
    flag = flag+1;
    end
    %}
    
       end 
   end
   
   % sending the data CH to BS
   if flag == 0
       ncounter=0;
       CH = cAr.CHSet(i,1);
       for l = i:cAr.No_of_Cluster
           if ncounter > 0
               break
           end
           
           if CH > 0
           if l < cAr.No_of_Cluster
           for k = 1:nnz(cAr.CCOSet(l+1,:))
               CCO = cAr.CCOSet(l+1,k);
               if CCO > 0 
               if cAr.node(CH).clusterID == cAr.node(CCO).G
                    dist = ((cAr.node(CCO).x - cAr.node(CH).x)^2 + (cAr.node(CCO).y - cAr.node(CH).y)^2)^(0.5);
    if(dist >= d0)
      cAr.node(CH).energy = cAr.node(CH).energy -((ETX) * packetLength + Emp * packetLength * (dist ^ 4));
      break
    else
      cAr.node(CH).energy = cAr.node(CH).energy - ((ETX) * packetLength + Efs * packetLength * (dist ^ 2));
    end
    cAr.node(CCO).energy = cAr.node(CCO).energy - ((ERX) * packetLength );
              break
               end
               
               else 
    dist = ((cAr.node(CH).x - bsx)^2 + (cAr.node(CH).y - bsy)^2)^(0.5);
    if(dist >= d0)
      cAr.node(CH).energy = cAr.node(CH).energy -((ETX) * packetLength + Emp * packetLength * (dist ^ 4));
      ncounter = ncounter +1;
      break
    else
      cAr.node(CH).energy = cAr.node(CH).energy - ((ETX) * packetLength + Efs * packetLength * (dist ^ 2));
   ncounter = ncounter +1;
      break
    end
    
           end
           end
           
           else
      dist = ((cAr.node(CH).x - bsx)^2 + (cAr.node(CH).y - bsy)^2)^(0.5);
    if(dist >= d0)
      cAr.node(CH).energy = cAr.node(CH).energy -((ETX) * packetLength + Emp * packetLength * (dist ^ 4));
    else
      cAr.node(CH).energy = cAr.node(CH).energy - ((ETX) * packetLength + Efs * packetLength * (dist ^ 2));
    end  
           end
           
           end
       end
   end
   
   
   %sending the data CCO to CCO/BS
   %{
   for l = i:cAr.No_of_Cluster
       if l > 1
       for kk = 1:nnz(cAr.CCOSet(l,:))
               CCO1 = cAr.CCOSet(l,kk);
               if CCO1 > 0
                if l < cAr.No_of_Cluster
                   for jj = 1:nnz(cAr.CCOSet(l+1,:))
                       CCO2 = cAr.CCOSet(l+1,jj);
                       if CCO2 > 0
               if cAr.node(CCO1).G == cAr.node(CCO2).G
                    dist = ((cAr.node(CCO1).x - cAr.node(CCO2).x)^2 + (cAr.node(CCO1).y - cAr.node(CCO2).y)^2)^(0.5);
    if(dist >= d0)
      cAr.node(CCO1).energy = cAr.node(CCO1).energy -((ETX) * packetLength + Emp * packetLength * (dist ^ 4));
    else
      cAr.node(CCO1).energy = cAr.node(CCO1).energy - ((ETX) * packetLength + Efs * packetLength * (dist ^ 2));
    end
    cAr.node(CCO2).energy = cAr.node(CCO2).energy - ((ERX) * packetLength );
               end
               
                       else
                    dist = ((cAr.node(CCO1).x - bsx)^2 + (cAr.node(CCO1).y - bsy)^2)^(0.5);
    if(dist >= d0)
      cAr.node(CCO1).energy = cAr.node(CCO1).energy -((ETX) * packetLength + Emp * packetLength * (dist ^ 4));
    else
      cAr.node(CCO1).energy = cAr.node(CCO1).energy - ((ETX) * packetLength + Efs * packetLength * (dist ^ 2));
    end   
                       end
                   end
                  dist = ((cAr.node(CCO1).x - bsx)^2 + (cAr.node(CCO1).y - bsy)^2)^(0.5);
    if(dist >= d0)
      cAr.node(CCO1).energy = cAr.node(CCO1).energy -((ETX) * packetLength + Emp * packetLength * (dist ^ 4));
    else
      cAr.node(CCO1).energy = cAr.node(CCO1).energy - ((ETX) * packetLength + Efs * packetLength * (dist ^ 2));
    end       
                end
               end
       end
       end
       
   end
   %}
    end 
end

          

energy =0;
dead =0;

for i=1:numNodes
    if cAr.node(i).energy > th
        energy = cAr.node(i).energy + energy;
    
    else
        dead = dead+1;
        cAr.node(i).dead =1;
    end
end
par.energy(z) = energy;
par.dead(z) = dead;

%%%%%%%%%%% dad node calculation in individual cluster %%%%%%%%%%%%%%%%%%%%%%%%

for i = 1:cAr.No_of_Cluster

    if i > 1
    loweer = loweer + cAr.size(i-1).totalNode;
    uppeer = uppeer + cAr.size(i).totalNode;
end

if i ==1
    loweer =1;
    uppeer = cAr.size(i).totalNode;
end
counter =0;

for j=loweer:uppeer
 if cAr.node(j).energy > th
        counter = counter+1;
 end    
    
 cAr.size(i).aliveNode = counter;
end
end

p =par;
cAr2=cAr;



end
    
    
    
      
  