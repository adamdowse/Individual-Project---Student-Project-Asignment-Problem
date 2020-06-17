%Scoring Different Methods 
%Method Scores
clear all

NumOfItterations = 10000;
NumOfStudents = 10;
NumOfChoices = 10;
Type = 0;


for i = 1:NumOfItterations
    Data  = TestDataMk2(NumOfStudents,NumOfChoices,Type,0);
    
    %Hungarian
    AllocatedHun = Hungarian(Data);
    Score(i) = TestEffMk2(AllocatedHun,Data,0);
end

%Displaying Results
%MeanScores(1) = mean(Score(1,:));
%scatter(1:500,mean(Score,2)');
histogram(Score,10);
Info = [mean(Score),max(Score),min(Score)];