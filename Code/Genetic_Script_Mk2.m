%Genetic Algorithm Test
for j = [10,50,100,500,1000]
PopSize = j;
NumberOfItterations = 1000;
NumberOfStudents = 50;
NumberOfProjects = 50;
NumberOfChoices = 50;
CostMat = TestDataMk3(NumberOfStudents,NumberOfProjects,NumberOfChoices,0,0);

%Create random population
%   Try making the allocations permutations, would need to be incoperated
%   in rest of code too
Pop = randi(NumberOfProjects,PopSize,NumberOfStudents);


%Itterations
for i = 1:NumberOfItterations
    Score = fitness(Pop,CostMat);                   %Calculate the score of each creature
    AverageScore(j,i) = mean(Score);                %Find the average score
    BestScore(j,i) = max(Score);                      %Find the max score
    BestScoreIndex = find(Score==BestScore(j,i));     %Find the index of the score
    BestScoreIndex = BestScoreIndex(1);             %Reduce the size to a scalar
    BestSolution = Pop(BestScoreIndex,:);           %Find the best solution form this 
    Pop = Crossover(Pop,Score);
    Pop = Mutation(Pop,NumberOfProjects);
end

SmoothAverageScore(j,:) = smooth(AverageScore(j,:),80);
SmoothBestScore(j,:) = smooth(BestScore(j,:),80);
hold all
plot(SmoothBestScore(j,:));
%plot(AverageScore);
end


%----Functions----%
function [Score] = fitness(Pop,CostMat)
%Calculate the scores of each creature
Score = zeros(1,size(Pop,1));                       %Preallocate var size
for i = 1:size(Pop,1)                               %Begin Loop through the population
    Score(i) = TestEffMk2(Pop(i,:),CostMat,0);      %Score using function
    Score(i) = floor((Score(i)/size(Pop,2))*100);   %Normalise scores from 0 to 100
    Score(i) = 100-Score(i);
end
end

function [NewPop] = Crossover(Pop,Score)
%Select 2 creatures and combine the genes
MutationPool = [];                                      %Preallocate var
for i = 1:length(Score)                                 %Loop through score
    MutationPool = [MutationPool , ones(1,Score(i))*i]; %Create pool
end
for i = 1:size(Pop,1)
    len = randi(size(Pop,2));       %Random length along parent
    a = randi(size(MutationPool));  %Random gene 1
    b = randi(size(MutationPool));  %Random gene 2
    %Use length to cut each parent and then create child
    parentA = Pop(MutationPool(a),:);
    parentB = Pop(MutationPool(b),:);
    NewPop(i,:) = [parentA(1:len) , parentB(len+1:end)];
end
end

function [NewPop] = CrossoverAR(Pop,Score)
%New Accept Reject crossover method to reduce var size
x = 0;
for i = 1:size(Pop,1)
    while x == 0
        a = randi(length(Score));
        if a > randi(100)
            break
        end
    end
    while x == 0
        b = randi(length(Score));
        if b > randi(100)
            break
        end
    end
    len = randi(size(Pop,2));
    parentA = Pop(a,:);
    parentB = Pop(b,:);
    NewPop(i,:) = [parentA(1:len) , parentB(len+1:end)];
end
end

function [Pop] = Mutation(Pop,NumberOfProjects)
%Mutation
MutationFreq = 99;   %out of 100 and lower is a higher mutation rate
for i = 1:size(Pop,1)
    if randi(100) > MutationFreq
        Pop(i,randi(size(Pop,2))) = randi(NumberOfProjects);
    end
end
end

