function [Allocation] = Brute(TData)
%BRUTE The best possible score by viewing all possible scores
%   The algorithm loops through all the possible combinations to find the
%   best solution and outputs this as the allocation.
%   This method only caters up to 10 students becuase past this the maximum
%   array size is reached breaking matlab.

%----------Improvements-----------%
%Find all the possible best cases
%Add issues with choice numbers

%----------Initial Vars----------%
% PossAllocations = perms(1:size(TData,2));
% BestScore = inf;
% BestAllocation = zeros(1,size(TData,2));
Array = [1:size(TData,2)];
Allocation = [1:size(TData,2)];
BestScore = inf;


%----------Loop All Solutions----------%
% for i = 1:size(PossAllocations,1)
%     if TestEffMk2(PossAllocations(i,:),TData) < BestScore
%         %Update the best allocation and best score
%         BestScore = TestEffMk2(PossAllocations(i,:),TData);
%         BestAllocation = PossAllocations(i,:);  
%     end
% end
%--------MK2--------------%
for i = 1:factorial(size(TData,2))
    Perm = nthPerm(Array,i);
    if TestEffMk2(Perm,TData,0) < BestScore
        BestScore = TestEffMk2(Perm,TData,0);
        Allocation = Perm;
    end
end
%---------MK3-------------&


        

%----------Output Solution----------%
% Allocation = BestAllocation;
end

