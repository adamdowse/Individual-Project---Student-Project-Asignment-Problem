% Student Project Allocator.
% """"""""""""""""""""""""""
% Finds the optimum solution from a csv file allocating students to
% projects. Please use the google doc template given by:
% https://forms.gle/G215nbwpbBCCsrKD7
%
% Steps to use:
% 1: Create a google form and have the students enter the project number of
%    their top n choices. Ensure all responces are set to manditory.
% 2: Download the responces as a csv file
% 3: Adjust variables
% 4: Run this code
% 5: Convert the .csv file to an excel sheet and upload to surrey learn
%
% By Adam Dowse 
% University Of Surrey

% --------------------------------
% CHANGE THESE VARIABLES:
FileLoc = "C:\Users\adamd\OneDrive\Documents\Uni\Individual Project - Student Project Asignment Problem\Code\Project_Allocations_Test1.csv";
NumOfProj = 20;
% --------------------------------

% Variables
OData = readmatrix(FileLoc);
OData = OData';
StudentIndex = OData(2,:);
OData(1:2,:) = [];
NumOfStud = size(OData,2);
NumOfChoices = size(OData,1);
Data = zeros(NumOfProj,NumOfStud);

% Convert into cost matrix
for i = 1:NumOfStud
    for j = 1:NumOfChoices
        if OData(j,i) > 0 
            Data(OData(j,i),i) = j;
        end
    end
end

% Replace zeros with arbitary large value
[x,y] = find(Data == 0);
for i = 1:length(x)
    Data(x(i),y(i)) = NumOfChoices + 10000;
end

%Produce allocation
Allocation = matchpairs(Data,1000);
Allocation(:,2) = StudentIndex';

%Output Data
writematrix(Allocation);
