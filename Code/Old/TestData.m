function TData = TestData(Type,NumStudents,NumChoices)
%OLD DONT USE TESTDATA Produces a set of random test data with students and their
%prefered projects.
%   Detailed explanation goes here

%Randomly assigns the studnets prefered project choices
%Creates an index of students from 1 to the max number of students
%Combines these matricies
if Type == 0
    Randchoices = randi(NumStudents,NumChoices,NumStudents); 
    
elseif Type == 1
        
end
StudentIndex = linspace(1,NumStudents,NumStudents);
TData = [StudentIndex;Randchoices];



%Add different types of rand choices
end

