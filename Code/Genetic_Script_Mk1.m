%Genetic Algorithm Test
%THIS SCRIPT TRIES TO OPTIMISE THE WHOLE COST MATRIX NOT THE ALLOCATION
PopSize = 1000;
NumberOfItterations = 1000;
NumberOfStudents = 10;
NumberOfProjects = 10;
NumberOfChoices = 10;

%Create random population
for i = 1:PopSize
    Pop(:,:,i) = TestDataMk3(NumberOfStudents,NumberOfProjects,NumberOfChoices,0,0);
end

%Itterations
for i = 1:NumberOfItterations
    Score = fitness(Pop);                           %Calculate the score of each creature
    AverageScore(i) = mean(Score);                  %Find the average score
    BestScore(i) = max(Score);                      %Find the max score
    BestScoreIndex = find(Score==BestScore(i));     %Find the index of the score
    BestScoreIndex = BestScoreIndex(1);             %Reduce the size to a scalar
    BestSolution = Pop(BestScoreIndex,:);           %Find the best solution form this 
    Pop = Crossover(Pop,Score);
    Pop = Mutation(Pop);
end

hold all
plot(BestScore);
plot(AverageScore);



%Functions
function [Score] = fitness(Pop)
%Calculate the scores of each creature
Score = zeros(1,size(Pop,1));                       %Preallocate var size
for j = 1:size(Pop,1)                               %Begin Loop through the population
    Score(j) = TestEffMk2(squeeze(Pop(:,:,j)),0,0);          %Score using function
    Score(j) = floor((Score(j)/size(Pop,2))*100);   %Normalise scores
end
end

function [NewPop] = Crossover(Pop,Score)
%Select 2 creatures and combine the genes
MutationPool = [];                                      %Preallocate var
for i = 1:length(Score)                                 %Loop through score
    MutationPool = [MutationPool , ones(1,Score(i))*i]; %Create pool
end
for i = 1:size(Pop,3)
    len = randi(size(Pop,2));       %Random length along parent
    a = randi(size(MutationPool));  %Random gene 1
    b = randi(size(MutationPool));  %Random gene 2
    %Use length to cut each parent and then create child
    parentA = Pop(:,:,MutationPool(a));
    parentB = Pop(:,:,MutationPool(b));
    NewPop(:,:,i) = [parentA(:,1:len) , parentB(:,len+1:end)];
end
end

function [Pop] = Mutation(Pop,NumberOfStudents,NumberOfProjects,NumberOfChoices)
%Mutation
MutationFreq = 95;   %out of 100 and lower is a higher mutation rate
for i = 1:size(Pop,3)
    if randi(100) > MutationFreq
        Pop(:,:,i) = TestData(NumberOfStudents,NumberOfProjects,NumberOfChoices,0,0);
    end
end
end

