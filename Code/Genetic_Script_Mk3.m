%Genetic Algorithm Test
ki = 0;
for k = [5, 10, 20, 40, 80, 160, 320, 640, 1280]
    ki = ki +1;
%for j = [10,50,100,500,1000]
PopSize = k;
NumberOfItterations = 1000;
NumberOfStudents = 150;
NumberOfProjects = 150;
NumberOfChoices = 150;
%Mutation chance is said to be good at 1/(PopSize*sqrt(AllocationLength))
MutationChance = 0.05;
%1/(PopSize*sqrt(NumberOfStudents));        %Between 0 and 1
CostMat = TestDataMk3(NumberOfStudents,NumberOfProjects,NumberOfChoices,0,0);
%CostMat = [1,2,3,4,5,6,7
           %2,3,4,5,6,7,1
          % 3,4,5,6,7,1,2
           %4,5,6,7,1,2,3
          % 5,6,7,1,2,3,4
          % 6,7,1,2,3,4,5
          % 7,1,2,3,4,5,6];

%Create random population
%   Try making the allocations permutations, would need to be incoperated
%   in rest of code too
Pop = randi(NumberOfProjects,PopSize,NumberOfStudents);
%Pop = [1,7,6,5,4,2,3
       %5,4,3,2,1,7,6
       %1,7,6,5,4,2,3
       %5,4,3,2,1,7,6
       %1,7,6,5,4,2,3];
       
%Itterations
for i = 1:NumberOfItterations
    [Score,EzScore] = fitness(Pop,CostMat);         %Calculate the score of each creature
    AverageScore(i) = mean(EzScore);                %Find the average score
    BestScore(i) = max(EzScore);                    %Find the max score
    BestScoreIndex = find(EzScore==BestScore(i));   %Find the index of the score
    BestScoreIndex = BestScoreIndex(1);             %Reduce the size to a scalar
    BestSolution = Pop(BestScoreIndex,:);           %Find the best solution form this 
    Pop = CrossoverAndMutation(Pop,Score,NumberOfProjects,MutationChance);
end

MAXSCORETOPLOT(ki,:) = BestScore(:);
AVERAGESCORETOPLOT(ki,:) = AverageScore(:);

%SmoothAverageScore = smooth(AverageScore,80);
%SmoothBestScore = smooth(BestScore,80);
%HungarianAllo = Hungarian(CostMat);
%HungarianScore = ones(1,NumberOfItterations).*TestEffMk2(HungarianAllo,CostMat,3);
hold all
plot(MAXSCORETOPLOT);
plot(AVERAGESCORETOPLOT);
%plot(HungarianScore);
%plot(AverageScore);
% end
end

%----Functions----%
function [Score,EzScore] = fitness(Pop,CostMat)
%Calculate the scores of each creature
Score = zeros(1,size(Pop,1));                       %Preallocate var size
for i = 1:size(Pop,1)                               %Begin Loop through the population
    Score(i) = TestEffMk2(Pop(i,:),CostMat,3);      %Score using function
    %Score(i) = (Score(i)/length(Score))*100;          %Normalise scores from 0 to 100
    %Score(i) = 100-Score(i);                        %Inverse of score
    
end
EzScore = Score;
Score = Score./sum(Score);
    
end
%end

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

% function [NewPop] = CrossoverAR(Pop,Score)
% %New Accept Reject crossover method to reduce var size
% x = 0;
% for i = 1:size(Pop,1)
%     while x == 0
%         a = randi(length(Score));
%         if a > randi(100)
%             break
%         end
%     end
%     while x == 0
%         b = randi(length(Score));
%         if b > randi(100)
%             break
%         end
%     end
%     len = randi(size(Pop,2));
%     parentA = Pop(a,:);
%     parentB = Pop(b,:);
%     NewPop(i,:) = [parentA(1:len) , parentB(len+1:end)];
% end
% end


