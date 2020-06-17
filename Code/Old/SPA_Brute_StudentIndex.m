function [Allocated] = SPA_Brute_StudentIndex(Data)
%OLD DONT USE Brute force method to the SPA Problem 
%   Input raw students choices with students choices in each column
%   Outputs an 1D array of projects, the index is the student they are
%   assigned to.

%Find the size of the data
%Pre-assign the allocation matrix
% NumOfProjects = size(Data,1);
% NumOfStudents = size(Data,2);
% Allocated = zeros(1,NumOfStudents);

%Allocation Based on Student number
% for i = 1:NumOfStudents
%     for j = 1:NumOfChoices + 1
%         if j == NumOfChoices + 1
%             if (exist ('StudentsNotAllocated','var') == 1)
%                 StudentsNotAllocated = horzcat(StudentsNotAllocated,i);
%             else
%                 StudentsNotAllocated = i;
%             end
%             break
%         end
%         if ~ ismember(Data(j,i),Allocated)
%             Allocated(1,i) = j;
%             break   
%         end
%        
%     end
% end

% 
% for i = 1:NumOfStudents
%     for j = 1:NumOfProjects
%         if 
%             ProjectIndex=find(Data(:,i) == j);
%             Allocated(i) = ProjectIndex;
%             break
%         end
%     end
% end





%Back fill any students without projects could give them the oportunity to
%reasign or allocate randomly
% ProjectsNotAllocated = find(~Allocated);
% 
% for i = 1: length(ProjectsNotAllocated)
%     Allocated(ProjectsNotAllocated(i)) = StudentsNotAllocated(i);
% end
end

