%Testing the efficency of the Brute_StudentIndex function
%Set Up
clear all

Score = 0;
%%
%Effects of varying the number of students
for j = 1:1000
    if j >= 10
        Data = TestDataMk2(j,10,0,0);
        SPABrute = SPA_Brute_StudentIndex(Data);
        Score(1,j) = TestEffMk2(SPABrute,Data);
    else
        Score(1,j) = 0;
    end
end
for j = 1:1000
    if j >= 50
        Data = TestDataMk2(j,50,0,0);
        SPABrute = SPA_Brute_StudentIndex(Data);
        Score(2,j) = TestEffMk2(SPABrute,Data);
    else
        Score(2,j) = 0;
    end
end

for j = 1:1000
    if j >= 100
        Data = TestDataMk2(j,100,0,0);
        SPABrute = SPA_Brute_StudentIndex(Data);
        Score(3,j) = TestEffMk2(SPABrute,Data);
    else
        Score(3,j) = 0;
    end
end

% for i = 1:1000
%     if i >= 50
%     rand('seed',2);
%     Data = TestDataMk2(i,10,0,0);
%     SPABrute = SPA_Brute_StudentIndex(Data);
%     Score(2,i) = TestEffMk2(SPABrute,Data);
%     else
%         Score(2,i) = 0;
%     end
% end
% for i = 1:1000
%     if i >= 100
%     rand('seed',3);
%     Data = TestDataMk2(i,100,0,0);
%     SPABrute = SPA_Brute_StudentIndex(Data);
%     Score(3,i) = TestEffMk2(SPABrute,Data);
%     else
%         Score(3,i) = 0;
%     end
% end

%%
%Averages
% ScoreMean(1) = mean(Score(1,:));
% ScoreMean(2) = mean(Score(2,:));
%Displaying graphs
scatter(1:length(Score(1,:)),Score(1,:),'+','k');
title({'Effects Of Varying Number Of Students In The BruteStudentIndex Program';'With The Number Of Choices = The Number Of Students';'Scoring System Adding The Max Number Of Students'});
xlabel('Number Of Students');
ylabel('Program Score');
hold all
scatter(1:length(Score(2,:)),Score(2,:),'+','b');
scatter(1:length(Score(3,:)),Score(3,:),'+','y');



