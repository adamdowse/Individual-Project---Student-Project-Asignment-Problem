%Timeing Genetic

spacing = floor(logspace(1,3));


for j = 1:3
    k = 0;
    for i = spacing
        k = k+1;

        CostMat = TestDataMk3(i,i,i,0,0);
        time(j,k) = GeneticAllocation90(i,i,CostMat,50);
        disp(j);
        disp(i);
    end
end