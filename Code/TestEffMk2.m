function [Score] = TestEffMk2(Allocated,OriginalData,Type)
%TestEff calculates how happy students are with a certain system
%   The allocated projects are checked with the students wishlist. 2
%   metrics are then returned, the percentage of 'happy' students, in which the
%   student has received a project in their top x places.  

%Inital Vars
Score = 0;
iTot = 0;

%Standard Sum Mean
if Type == 0
    for i = 1:length(Allocated)
        %
        Score = Score + OriginalData(Allocated(i),i);
    end
    Score = Score / i;
    
%Weighted Mean
elseif Type == 1
    for i = 1:length(Allocated)
        Score = Score + OriginalData(Allocated(i),i)*i;
        iTot = iTot + i;
    end
    Score = Score / iTot;
    
%Squared Mean
elseif Type == 2
    for i = 1:length(Allocated)
        Score = Score + OriginalData(Allocated(i),i)*i^2;
        iTot = iTot +i^2;
    end
    Score = Score / iTot;
    
%Genetic Scoring
elseif Type == 3
    for i = 1:length(Allocated)
        Score = Score + OriginalData(Allocated(i),i);
    end
    %Y = (X - min(X)) / (max(X) - min(X)) changes from 0 to 1
    Score = Score - length(Allocated);
    Score = Score./((length(Allocated).*length(Allocated)) - length(Allocated));
    Score = 1 - Score;
%1 is good zero is bad
    
end
end

