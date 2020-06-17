function [Allocation] = Brute(TData)
%BRUTE The best possible score by viewing all possible scores
%   The algorithm loops through all the possible combinations to find the
%   best solution and outputs this as the allocation

%----------Initial Vars----------%
Array = 1:size(TData,2);            %The list of indexes that are to be used in the permutation
Allocation = 1:size(TData,2);       %The allocated projects witht he same number of students as in TData.
BestScore = inf;                    %Initialise the best score to be as bad as possible so the first score is always chosen in the first loop.

%--------Loop All solutions--------------%
for i = 1:factorial(size(TData,2))              %Loop from 1 to !(Number of students)
    Perm = nthPerm(Array,i);                    %Produces the permutation lexographically acording to the value of i nthPerm is a custom function
    if TestEffMk2(Perm,TData,0) < BestScore     %If this permutation of students produces a better scoring allocation 
        BestScore = TestEffMk2(Perm,TData,0);   %Adjust the BestScore to be the new score
        Allocation = Perm;                      %Allocation of projects is this permutation of students
    end
end
end

