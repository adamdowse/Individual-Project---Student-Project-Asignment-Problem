%Genetic Algorithm Test

PopSize = 10;
NumberOfItterations = 100000;

%Define Goal
Goal = [1 2 3 4 5 6 7 8];

%Create random population
Pop = randi(9,PopSize, length(Goal));

%Itterations
for i = 1:NumberOfItterations
    Score = fitness(Pop,Goal);  %Calculate the score of each gene
    AverageScore(i) = mean(Score);
    BestScore(i) = max(Score);     %Find the max score
    BestScoreIndex = find(Score==BestScore(i));    %Find the index of the score
    BestScoreIndex = BestScoreIndex(1);         %Reduce the size to a scalar
    BestSolution = Pop(BestScoreIndex,:);       %Find the best solution form this 
    Pop = Crossover(Pop,Score);
    Pop = Mutation(Pop);
end

hold all
plot(BestScore);
plot(AverageScore);



%Functions
function [Score] = fitness(Pop,Goal)
Score = zeros(1,size(Pop,1));
for j = 1:size(Pop,1)
    for i = 1:length(Goal)
        if Goal(i) == Pop(j,i)
            Score(j) = Score(j) + 1;
        end
    end
    Score(j) = floor((Score(j)/size(Pop,2))*100);
end
end

function [NewPop] = Crossover(Pop,Score)
MutationPool = [];

for i = 1:length(Score)
    MutationPool = [MutationPool , ones(1,Score(i))*i];
end
%Crossover
for i = 1:size(Pop,1)
    len = randi(size(Pop,2));       %Random length along parent
    a = randi(size(MutationPool));  %Random gene 1
    b = randi(size(MutationPool));  %Random gene 2
    %Use length to cut each paretn and then create child
    parentA = Pop(MutationPool(a),:);
    parentB = Pop(MutationPool(b),:);
    NewPop(i,:) = [parentA(1:len) , parentB(len+1:end)];
end
end

function [Pop] = Mutation(Pop)
%Mutation
MutationFreq = 95;   %out of 100 and lower is a higher mutation rate
for i = 1:size(Pop,1)
    if randi(100) > MutationFreq
        Pop(i,randi(size(Pop,2))) = randi(9);
        Pop(i,randi(size(Pop,2))) = randi(9);
        Pop(i,randi(size(Pop,2))) = randi(9);
    end
end
end

