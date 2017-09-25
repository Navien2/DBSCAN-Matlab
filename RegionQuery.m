function Neighbors=RegionQuery(i,D,epsilon)
        Neighbors=find(D(i,:)<=epsilon); % distance will work one by one i=1 to 10 
    end