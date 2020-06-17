%Writing all the possible permutations to a files as a database
loc = 'C:\Users\adamd\OneDrive\Documents\Uni\Individual Project - Student Project Asignment Problem\Data\test2.xls';
Array = [1,2,3,4,5,6,7,8,9,10];

for i = 1:factorial(size(Array,2))
    DataIndex = "A"+int2str(i)+":J"+int2str(i);
    writematrix(nthPerm(Array,i),loc,'Range',DataIndex);
end