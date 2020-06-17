
%Different Scoring Styles

for i = 1:1000
    TData = TestDataMk2(100,100,0,0);
    Allocation = Hungarian(TData);
    Scores0(i) = TestEffMk2(Allocation,TData,0);
    Scores1(i) = TestEffMk2(Allocation,TData,1);
    Scores2(i) = TestEffMk2(Allocation,TData,2);
    Average= [mean(Scores0),mean(Scores1),mean(Scores2)];
end

x = 1:100;
hold all
scatter(1,Scores0);
scatter(2,Scores1);
scatter(3,Scores2);
