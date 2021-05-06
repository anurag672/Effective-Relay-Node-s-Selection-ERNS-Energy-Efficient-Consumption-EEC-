function cAr1 = Nodes(cAr, numNode)
% Create the node model randomly
%   
%   Input:
%       cAr     Network architecture
%       numNode    Number of Nodes in the field
%   Output:
%       cAr    Nodes architecture
%       nodesLoc    Location of Nodes in the field
%   Example:
%       cAr  = createNetwork();
%       cAr = createNodes(cAr, 100)
    
    
    for i = 1:numNode
        % x coordination of node
        cAr.node1(i).x      =   rand * cAr.Yard.Length;
        cAr.nodesLoc(i, 1) =   cAr.node1(i).x;
        % y coordination of node
        cAr.node1(i).y      =   rand * cAr.Yard.Width;
        cAr.nodesLoc(i, 2) =   cAr.node1(i).y;
        % the flag which determines the value of the indicator function? Ci(t)
        cAr.node1(i).G      =   0; %if g is 1 means node will report to RN1 and soon.
        % initially there are no cluster heads, only nodes
        cAr.node1(i).type   =   'NN'; % 'NN' = Normal-node,'RN'=Relay Node 'CH'=Cluster Head 'CCO'Cluster cordinate
        cAr.node1(i).energy =   cAr.Energy.init;
        
        cAr.node1(i).CH     = 0; % How many number of times this node become CH ?
        cAr.node1(i).clusterID     = 0; % How many number of times this node become CCO ?
        cAr.node1(i).RN     = 0; % How many number of times this node become RN ?
      
        cAr.node1(i).CCO=0; % Node belonges to which cluster
        cAr.node1(i).sl=0; 
        cAr.node1(i).dead=0;
    end
    cAr.numNode = numNode; % Number of Nodes in the field
     % number of dead nodes
     cAr1=cAr;
end