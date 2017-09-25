function [IDX, isnoise]=DBSCANf(X,epsilon,MinPts)

    C=0;
    n=size(X,1);
    % cluster lables initialize 
%    IDX=zeros(n,1);   
    D=pdist2(X,X);
    visited=false(n,1);  % produce array of logical false for example, false(2) logical 2x2 zero array 
    isnoise=false(n,1); % array of logical false 
    
    for i=1:n
        if ~visited(i)
            visited(i)=true;     
            Neighbors=RegionQuery(i,D,epsilon);      
            if numel(Neighbors) < MinPts  % Number of array elements 
                % X(i,:) is NOISE
                isnoise(i)=true;
            else
                C=C+1;
               IDX= ExpandCluster(i,Neighbors,C,visited,D,epsilon,MinPts,n);
            end
            
        end
    end