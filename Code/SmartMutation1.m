function [Allocation,Score] = SmartMutation1(TData)

%Variables
Score = [inf];
ScoreTheSameCount = 0;

%Start the itterations 
for n = 1: 500
    %Reset variables
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
    %If the score is the same for x itterations take this as the best score
    if ScoreTheSameCount > 20
        break
    end
end
end


