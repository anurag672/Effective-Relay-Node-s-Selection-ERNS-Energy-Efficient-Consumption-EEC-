function [cAr1]= clusterClassification(cAr)
index =1;
for j=1:cAr.No_of_Cluster
for i=1:cAr.numNode
    
    if cAr.node1(i).x >= cAr.size(j).x1 && cAr.node1(i).x<=cAr.size(j).x2 ...
            && cAr.node1(i).y >= cAr.size(j).y1 && cAr.node1(i).y<=cAr.size(j).y2
        cAr.node1(i).clusterID=j;
        cAr.size(j).totalNode=cAr.size(j).totalNode+1;
        cAr.node(index).x=cAr.node1(i).x;
        cAr.node(index).y=cAr.node1(i).y;
        cAr.node(index).G=0;
        cAr.node(index).type = cAr.node1(i).type;
         cAr.node(index).bel = 0;
        cAr.node(index).energy = cAr.node1(i).energy;
        cAr.node(index).CH = cAr.node1(i).CH;
        cAr.node(index).clusterID = cAr.node1(i).clusterID;
        cAr.node(index).RN = cAr.node1(i).RN;
        cAr.node(index).CCO = cAr.node1(i).CCO;
        cAr.node(index).dead = 0;
        index = index+1;
    end
    cAr.size(j).aliveNode=cAr.size(j).totalNode;
end
end

for j=1:cAr.No_of_Cluster
value = ((cAr.size(j).x2-cAr.size(j).x1)/cAr.size(j).sl);
counter =0;
    for k =1:cAr.size(j).sl
        load =0;
        x1 = (k-1) * value;
        x2 = k * value;
        y1 = cAr.size(j).y1;
        y2 = cAr.size(j).y2;
        if counter == 0
        if j ==1
        new_s= 1;
        kk = cAr.size(j).totalNode;
        counter = counter +1;
        else
        new_s = new_s +cAr.size(j-1).totalNode;
        kk = kk + cAr.size(j).totalNode;
        counter = counter +1;
        end
        end
        for z =new_s: kk
               if cAr.node(z).x>x1 && cAr.node(z).x<=x2 ...
            && cAr.node(z).y>y1 && cAr.node(z).y<=y2   
        cAr.node(z).subclusterID = k;
        load =load+1;
             end
        end
       cAr.subLtotalnode(j,k) = load;   
    end
     
end


cAr.node1 =0;

cAr1=cAr;
end
        