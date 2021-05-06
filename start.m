tic
clc, clear all, close all
numNodes = 1500; % number of nodes
R=25;
p=0.1; %Percentage of RN Selection out of total nodes
th=0.0000010;
length = 200; width = 200;
netArch  = Network(length, width, 100, 200);
% alpha =0.47;
% beta = 1- alpha;
no_of_cluster = 10;
clusterArch=Cluster(no_of_cluster,netArch,width,R);
clusterArch = Nodes(clusterArch, numNodes);
[clusterArch]=clusterClassification(clusterArch);
roundArch = newRound();
plot1 %network deployment
% plot2 %subarea division of n/w into hierachical form
clear x1 x2 y1 y2 width sl no_of_cluster length i j a 
clusterArch = rnSelection(clusterArch,th,numNodes,R,p); % RN selection in every cluster of all zone

clusterArch = ch_ccoSelection(clusterArch,th, numNodes);  % CH and cco selection in every cluster of all zone


 % plot3;
par = struct;

 for z = 1:10000
     
     [counter]= deadCheckCH(clusterArch,th);

     
      [counter]= deadCheckRN(clusterArch,th);
      if counter > 0
       clusterArch = rnSelection(clusterArch,th,numNodes,R,p);
      end
          
     if counter > 0
         clusterArch = ch_ccoSelection(clusterArch,th, numNodes);
     end
     [clusterArch, par] = energy(clusterArch,clusterArch,netArch,roundArch, z ,R, numNodes, th,par); 
     z
     
 if par.dead(z)> numNodes-8
     break
 end
 
 

 end
  
 
for i=1 :6000
    dead(i) = par.dead(i);
  
    
   energy(i) = par.energy(i);
  
end
    
