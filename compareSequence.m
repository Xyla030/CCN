function compareSequence(s,t)

match = 1;
mismatch = -1;
indel = -1;

s = string(s);
t = string(t);

s = ['-',s];
t = ['-',t];

M = zeros(length(s),length(t));
SC = zeros(length(s),length(t));

bestS = '';
bestT = '';

for i = 1:length(s)
    for j = 1:length(t)
        if s(i) == '-' && t(j) == '-'
            SC(i,j) = 0;
            continue
        elseif s(i) == '-'
            SC(i,j) = SC(i,j-1) + indel;
            M(i,j) = 3;
            continue
        elseif t(j) == '-'
            SC(i,j) = SC(i-1,j) + indel;
            M(i,j) = 2;
            continue
        else
            curScore = computeScore(s(i),t(j),match,mismatch);
            SC(i,j) = max ([SC(i-1,j-1) + curScore;
                            SC(i-1, j) + indel;
                            SC(i, j-1) + indel]);
            
            if (SC(i,j) == (SC(i-1, j-1) + curScore))
                M(i,j) = 1;
            elseif (SC(i,j) == (SC(i-1, j) + indel) )
                M(i,j) = 2;
            elseif (SC(i,j) == SC(i, j-1) + indel )
                M(i,j) = 3;
            end
        end
    end
end

SC

[bestS,bestT] = retrieveAlignment(M,length(s),length(t),s,t,bestS,bestT,SC)

bestS = char(bestS);
bestT = char(bestT);

sim = 0;
for x=1:length(bestS)
    if bestS(x) == bestT(x)
        sim = sim + 2;
    else
        continue
    end
end

comparison = sim/(length(bestS)+length(bestT))

end
