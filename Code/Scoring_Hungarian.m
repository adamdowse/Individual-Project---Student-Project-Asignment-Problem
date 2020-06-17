

for i = 1 : 1000
    TData = TestDataMk2(8,8,0,0);
    AllocatedH = Hungarian(TData);
    Score(1,i) = TestEffMk2(AllocatedH,TData);
    
    AllocatedB = Brute(TData);
    Score(2,i) = TestEffMk2(AllocatedB,TData);
    
    DiffScore = Score(1,:) - Score(2,:);
    
end

% for i = 1 : 1
%     TData = TestDataMk2(10,10,2,0);
%     Allocated = SPA_Brute_StudentIndex(TData);
%     Score(i,2) = TestEffMk2(Allocated,TData);
% end

%histogram(Score);