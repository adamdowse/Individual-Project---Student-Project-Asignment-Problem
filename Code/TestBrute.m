%Testing Brute

TData = [   1,1,1,1,1
            2,2,2,2,2
            3,3,3,3,3
            4,4,4,4,4
            5,5,5,5,5];
Allocation = Brute(TData);
Score(1) = TestEffMk2(Allocation,TData,0);

TData = [1,2,3,4,5;2,1,3,4,5;3,2,1,4,5;4,3,2,1,5;5,4,3,2,1];
Allocation = Brute(TData);
Score(2) = TestEffMk2(Allocation,TData,0);

for i = 3:10000
    TData = TestDataMk3(5,5,5,1,2);
    Allocation = Brute(TData);
    Score(i) = TestEffMk2(Allocation,TData,0);
end
