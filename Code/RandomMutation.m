function [Allocation,Score] = RandomMutation(TData)
Score = [inf];
ScoreTheSameCount = 0;
for n = 1: 500
    Array = 1:size(TData,2);
    A = [];
    for i = 1:length(Array)
        RandNum = randi(length(Array));
        A = [A, Array(RandNum)];
        Array(RandNum) = [];
    end
    if TestEffMk2(A,TData,0) <= min(Score)
        Allocation = A;
        Score(n) = TestEffMk2(A,TData,0);
    else
        Score(n) = min(Score);
        ScoreTheSameCount = ScoreTheSameCount +1;
    end
    if ScoreTheSameCount > 100
        break
    end
end
end



