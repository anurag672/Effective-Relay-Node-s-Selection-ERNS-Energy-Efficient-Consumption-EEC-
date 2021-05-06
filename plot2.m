figure(2), hold on
[a b] = size(clusterArch.nodesLoc);
plot(clusterArch.nodesLoc(:, 1), clusterArch.nodesLoc(:, 2),...
    '.', 'MarkerSize',15);

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
end
end
title('Sensor deployment with in hierarchical Cluster network')
xlabel('Network Length')
ylabel('Network Width')

clear n1 n2 n3 n4 n5 n6 n7 n8 n9 n10  b c