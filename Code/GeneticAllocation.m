function [BestScore,time] = GeneticAllocation(MinTime,NumberOfStudents,NumberOfProjects,CostMat)
%   WRITE ABOUT IT

%Start a timer
t = cputime;
PopSize = 100;
%MutationChance = 1/(PopSize*sqrt(NumberOfStudents));   %Mutation chance is said to be good at 1/(PopSize*sqrt(AllocationLength))
MutationChance = 1/(PopSize*sqrt(NumberOfStudents));
%Create random population
%   Try making the allocations permutations, would need to be incoperated
%   in rest of code too
Pop = randi(NumberOfProjects,PopSize,NumberOfStudents);
       
%Itterations
i = 0;
while (cputime - t) < MinTime
    i = i + 1;
    time(i) = cputime - t;
    [Score,EzScore] = fitness(Pop,CostMat);         %Calculate the score of each creature
    Prob(i,:) = Score;
    BScore(i,:) = EzScore;
    AverageScore(i) = mean(EzScore);                %Find the average score
    BestScore(i) = max(EzScore);                    %Find the max score
    BestScoreIndex = find(EzScore==BestScore(i));   %Find the index of the score
    BestScoreIndex = BestScoreIndex(1);             %Reduce the size to a scalar
    Allocation = Pop(BestScoreIndex,:);             %Find the best solution form this 
    Pop = CrossoverAndMutation(Pop,Score,NumberOfProjects,MutationChance);
end
end

%----Functions----%
function [Score,EzScore] = fitness(Pop,CostMat)
%Calculate the scores of each creature
Score = zeros(1,size(Pop,1));                       %Preallocate var size
for i = 1:size(Pop,1)                               %Begin Loop through the population
    Score(i) = TestEffMk2(Pop(i,:),CostMat,3);      %Score using function
end
EzScore = Score;
Score = Score./sum(Score);                          %This makes it sum to 1
end

function [NewPop] = CrossoverAndMutation(Pop,Score,NumberOfProj,MutationChance)
%Select 2 creatures and combine the genes
%New crossover function to stop mutiple projects being allocated to a
%student

for i = 1:size(Pop,1)
    Index1 = randsrc(1,1,[1:length(Score);Score]);
    Index2 = randsrc(1,1,[1:length(Score);Score]);
    U = Pop(Index1,:);
    V = Pop(Index2,:);
    UScore = Score(Index1);
    VScore = Score(Index2);
    C = zeros(1,size(Pop,2));
    Availible = 1:NumberOfProj;
    
    
    %Main Algo
    for j = 1:size(Pop,2)
        RandChance = rand();
        if (~ismember(U(j),C)) && (~ismember(V(j),C)) && (RandChance > MutationChance)
            if U(j) == V(j)
                C(j) = U(j);
                Availible(Availible == C(j)) = [];
            else
                if UScore >= VScore
                    C(j) = U(j);
                    Availible(Availible == C(j)) = [];
                else
                    C(j) = V(j);
                    Availible(Availible == C(j)) = [];
                end
            end
        elseif (~ismember(U(j),C)) && (ismember(V(j),C))
            C(j) = U(j);
            Availible(Availible == C(j)) = [];
        elseif (ismember(U(j),C)) && (~ismember(V(j),C))
            C(j) = V(j);
            Availible(Availible == C(j)) = [];
        else
            %Select value not in C
            C(j) = Availible(randi(size(Availible)));
            Availible(Availible == C(j)) = [];
        end
    end
    NewPop(i,:) = C;  
    
end
end




