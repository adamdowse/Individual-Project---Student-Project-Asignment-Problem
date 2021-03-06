function TData = TestDataMk2(NumStudents,NumProjects,Type,Bias)
%TestData Produces a set of random test data with students and their
%prefered projects.
%   Type = 0: The Projects are completly random permutations.
%             The bias must also be set to 0.
%   Type = 1: Half the projects are assigned within the bias region
%   Type = 2: The best case senario where everyone recieves there first
%             choice.
%   Type = 3: The worst case senario where everyone picks the same choices
%         Students
%Projects 1 2 1 4
%         3 3 2 1
%         2 1 4 3
%         4 4 3 2
%The numbers in the matrix are the preference for that choice
%
%If the matrix has a limited number of choices
%LOOK AT HOW The matrix looks when choices are limited

%Initialise the size of the matrix to save time
TData = zeros(NumStudents);

%Error Check
if (Bias < NumProjects) && (Bias ~= 0)                          %If Bias is less than the number of projects and the bias is not zeros
    error('Bias must be at least the number of choices');       %Present an error
end


%Loop through all the columns and create a random permutaion. Select
%NumChoices from the set of 1 to NumStudents
if Type == 0
    for i = 1:NumStudents
        Perms = [1:NumProjects,ones(1,(NumStudents-NumProjects))*(NumStudents+1000)];
        TData(:,i) = Perms(randperm(length(Perms)))';
    end
    
elseif Type == 1
    for i = 1:NumStudents
        if randi(2) == 2
            TData(:,i) = (randperm(NumStudents,NumProjects));
        else
            TData(:,i) = (randperm(Bias,NumProjects));
        end
    end
    
elseif Type == 2
    TData(:,1) = [1:NumStudents]';
    for i = 2:NumStudents
        TData(1:(NumStudents+1-i),i) = [i:NumStudents]';
        TData(NumStudents+2-i:end,i) = [1:i-1]';
    end
    
elseif Type == 3
    for i = 1:NumStudents
        TData(:,i)= [1:NumStudents]';
    end
end

end

