figure(3), hold on
[a b] = size(clusterArch.cluster.clusterloc);
for c =1:(b/2)
figure(2), hold on
plot(clusterArch.cluster.clusterloc(:,((2*c)-1)), clusterArch.cluster.clusterloc(:,(2*c)),...
    '.', 'MarkerSize',10);
end

plot(netArch.Sink.x, netArch.Sink.y,'o', ...
    'MarkerSize',8, 'MarkerFaceColor', 'g');
for i =1 : clusterArch.No_of_Cluster
    x1 = clusterArch.size(i).x1;
    y1 = clusterArch.size(i).y1;
    x2 = clusterArch.size(i).x2;
    y2 = clusterArch.size(i).y2;
   
    
line([x1 x2],[y2 y2],'Color','k','LineStyle', '-');
for j =1 : clusterArch.size(i).subLay
    sl= clusterArch.size(i).subLay;
    a = (x2-x1)/sl;
    line([(j*a) (j*a)],[y1 y2],'Color','r','LineStyle', '--');
    ch_x = clusterArch.node(clusterArch.CH(j,i)).x;
ch_y = clusterArch.node(clusterArch.CH(j,i)).y;
rn_x = clusterArch.node(clusterArch.RN(i,j)).x;
rn_y = clusterArch.node(clusterArch.RN(i,j)).y;
 plot(ch_x, ch_y, 's', 'MarkerSize',12);
 plot(rn_x, rn_y, '.', 'MarkerSize',25);
end


end
title('Sensor deployment with in hierarchical Cluster network')
xlabel('Network Length')
ylabel('Network Width')