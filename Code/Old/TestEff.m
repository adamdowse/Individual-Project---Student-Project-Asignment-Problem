function [PercentHappy,PercentFirst] = TestEff(Allocated,OriginalData,x)
%TestEff calculates how happy students are with a certain system
%   The allocated projects are checked with the students wishlist. 2
%   metrics are then returned, the percentage of 'happy' students, in which the
%   student has received a project in their top x places. 
%   In addition it also returns the 

%Inital Vars
NumOfFirstChoices = 0;
HappyChoices = 0;

%Error Checking
if x > size(OriginalData,1)
    error('The size of x must be less than or equal to the number of choices');
end

%Loops through all the students
for i = 1:length(Allocated)
    %Checks to see if the student has got their first choice 
    if OriginalData(1,i) == find(Allocated == i)
        NumOfFirstChoices = NumOfFirstChoices +1;
        HappyChoices = HappyChoices +1;
    else
        %Loops through the rest of the choices the student would be happy
        %with
        for n = 2:x
            if OriginalData(n,i) == find(Allocated == i)
                HappyChoices = HappyChoices +1;
                break
            end
        end
    end
end

%Calculates the percentages
PercentHappy = (NumOfFirstChoices/length(Allocated))*100;
PercentFirst = (HappyChoices/length(Allocated))*100;
end

