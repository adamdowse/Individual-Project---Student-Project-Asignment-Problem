function [Allocation] = SumMethod(TData)

Sum = sum(TData,2);
Allocation = zeros(1,size(TData,2)) ;

while max(Sum) ~= 0
    
    %index of the maximum value in Sum 
    ProjIndex = find(Sum == max(Sum,[],'omitnan'));
    ProjIndex = ProjIndex(1);
    %Index of the minimum value in that row
    PreStudentIndex = find(TData(ProjIndex,:) == min(TData(ProjIndex,:),[],'omitnan'));
    
    if size(PreStudentIndex) == 1
        Allocation(PreStudentIndex) = ProjIndex;
        TData(ProjIndex,:) = NaN;
        TData(:,PreStudentIndex) = NaN;
    else
        [MinStudentIndexes,a] = find(TData(:,PreStudentIndex) == min(TData(:,PreStudentIndex),[],'omitnan'));
        FinalStudentIndex = find(min(Sum(MinStudentIndexes),[],'omitnan'));
        Allocation(FinalStudentIndex) = ProjIndex;
        TData(ProjIndex,:) = NaN;
        TData(:,FinalStudentIndex) = NaN;
    end
    Sum = sum(TData,2,'omitnan'); 
end
        
    
    