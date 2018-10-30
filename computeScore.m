function curScore = computeScore(x, y, match, mismatch)

if(x==y)
    curScore = match;
else
    curScore = mismatch;
end

end