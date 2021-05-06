function clusterArch = Cluster(No_of_Cluster,netArch,w,R)

%No_of_Cluster-number of subregion
%netclusterArch- returning net architecture with number of sub region
clusterArch=netArch;
if ~exist('No_of_Cluster','var')
         clusterArch.No_of_Cluster = 10;
        y=linspace(0,w,No_of_Cluster+1);
else
     clusterArch.No_of_Cluster = No_of_Cluster;
        y=linspace(0,w,No_of_Cluster+1);
end

x1 =0;
x2 = netArch.Yard.Width;
y1 = y(1);
y2 = y(2);
scl = ceil(((x2 - x1) * (y2 - y1))/ (2* R * R));
         
for i=1:No_of_Cluster
    if i<=11
    clusterArch.size(i).x1=0;
    clusterArch.size(i).x2=netArch.Yard.Width;
    clusterArch.size(i).y1=y(i);
    clusterArch.size(i).y2=y(i+1);
    clusterArch.size(i).id=i;
    clusterArch.size(i).totalNode=0;
    clusterArch.size(i).sl=scl;
    end
   
end
 clusterArch.x=y;

end


   
   

