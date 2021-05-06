function [clusterArch1]=ch_ccoSelection(clusterArch,th,numNodes)
flag=0;

for i=1:numNodes
    if((strcmp(clusterArch.node(i).type,'CH1'))|| (strcmp(clusterArch.node(i).type,'CH2')) || (strcmp(clusterArch.node(i).type,'CH3'))...
           || (strcmp(clusterArch.node(i).type,'CH4')) || (strcmp(clusterArch.node(i).type,'CH5')) || (strcmp(clusterArch.node(i).type,'CH6'))...
            || (strcmp(clusterArch.node(i).type,'CH7')) || (strcmp(clusterArch.node(i).type,'CH8')) || (strcmp(clusterArch.node(i).type,'CH9'))...
            || (strcmp(clusterArch.node(i).type,'CH10')))
      clusterArch.node(i).type = 'NN';
      clusterArch.node(i).G = 0;
      clusterArch.node(i).CH = 0;
      clusterArch.CHSet = 0;
    end
    
        if ((strcmp(clusterArch.node(i).type,'CCO1'))|| (strcmp(clusterArch.node(i).type,'CCO2')) || (strcmp(clusterArch.node(i).type,'CCO3'))...
          ||  (strcmp(clusterArch.node(i).type,'CCO4')) || (strcmp(clusterArch.node(i).type,'CCO5')) || (strcmp(clusterArch.node(i).type,'CCO6'))...
            || (strcmp(clusterArch.node(i).type,'CCO7')) || (strcmp(clusterArch.node(i).type,'CCO8')) || (strcmp(clusterArch.node(i).type,'CCO9'))...
            || (strcmp(clusterArch.node(i).type,'CCO10')))
      clusterArch.node(i).type = 'NN';
        clusterArch.node(i).G = 0;
      clusterArch.node(i).CCO = 0;
      clusterArch.CCOSet = 0;
    end
end

for i=1:clusterArch.No_of_Cluster 

if i > 1
    loweer = loweer + clusterArch.size(i-1).totalNode;
    uppeer = uppeer + clusterArch.size(i).totalNode;
end

if i ==1
    loweer =1;
    uppeer = clusterArch.size(i).totalNode;
    CH ='CH1';
    CCO='CCO1';
end

if i ==2
    CH ='CH2';
    CCO='CCO2';
end

if i ==3
    CH ='CH3';
    CCO='CCO3';
end

if i ==4
    CH ='CH4';
    CCO='CCO4';
end

if i ==5
    CH ='CH5';
    CCO='CCO5';
end

if i ==6
    CH ='CH6';
    CCO='CCO6';
end

if i ==7
    CH ='CH7';
    CCO='CCO7';
end

if i ==8
    CH ='CH8';
    CCO='CCO8';
end

if i ==9
    CH ='CH9';
    CCO='CCO9';
end

if i ==10
    CH ='CH10';
    CCO='CCO10';
end

n=1;
no_CCO=i-1;
j=no_CCO+1;
count=0;
flag =0;

for xx=1:3
    for k=loweer:uppeer
    r = randi([loweer uppeer],1,1);
    if j==count
        break
    end
    if (strcmp(clusterArch.node(r).type,'NN') && clusterArch.node(r).energy >=th)
        if count==0
            clusterArch.node(r).type=CH;
            clusterArch.node(r).G=0;
            clusterArch.node(r).CH=clusterArch.node(r).CH+1;
             clusterArch.CHSet(i,1)=r;
             flag=flag+1;
            count=count+1;
        end
        if flag==0
        if count>0 && count<j
            clusterArch.node(r).type=CCO;
            clusterArch.node(r).G=n;
            clusterArch.node(r).CCO=clusterArch.node(r).CCO+1;
            clusterArch.CCOSet(i,n)=r;
            n=n+1;
            count=count+1;
        end
        end
        
    elseif clusterArch.node(r).energy < th
        clusterArch.node(r).dead =1;
    end
    flag=0;
    end
    end
    
end
   
   clusterArch1=clusterArch;
  
end