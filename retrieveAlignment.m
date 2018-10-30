function [bestS, bestT] = retrieveAlignment(M,i,j,s,t,bestS,bestT,SC)

for x = 1: length(s)+length(2)
    if (M(i,j) == 0)
        return;
    end

    if (M(i,j) == 1)
        bestS = strcat( s(i) , bestS);
        bestT = strcat( t(j) , bestT);
        i = i-1;
        j = j-1;
    elseif (M(i,j) == 2)
        bestS = strcat( s(i) , bestS);
        bestT = strcat( '-' ,bestT);
        i = i-1;
    elseif (M(i,j) == 3)
        bestS = strcat( '-' ,bestS);
        bestT = strcat( t(j) , bestT);
        j = j-1
    end
end

end