function [OutArray] = nthPerm(Array,Index)
%nthPerm Calculates the nth permutation in lexographical order
%   Uses factoral remainders to find the next possible number in each index
%   that could give the desierded index. 
%   Code based on the following artical:
%   https://math.stackexchange.com/questions/60742/finding-the-n-th-lexicographic-permutation-of-a-string
%   Array is the Numbers to be permuted
%   Index is the Lexographical index of the permutation we are trying to
%   achieve

%-------Variable Initiation-------%
Len = length(Array);                            %The number of numbers that needs to be manipulated.
Inversei = 0;                                   %Start counting up from 0.             

%-------Main Function-------%
for i = linspace(Len-1,1,Len-1)                 %Work backwards across the permutation with i from the length minus 1 
    Inversei = Inversei + 1;                    %Track the index going up from one
    x = 0;                                      %x is reset to 0.
    while (Index < 0) || (Index > factorial(i)) %While the Index is less than 0 or greater than the factorial of the position in the number                    
        x = x + 1;                              %Increase the digit by 1
        Index = Index - factorial(i);           %Minus the factorial of the digit position from the Index
    end
    OutArray(Inversei) = Array(x+1);            %The selected Digit is added to the final output array
    Array(x+1) = [];                            %The same element is removed from array
end
OutArray(Len) = Array;                          %The last element left in array is added to the end of the output array
end

