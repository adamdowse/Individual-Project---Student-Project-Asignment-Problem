function [FinalAllocated] = SPA_Brute_StudentItter(Data,Itter)
%FUNCTION NOT IN USE
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here

%Pre-assign the allocation matrix
NumOfTries = Itter;
Allocated = zeros(NumOfTries,length(Data));
Efficiency = zeros(1,NumOfTries);
%THIS DOES NOT WORK BECUASE THE DATA DOES NOT CHANGE, START THE SORT FROMA
%DIFFERET PLACE EACH CYCLE AND THEN COMPARE

for n = 1:NumOfTries
    
    Allocated(n,:)=SPA_Brute_StudentIndex(Data);
    Efficiency(n) = TestEffMk2(Allocated(n,:),Data);
end

MaxEff = max(Efficiency);
FinalAllocated = Allocated(find(MaxEff),:);


end



