
%Different Scoring Styles

for i = 1:100
    TData = TestDataMk2(100,i,0,0);
    Allocation = Hungarian(TData);
    Scores0(i) = TestEffMk2(Allocation,TData,0);
    Scores1(i) = TestEffMk2(Allocation,TData,1);
    Scores2(i) = TestEffMk2(Allocation,TData,2);
end

x = 1:100;
hold all
scatter(x,Scores0);
scatter(x,Scores1);
scatter(x,Scores2);