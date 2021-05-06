function gClusterArch=clusterfigure(clusterArch1,r)
clusterArch=clusterArch1;
R=r ; %sensor radious
for i=1:clusterArch.No_of_Cluster
  
 if i==1
        [a,b]=size(clusterArch.cluster.RNSet.RNset1);
        for j=1:b
        for k=1: nnz(clusterArch.cluster.clusterloc(:,i*2))    
        netXloc=clusterArch.cluster.cluster1(clusterArch.cluster.RNSet.RNset1(j)).x;
        netYloc=clusterArch.cluster.cluster1(clusterArch.cluster.RNSet.RNset1(j)).y;
        distance = sqrt((netXloc - clusterArch.cluster.cluster1(k).x)^2....
        + (netYloc - clusterArch.cluster.cluster1(k).y)^2);
       
        figure(i+2), hold on
        plot( netXloc, netYloc,'o', 'MarkerSize',15,'MarkerFaceColor', 'y');
        plot( clusterArch.cluster.clusterloc(:,((i*2)-1)), clusterArch.cluster.clusterloc(:,(i*2)),...
        '.', 'MarkerSize',15);
c=clusterArch.cluster.cluster1((clusterArch.cluster.CHSet.CHset1(1))).x;
d=clusterArch.cluster.cluster1((clusterArch.cluster.CHSet.CHset1(1))).y;
plot( c, d,'o', 'MarkerSize',15,'MarkerFaceColor', 'm');
        xlim([0 200])
        ylim([0 20])
       if distance <= R
       if clusterArch.cluster.cluster1(k).G==0
        clusterArch.cluster.matrix.matrix1(clusterArch.cluster.RNSet.RNset1(j), k) = 1;
        line([netXloc clusterArch.cluster.cluster1(k).x], [netYloc clusterArch.cluster.cluster1(k).y], 'LineStyle', ':');
        clusterArch.cluster.cluster1(k).G=j;
       end
       else
             clusterArch.cluster.matrix.matrix1(clusterArch.cluster.RNSet.RNset1(j), k) = 0;
        end
        end
        end
end
 %{
       
        if i==2
        [a,b]=size(clusterArch.cluster.RNSet.RNset2);
        for j=1:b
        for k=1: nnz(clusterArch.cluster.clusterloc(:,i*2))    
        netXloc=clusterArch.cluster.cluster2(clusterArch.cluster.RNSet.RNset2(j)).x;
        netYloc=clusterArch.cluster.cluster2(clusterArch.cluster.RNSet.RNset2(j)).y;
        distance = sqrt((netXloc - clusterArch.cluster.cluster2(k).x)^2....
        + (netYloc - clusterArch.cluster.cluster2(k).y)^2);
        figure(i+2), hold on
        plot( netXloc, netYloc,'o', 'MarkerSize',15,'MarkerFaceColor', 'y');
        plot( clusterArch.cluster.clusterloc(:,((i*2)-1)), clusterArch.cluster.clusterloc(:,(i*2)),...
        '.', 'MarkerSize',15);
    plot( netXloc, netYloc,'o', 'MarkerSize',15,'MarkerFaceColor', 'y');


a=clusterArch.cluster.cluster2((clusterArch.cluster.CCOSet.CCOset2(1))).x;
b=clusterArch.cluster.cluster2((clusterArch.cluster.CCOSet.CCOset2(1))).y;
plot( a, b,'o', 'MarkerSize',15,'MarkerFaceColor', 'c');
c=clusterArch.cluster.cluster2((clusterArch.cluster.CHSet.CHset2(1))).x;
d=clusterArch.cluster.cluster2((clusterArch.cluster.CHSet.CHset2(1))).y;
plot( c, d,'o', 'MarkerSize',15,'MarkerFaceColor', 'm');
        xlim([0 200])
        ylim([20 40])
        if distance <= R
            if clusterArch.cluster.cluster2(k).G==0
        line([netXloc clusterArch.cluster.cluster2(k).x], [netYloc clusterArch.cluster.cluster2(k).y], 'LineStyle', ':');
        clusterArch.cluster.matrix.matrix2(clusterArch.cluster.RNSet.RNset2(j), k) = 1;
        clusterArch.cluster.cluster2(k).G=j;
            end
        else
             clusterArch.cluster.matrix.matrix2(clusterArch.cluster.RNSet.RNset2(j), k) = 0;
        end
        end
        end
        end
         
        if i==3
        [a,b]=size(clusterArch.cluster.RNSet.RNset3);
        for j=1:b
        for k=1: nnz(clusterArch.cluster.clusterloc(:,i*2))      
        netXloc=clusterArch.cluster.cluster3(clusterArch.cluster.RNSet.RNset3(j)).x;
        netYloc=clusterArch.cluster.cluster3(clusterArch.cluster.RNSet.RNset3(j)).y;
        distance = sqrt((netXloc - clusterArch.cluster.cluster3(k).x)^2....
        + (netYloc - clusterArch.cluster.cluster3(k).y)^2);
    figure(i+2), hold on
        plot( netXloc, netYloc,'o', 'MarkerSize',15,'MarkerFaceColor', 'y');
        plot( clusterArch.cluster.clusterloc(:,((i*2)-1)), clusterArch.cluster.clusterloc(:,(i*2)),...
        '.', 'MarkerSize',15);
    a=clusterArch.cluster.cluster3((clusterArch.cluster.CCOSet.CCOset3(1))).x;
b=clusterArch.cluster.cluster3((clusterArch.cluster.CCOSet.CCOset3(1))).y;
plot( a, b,'o', 'MarkerSize',15,'MarkerFaceColor', 'c');
a=clusterArch.cluster.cluster3((clusterArch.cluster.CCOSet.CCOset3(2))).x;
b=clusterArch.cluster.cluster3((clusterArch.cluster.CCOSet.CCOset3(2))).y;
plot( a, b,'o', 'MarkerSize',15,'MarkerFaceColor', 'c');
c=clusterArch.cluster.cluster3((clusterArch.cluster.CHSet.CHset3(1))).x;
d=clusterArch.cluster.cluster3((clusterArch.cluster.CHSet.CHset3(1))).y;
plot( c, d,'o', 'MarkerSize',15,'MarkerFaceColor', 'm');
        xlim([0 200])
        ylim([40 60])
        if distance <= R
        if clusterArch.cluster.cluster3(k).G==0
        line([netXloc clusterArch.cluster.cluster3(k).x], [netYloc clusterArch.cluster.cluster3(k).y], 'LineStyle', ':');    
        clusterArch.cluster.matrix.matrix3(clusterArch.cluster.RNSet.RNset3(j), k) = 1;
        clusterArch.cluster.cluster3(k).G=j;
        end
        else
        clusterArch.cluster.matrix.matrix3(clusterArch.cluster.RNSet.RNset3(j), k) = 0;
        end
        end
        end
        end
        
        if i==4
        [a,b]=size(clusterArch.cluster.RNSet.RNset4);
        for j=1:b
        for k=1: nnz(clusterArch.cluster.clusterloc(:,i*2))      
        netXloc=clusterArch.cluster.cluster4(clusterArch.cluster.RNSet.RNset4(j)).x;
        netYloc=clusterArch.cluster.cluster4(clusterArch.cluster.RNSet.RNset4(j)).y;
        distance = sqrt((netXloc - clusterArch.cluster.cluster4(k).x)^2....
        + (netYloc - clusterArch.cluster.cluster4(k).y)^2);
    figure(i+2), hold on
        plot( netXloc, netYloc,'o', 'MarkerSize',15,'MarkerFaceColor', 'y');
        plot( clusterArch.cluster.clusterloc(:,((i*2)-1)), clusterArch.cluster.clusterloc(:,(i*2)),...
        '.', 'MarkerSize',15);
     a=clusterArch.cluster.cluster4((clusterArch.cluster.CCOSet.CCOset4(1))).x;
b=clusterArch.cluster.cluster4((clusterArch.cluster.CCOSet.CCOset4(1))).y;
plot( a, b,'o', 'MarkerSize',15,'MarkerFaceColor', 'c');
a=clusterArch.cluster.cluster4((clusterArch.cluster.CCOSet.CCOset4(2))).x;
b=clusterArch.cluster.cluster4((clusterArch.cluster.CCOSet.CCOset4(2))).y;
plot( a, b,'o', 'MarkerSize',15,'MarkerFaceColor', 'c');
a=clusterArch.cluster.cluster4((clusterArch.cluster.CCOSet.CCOset4(3))).x;
b=clusterArch.cluster.cluster4((clusterArch.cluster.CCOSet.CCOset4(3))).y;
plot( a, b,'o', 'MarkerSize',15,'MarkerFaceColor', 'c');
c=clusterArch.cluster.cluster4((clusterArch.cluster.CHSet.CHset4(1))).x;
d=clusterArch.cluster.cluster4((clusterArch.cluster.CHSet.CHset4(1))).y;
plot( c, d,'o', 'MarkerSize',15,'MarkerFaceColor', 'm');
        xlim([0 200])
        ylim([60 80])
    if distance <= R
if clusterArch.cluster.cluster4(k).G==0
        line([netXloc clusterArch.cluster.cluster4(k).x], [netYloc clusterArch.cluster.cluster4(k).y], 'LineStyle', ':');
        clusterArch.cluster.matrix.matrix4(clusterArch.cluster.RNSet.RNset4(j), k) = 1;
clusterArch.cluster.cluster4(k).G=j;
end
else
        clusterArch.cluster.matrix.matrix4(clusterArch.cluster.RNSet.RNset4(j), k) = 0;
        end
        end
        end
        end
        
        if i==5
        [a,b]=size(clusterArch.cluster.RNSet.RNset5);
        for j=1:b
        for k=1: nnz(clusterArch.cluster.clusterloc(:,i*2))      
        netXloc=clusterArch.cluster.cluster5(clusterArch.cluster.RNSet.RNset5(j)).x;
        netYloc=clusterArch.cluster.cluster5(clusterArch.cluster.RNSet.RNset5(j)).y;
        distance = sqrt((netXloc - clusterArch.cluster.cluster5(k).x)^2....
        + (netYloc - clusterArch.cluster.cluster5(k).y)^2);
    figure(i+2), hold on
        plot( netXloc, netYloc,'o', 'MarkerSize',15,'MarkerFaceColor', 'y');
        plot( clusterArch.cluster.clusterloc(:,((i*2)-1)), clusterArch.cluster.clusterloc(:,(i*2)),...
        '.', 'MarkerSize',15);
      a=clusterArch.cluster.cluster5((clusterArch.cluster.CCOSet.CCOset5(1))).x;
b=clusterArch.cluster.cluster5((clusterArch.cluster.CCOSet.CCOset5(1))).y;
plot( a, b,'o', 'MarkerSize',15,'MarkerFaceColor', 'c');
a=clusterArch.cluster.cluster5((clusterArch.cluster.CCOSet.CCOset5(2))).x;
b=clusterArch.cluster.cluster5((clusterArch.cluster.CCOSet.CCOset5(2))).y;
plot( a, b,'o', 'MarkerSize',15,'MarkerFaceColor', 'c');
a=clusterArch.cluster.cluster5((clusterArch.cluster.CCOSet.CCOset5(3))).x;
b=clusterArch.cluster.cluster5((clusterArch.cluster.CCOSet.CCOset5(3))).y;
plot( a, b,'o', 'MarkerSize',15,'MarkerFaceColor', 'c');
a=clusterArch.cluster.cluster5((clusterArch.cluster.CCOSet.CCOset5(4))).x;
b=clusterArch.cluster.cluster5((clusterArch.cluster.CCOSet.CCOset5(4))).y;
plot( a, b,'o', 'MarkerSize',15,'MarkerFaceColor', 'c');
c=clusterArch.cluster.cluster5((clusterArch.cluster.CHSet.CHset5(1))).x;
d=clusterArch.cluster.cluster5((clusterArch.cluster.CHSet.CHset5(1))).y;
plot( c, d,'o', 'MarkerSize',15,'MarkerFaceColor', 'm');
    
         xlim([0 200])
        ylim([80 100])
    if distance <= R
       if clusterArch.cluster.cluster5(k).G==0
        line([netXloc clusterArch.cluster.cluster5(k).x], [netYloc clusterArch.cluster.cluster5(k).y], 'LineStyle', ':');
        clusterArch.cluster.matrix.matrix5(clusterArch.cluster.RNSet.RNset5(j), k) = 1;
       clusterArch.cluster.cluster5(k).G=j;
       end
       else
        clusterArch.cluster.matrix.matrix5(clusterArch.cluster.RNSet.RNset5(j), k) = 0;
        end
        end
        end
        end
        
        if i==6
        [a,b]=size(clusterArch.cluster.RNSet.RNset6);
        for j=1:b
        for k=1: nnz(clusterArch.cluster.clusterloc(:,i*2))      
        netXloc=clusterArch.cluster.cluster6(clusterArch.cluster.RNSet.RNset6(j)).x;
        netYloc=clusterArch.cluster.cluster6(clusterArch.cluster.RNSet.RNset6(j)).y;
        distance = sqrt((netXloc - clusterArch.cluster.cluster6(k).x)^2....
        + (netYloc - clusterArch.cluster.cluster6(k).y)^2);
    figure(i+2), hold on
        plot( netXloc, netYloc,'o', 'MarkerSize',15,'MarkerFaceColor', 'y');
        plot( clusterArch.cluster.clusterloc(:,((i*2)-1)), clusterArch.cluster.clusterloc(:,(i*2)),...
        '.', 'MarkerSize',15);  
     a=clusterArch.cluster.cluster6((clusterArch.cluster.CCOSet.CCOset6(1))).x;
b=clusterArch.cluster.cluster6((clusterArch.cluster.CCOSet.CCOset6(1))).y;
plot( a, b,'o', 'MarkerSize',15,'MarkerFaceColor', 'c');
a=clusterArch.cluster.cluster6((clusterArch.cluster.CCOSet.CCOset6(2))).x;
b=clusterArch.cluster.cluster6((clusterArch.cluster.CCOSet.CCOset6(2))).y;
plot( a, b,'o', 'MarkerSize',15,'MarkerFaceColor', 'c');
a=clusterArch.cluster.cluster6((clusterArch.cluster.CCOSet.CCOset6(3))).x;
b=clusterArch.cluster.cluster6((clusterArch.cluster.CCOSet.CCOset6(3))).y;
plot( a, b,'o', 'MarkerSize',15,'MarkerFaceColor', 'c');
a=clusterArch.cluster.cluster6((clusterArch.cluster.CCOSet.CCOset6(4))).x;
b=clusterArch.cluster.cluster6((clusterArch.cluster.CCOSet.CCOset6(4))).y;
plot( a, b,'o', 'MarkerSize',15,'MarkerFaceColor', 'c');
a=clusterArch.cluster.cluster6((clusterArch.cluster.CCOSet.CCOset6(5))).x;
b=clusterArch.cluster.cluster6((clusterArch.cluster.CCOSet.CCOset6(5))).y;
plot( a, b,'o', 'MarkerSize',15,'MarkerFaceColor', 'c');
c=clusterArch.cluster.cluster6((clusterArch.cluster.CHSet.CHset6(1))).x;
d=clusterArch.cluster.cluster6((clusterArch.cluster.CHSet.CHset6(1))).y;
plot( c, d,'o', 'MarkerSize',15,'MarkerFaceColor', 'm');
    
         xlim([0 200])
        ylim([100 120])
    if distance <= R
 if clusterArch.cluster.cluster6(k).G==0
        line([netXloc clusterArch.cluster.cluster6(k).x], [netYloc clusterArch.cluster.cluster6(k).y], 'LineStyle', ':');
    clusterArch.cluster.matrix.matrix6(clusterArch.cluster.RNSet.RNset6(j), k) = 1;
 clusterArch.cluster.cluster6(k).G=j;   
 end
 else
        clusterArch.cluster.matrix.matrix6(clusterArch.cluster.RNSet.RNset6(j), k) = 0;
        end
        end
        end
        end
        
        if i==7
        [a,b]=size(clusterArch.cluster.RNSet.RNset7);
        for j=1:b
        for k=1: nnz(clusterArch.cluster.clusterloc(:,i*2))      
        netXloc=clusterArch.cluster.cluster7(clusterArch.cluster.RNSet.RNset7(j)).x;
        netYloc=clusterArch.cluster.cluster7(clusterArch.cluster.RNSet.RNset7(j)).y;
        distance = sqrt((netXloc - clusterArch.cluster.cluster7(k).x)^2....
        + (netYloc - clusterArch.cluster.cluster7(k).y)^2);
    figure(i+2), hold on
        plot( netXloc, netYloc,'o', 'MarkerSize',15,'MarkerFaceColor', 'y');
        plot( clusterArch.cluster.clusterloc(:,((i*2)-1)), clusterArch.cluster.clusterloc(:,(i*2)),...
        '.', 'MarkerSize',15);
    a=clusterArch.cluster.cluster7((clusterArch.cluster.CCOSet.CCOset7(1))).x;
b=clusterArch.cluster.cluster7((clusterArch.cluster.CCOSet.CCOset7(1))).y;
plot( a, b,'o', 'MarkerSize',15,'MarkerFaceColor', 'c');
a=clusterArch.cluster.cluster7((clusterArch.cluster.CCOSet.CCOset7(2))).x;
b=clusterArch.cluster.cluster7((clusterArch.cluster.CCOSet.CCOset7(2))).y;
plot( a, b,'o', 'MarkerSize',15,'MarkerFaceColor', 'c');
a=clusterArch.cluster.cluster7((clusterArch.cluster.CCOSet.CCOset7(3))).x;
b=clusterArch.cluster.cluster7((clusterArch.cluster.CCOSet.CCOset7(3))).y;
plot( a, b,'o', 'MarkerSize',15,'MarkerFaceColor', 'c');
a=clusterArch.cluster.cluster7((clusterArch.cluster.CCOSet.CCOset7(4))).x;
b=clusterArch.cluster.cluster7((clusterArch.cluster.CCOSet.CCOset7(4))).y;
plot( a, b,'o', 'MarkerSize',15,'MarkerFaceColor', 'c');
a=clusterArch.cluster.cluster7((clusterArch.cluster.CCOSet.CCOset7(5))).x;
b=clusterArch.cluster.cluster7((clusterArch.cluster.CCOSet.CCOset7(5))).y;
plot( a, b,'o', 'MarkerSize',15,'MarkerFaceColor', 'c');
a=clusterArch.cluster.cluster7((clusterArch.cluster.CCOSet.CCOset7(6))).x;
b=clusterArch.cluster.cluster7((clusterArch.cluster.CCOSet.CCOset7(6))).y;
plot( a, b,'o', 'MarkerSize',15,'MarkerFaceColor', 'c');
c=clusterArch.cluster.cluster7((clusterArch.cluster.CHSet.CHset7(1))).x;
d=clusterArch.cluster.cluster7((clusterArch.cluster.CHSet.CHset7(1))).y;
plot( c, d,'o', 'MarkerSize',15,'MarkerFaceColor', 'm');
       xlim([0 200])
        ylim([120 140])
    if distance <= R
       if clusterArch.cluster.cluster7(k).G==0
        line([netXloc clusterArch.cluster.cluster7(k).x], [netYloc clusterArch.cluster.cluster7(k).y], 'LineStyle', ':');
            clusterArch.cluster.matrix.matrix7(clusterArch.cluster.RNSet.RNset7(j), k) = 1;
       clusterArch.cluster.cluster7(k).G=j; 
       end
       else
        clusterArch.cluster.matrix.matrix7(clusterArch.cluster.RNSet.RNset7(j), k) = 0;
        end
        end
        end
        end
        
        if i==8
        [a,b]=size(clusterArch.cluster.RNSet.RNset8);
        for j=1:b
        for k=1: nnz(clusterArch.cluster.clusterloc(:,i*2))     
        netXloc=clusterArch.cluster.cluster8(clusterArch.cluster.RNSet.RNset8(j)).x;
        netYloc=clusterArch.cluster.cluster8(clusterArch.cluster.RNSet.RNset8(j)).y;
        distance = sqrt((netXloc - clusterArch.cluster.cluster8(k).x)^2....
        + (netYloc - clusterArch.cluster.cluster8(k).y)^2);
    figure(i+2), hold on
        plot( netXloc, netYloc,'o', 'MarkerSize',15,'MarkerFaceColor', 'y');
        plot( clusterArch.cluster.clusterloc(:,((i*2)-1)), clusterArch.cluster.clusterloc(:,(i*2)),...
        '.', 'MarkerSize',15);
    a=clusterArch.cluster.cluster8((clusterArch.cluster.CCOSet.CCOset8(1))).x;
b=clusterArch.cluster.cluster8((clusterArch.cluster.CCOSet.CCOset8(1))).y;
plot( a, b,'o', 'MarkerSize',15,'MarkerFaceColor', 'c');
a=clusterArch.cluster.cluster8((clusterArch.cluster.CCOSet.CCOset8(2))).x;
b=clusterArch.cluster.cluster8((clusterArch.cluster.CCOSet.CCOset8(2))).y;
plot( a, b,'o', 'MarkerSize',15,'MarkerFaceColor', 'c');
a=clusterArch.cluster.cluster8((clusterArch.cluster.CCOSet.CCOset8(3))).x;
b=clusterArch.cluster.cluster8((clusterArch.cluster.CCOSet.CCOset8(3))).y;
plot( a, b,'o', 'MarkerSize',15,'MarkerFaceColor', 'c');
a=clusterArch.cluster.cluster8((clusterArch.cluster.CCOSet.CCOset8(4))).x;
b=clusterArch.cluster.cluster8((clusterArch.cluster.CCOSet.CCOset8(4))).y;
plot( a, b,'o', 'MarkerSize',15,'MarkerFaceColor', 'c');
a=clusterArch.cluster.cluster8((clusterArch.cluster.CCOSet.CCOset8(5))).x;
b=clusterArch.cluster.cluster8((clusterArch.cluster.CCOSet.CCOset8(5))).y;
plot( a, b,'o', 'MarkerSize',15,'MarkerFaceColor', 'c');
a=clusterArch.cluster.cluster8((clusterArch.cluster.CCOSet.CCOset8(6))).x;
b=clusterArch.cluster.cluster8((clusterArch.cluster.CCOSet.CCOset8(6))).y;
plot( a, b,'o', 'MarkerSize',15,'MarkerFaceColor', 'c');
a=clusterArch.cluster.cluster8((clusterArch.cluster.CCOSet.CCOset8(7))).x;
b=clusterArch.cluster.cluster8((clusterArch.cluster.CCOSet.CCOset8(7))).y;
plot( a, b,'o', 'MarkerSize',15,'MarkerFaceColor', 'c');
c=clusterArch.cluster.cluster8((clusterArch.cluster.CHSet.CHset8(1))).x;
d=clusterArch.cluster.cluster8((clusterArch.cluster.CHSet.CHset8(1))).y;
plot( c, d,'o', 'MarkerSize',15,'MarkerFaceColor', 'm');
     xlim([0 200])
      ylim([140 160])
    if distance <= R
       if clusterArch.cluster.cluster8(k).G==0
       line([netXloc clusterArch.cluster.cluster8(k).x], [netYloc clusterArch.cluster.cluster8(k).y], 'LineStyle', ':');
            clusterArch.cluster.matrix.matrix8(clusterArch.cluster.RNSet.RNset8(j), k) = 1;
       clusterArch.cluster.cluster8(k).G=j;
       end
      
       else
        clusterArch.cluster.matrix.matrix8(clusterArch.cluster.RNSet.RNset8(j), k) = 0;
        end
        end
        end
        end
        
        if i==9
        [a,b]=size(clusterArch.cluster.RNSet.RNset9);
        for j=1:b
        for k=1: nnz(clusterArch.cluster.clusterloc(:,i*2))      
        netXloc=clusterArch.cluster.cluster9(clusterArch.cluster.RNSet.RNset9(j)).x;
        netYloc=clusterArch.cluster.cluster9(clusterArch.cluster.RNSet.RNset9(j)).y;
        distance = sqrt((netXloc - clusterArch.cluster.cluster9(k).x)^2....
        + (netYloc - clusterArch.cluster.cluster9(k).y)^2);
    figure(i+2), hold on
        plot( netXloc, netYloc,'o', 'MarkerSize',15,'MarkerFaceColor', 'y');
        plot( clusterArch.cluster.clusterloc(:,((i*2)-1)), clusterArch.cluster.clusterloc(:,(i*2)),...
        '.', 'MarkerSize',15);  
a=clusterArch.cluster.cluster9((clusterArch.cluster.CCOSet.CCOset9(1))).x;
b=clusterArch.cluster.cluster9((clusterArch.cluster.CCOSet.CCOset9(1))).y;
plot( a, b,'o', 'MarkerSize',15,'MarkerFaceColor', 'c');
a=clusterArch.cluster.cluster9((clusterArch.cluster.CCOSet.CCOset9(2))).x;
b=clusterArch.cluster.cluster9((clusterArch.cluster.CCOSet.CCOset9(2))).y;
plot( a, b,'o', 'MarkerSize',15,'MarkerFaceColor', 'c');
a=clusterArch.cluster.cluster9((clusterArch.cluster.CCOSet.CCOset9(3))).x;
b=clusterArch.cluster.cluster9((clusterArch.cluster.CCOSet.CCOset9(3))).y;
plot( a, b,'o', 'MarkerSize',15,'MarkerFaceColor', 'c');
a=clusterArch.cluster.cluster9((clusterArch.cluster.CCOSet.CCOset9(4))).x;
b=clusterArch.cluster.cluster9((clusterArch.cluster.CCOSet.CCOset9(4))).y;
plot( a, b,'o', 'MarkerSize',15,'MarkerFaceColor', 'c');
a=clusterArch.cluster.cluster9((clusterArch.cluster.CCOSet.CCOset9(5))).x;
b=clusterArch.cluster.cluster9((clusterArch.cluster.CCOSet.CCOset9(5))).y;
plot( a, b,'o', 'MarkerSize',15,'MarkerFaceColor', 'c');
a=clusterArch.cluster.cluster9((clusterArch.cluster.CCOSet.CCOset9(6))).x;
b=clusterArch.cluster.cluster9((clusterArch.cluster.CCOSet.CCOset9(6))).y;
plot( a, b,'o', 'MarkerSize',15,'MarkerFaceColor', 'c');
a=clusterArch.cluster.cluster9((clusterArch.cluster.CCOSet.CCOset9(7))).x;
b=clusterArch.cluster.cluster9((clusterArch.cluster.CCOSet.CCOset9(7))).y;
plot( a, b,'o', 'MarkerSize',15,'MarkerFaceColor', 'c');
a=clusterArch.cluster.cluster9((clusterArch.cluster.CCOSet.CCOset9(8))).x;
b=clusterArch.cluster.cluster9((clusterArch.cluster.CCOSet.CCOset9(8))).y;
plot( a, b,'o', 'MarkerSize',15,'MarkerFaceColor', 'c');
c=clusterArch.cluster.cluster9((clusterArch.cluster.CHSet.CHset9(1))).x;
d=clusterArch.cluster.cluster9((clusterArch.cluster.CHSet.CHset9(1))).y;
plot( c, d,'o', 'MarkerSize',15,'MarkerFaceColor', 'm');
       xlim([0 200])
        ylim([160 180])
    if distance <= R
       if clusterArch.cluster.cluster9(k).G==0
        line([netXloc clusterArch.cluster.cluster9(k).x], [netYloc clusterArch.cluster.cluster9(k).y], 'LineStyle', ':');
        clusterArch.cluster.matrix.matrix9(clusterArch.cluster.RNSet.RNset9(j), k) = 1;
       clusterArch.cluster.cluster9(k).G=j;
       end
       else
        clusterArch.cluster.matrix.matrix9(clusterArch.cluster.RNSet.RNset9(j), k) = 0;
        end
        end
        end
        end
        
        if i==10
        [a, b]=size(clusterArch.cluster.RNSet.RNset10);
        for j=1:b
        for k=1: nnz(clusterArch.cluster.clusterloc(:,i*2))      
        netXloc=clusterArch.cluster.cluster10(clusterArch.cluster.RNSet.RNset10(j)).x;
        netYloc=clusterArch.cluster.cluster10(clusterArch.cluster.RNSet.RNset10(j)).y;
        distance = sqrt((netXloc - clusterArch.cluster.cluster10(k).x)^2....
        + (netYloc - clusterArch.cluster.cluster10(k).y)^2);
    figure(i+2), hold on
        plot( netXloc, netYloc,'o', 'MarkerSize',15,'MarkerFaceColor', 'y');
        plot( clusterArch.cluster.clusterloc(:,((i*2)-1)), clusterArch.cluster.clusterloc(:,(i*2)),...
        '.', 'MarkerSize',15);  
a=clusterArch.cluster.cluster10((clusterArch.cluster.CCOSet.CCOset10(1))).x;
b=clusterArch.cluster.cluster10((clusterArch.cluster.CCOSet.CCOset10(1))).y;
plot( a, b,'o', 'MarkerSize',15,'MarkerFaceColor', 'c');
a=clusterArch.cluster.cluster10((clusterArch.cluster.CCOSet.CCOset10(2))).x;
b=clusterArch.cluster.cluster10((clusterArch.cluster.CCOSet.CCOset10(2))).y;
plot( a, b,'o', 'MarkerSize',15,'MarkerFaceColor', 'c');
a=clusterArch.cluster.cluster10((clusterArch.cluster.CCOSet.CCOset10(3))).x;
b=clusterArch.cluster.cluster10((clusterArch.cluster.CCOSet.CCOset10(3))).y;
plot( a, b,'o', 'MarkerSize',15,'MarkerFaceColor', 'c');
a=clusterArch.cluster.cluster10((clusterArch.cluster.CCOSet.CCOset10(4))).x;
b=clusterArch.cluster.cluster10((clusterArch.cluster.CCOSet.CCOset10(4))).y;
plot( a, b,'o', 'MarkerSize',15,'MarkerFaceColor', 'c');
a=clusterArch.cluster.cluster10((clusterArch.cluster.CCOSet.CCOset10(5))).x;
b=clusterArch.cluster.cluster10((clusterArch.cluster.CCOSet.CCOset10(5))).y;
plot( a, b,'o', 'MarkerSize',15,'MarkerFaceColor', 'c');
a=clusterArch.cluster.cluster10((clusterArch.cluster.CCOSet.CCOset10(6))).x;
b=clusterArch.cluster.cluster10((clusterArch.cluster.CCOSet.CCOset10(6))).y;
plot( a, b,'o', 'MarkerSize',15,'MarkerFaceColor', 'c');
a=clusterArch.cluster.cluster10((clusterArch.cluster.CCOSet.CCOset10(7))).x;
b=clusterArch.cluster.cluster10((clusterArch.cluster.CCOSet.CCOset10(7))).y;
plot( a, b,'o', 'MarkerSize',15,'MarkerFaceColor', 'c');
a=clusterArch.cluster.cluster10((clusterArch.cluster.CCOSet.CCOset10(8))).x;
b=clusterArch.cluster.cluster10((clusterArch.cluster.CCOSet.CCOset10(8))).y;
plot( a, b,'o', 'MarkerSize',15,'MarkerFaceColor', 'c');
a=clusterArch.cluster.cluster10((clusterArch.cluster.CCOSet.CCOset10(9))).x;
b=clusterArch.cluster.cluster10((clusterArch.cluster.CCOSet.CCOset10(9))).y;
plot( a, b,'o', 'MarkerSize',15,'MarkerFaceColor', 'c');
c=clusterArch.cluster.cluster10((clusterArch.cluster.CHSet.CHset10(1))).x;
d=clusterArch.cluster.cluster10((clusterArch.cluster.CHSet.CHset10(1))).y;
plot( c, d,'o', 'MarkerSize',15,'MarkerFaceColor', 'm');
       xlim([0 200])
        ylim([180 200])
    if distance <= R
        if clusterArch.cluster.cluster10(k).G==0
       line([netXloc clusterArch.cluster.cluster10(k).x], [netYloc clusterArch.cluster.cluster10(k).y], 'LineStyle', ':');
            clusterArch.cluster.matrix.matrix10(clusterArch.cluster.RNSet.RNset10(j), k) = 1;
        clusterArch.cluster.cluster10(k).G=j;
        end
        else
        clusterArch.cluster.matrix.matrix10(clusterArch.cluster.RNSet.RNset10(j), k) = 0;
        end
        end
        end
        end
        %}
end
gClusterArch=clusterArch;
        clear a b i distance i index j k R count netXloc netYloc c d 
end
        