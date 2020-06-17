function [Allocated] = Hungarian(TData)
% A function that returns the allocated projects using the hungarian method
% The input is the cost matrix of the projects and the students
%%
%----------Row and Column Reductions Function----------%
function [TData] = RCReductions(TData)
%TData is the cost matrix of projects and students
%Basically manipulates the cost matrix, reducing it
    %-----Row Reductions-----%
    for i = 1:length(TData)                                 %Loop through the rows
        TData(i,:) = TData(i,:) - min(TData(i,:));          %Each row - the lowest value in that row
    end
    %-----Coloumn Reductions-----%
    for i = 1:length(TData)                                 %loop tyhrough the columns
        TData(:,i) = TData(:,i) - min(TData(:,i));          %Each coloumn - the lowest value in each coloumn
    end
end
%%
%----------Row and Column Scanning Function----------%
function [Allocated,TData,Completed] = RCScanning(TData)
    %Inputs :  the cost matrix 
    %Outputs: the Allocated array of projects
    %         the TData cost modified matrix
    %         weather the final answer has been reached
    %-----Initialise variables-----%
    LinesNum = 0;                               %The number of lines that have been drawn onto the matrix
    Lines = zeros(length(TData));               %An array showing where the lines cover once drawn
    Allocated = zeros(1,length(TData));         %Initialised array for the allocated projects with zeros
    %-----
    while nnz(~TData(find(Lines == 0))) ~= 0            %while the number of zero values in TData that corrospond to where the lines matrix has a zero value does not equal 0
        ZeroSumR = sum((TData == 0 & Lines == 0),2);    %an array of the sum of values where TData and Lines equal 0 in the rows. 
        ZeroSumR(ZeroSumR == 0) = NaN;                  %Where ZeroSumR equals 0 set it to NaN
        ZeroSumC = sum((TData == 0 & Lines == 0),1);    %an array of the sum of values where TData and Lines equal 0 in the columns. 
        ZeroSumC(ZeroSumC == 0) = NaN;                  %Where ZeroSumC equals 0 set it to NaN
        if min(ZeroSumR) > 1 && min(ZeroSumC) > 1       %if the smallest value in ZeroSumR and ZeroSumC are less than 1
            [row,col] = find(Lines == 0 & TData == 0);      %Gives the index of where Lines and TData equals zero to the row and column arrays
            Lines(row(1),:) = NaN;                          %Changes the column corosponding to selected row index to NaN 
            LinesNum = LinesNum + 1;                        %Increases lineNum by 1
            Lines(:,col(1)) = Lines(:,col(1)) + 1;          %Increases the column corrospoding to the row index by one
            Allocated(col(1)) = row(1);                     %The allocated project is the first column valueand the row is the student 
        else                                                                 
            for i = 1:length(TData)                                         %Scan rows for zeros
                ModData = TData(i,find(Lines(i,:)==0));                     %The parts of the row that is not covered by a line (SINGLE ROW)
                if nnz(~ModData) == 1                                       %If the number of zeros not covered by a line = 1
                    ZeroIndex = find(TData(i,:) == 0 & Lines(i,:) == 0);    %The index of the zeros in Lines and TData
                    Lines(:,ZeroIndex) = Lines(:,ZeroIndex) +1;             %Add 1 to the column where the 0 was found in the row
                    LinesNum = LinesNum + 1;                                %Increase the number of lines used
                    Allocated(ZeroIndex)= i;                                %Add project selection to the allocation array (i is the student)
                end
            end
            for i = 1:length(TData)                                         %Scan Columns for zeros
                ModData = TData(find(Lines(:,i)==0),i);                     %The parts of the column that is not covered by a line (SINGLE COLUMN)
                if nnz(~ModData) == 1                                       %If the number of zeros not covered by a line = 1
                    ZeroIndex = find(TData(:,i) == 0 & Lines(:,i) == 0);    %The index of the zero
                    Lines(ZeroIndex,:) = Lines(ZeroIndex,:) +1;             %Add 1 to the row where the zero was found in the coloumn
                    LinesNum = LinesNum + 1;                                %Increase the number of lines used
                    Allocated(i)= ZeroIndex;                                %Add selection to the allocation array (i is the project index)
                end
            end
        end
    end
    if length(TData) == LinesNum                %If the size of the array is equal to the number of lines drawn the solution is found
        Completed = 1;                          %The solution is found
    else
        Completed = 0;                          %The solution is not found
        ModData = TData(find(Lines == 0));      %Find the values in TData that corrospond to where Lines equal 0
        ModIndex = find(Lines == 0);            %Find the indexes where Lines equal 0
        for i = ModIndex                        %Loop through ModIndex as i becomes each value
            TData(i) = TData(i) - min(ModData); %Minus the minimum value in ModData from the indexs shown above
        end
        ModIndex = find(Lines == 2);            %All cells with a value of 2 in lines add min value to them in
        for i = ModIndex                        
            TData(i) = TData(i) + min(ModData); %Add the minimum value in ModData to the other ModData values
        end                                     %leave all cells with Line equal to 1
    end           
end
%%
%----------------MAIN PROGRAM----------------%
for j = 1: 100000                                                                           %Repeat an arbitary large amount of time
    TData = RCReductions(TData);                                                            %Run the function RCReductions on TData
    [Allocated,TData,Completed] = RCScanning(TData);                                        %Run the function RCScanning on TData
    if Completed == 1                                                                       %if the function returns completed as 1 break 
        FoundSolution = 1;
        break
    end
    if j == 100000                                                                          %if the repetitions are up the solution has not been found
        FoundSolution = 0;
    end
end
end