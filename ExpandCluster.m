function IDX = ExpandCluster(i,Neighbors,C,visited,D,epsilon,MinPts,n)

 IDX=zeros(n,1);
IDX(i)=C;
k = 1;
while true
    j = Neighbors(k);
    
    if ~visited(j)
        
        visited(j)=true;
        
        Neighbors2=RegionQuery(j,D,epsilon);
        
        if numel(Neighbors2)>=MinPts
            
            Neighbors=[Neighbors Neighbors2];   %#ok
            
        end
    end
    
    if IDX(j)==0
        IDX(j)=C;
    end
    k = k + 1;
    if k > numel(Neighbors)
        break;
    end
end

 
    