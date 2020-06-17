%Timeing Fucntions

%Time in seconds to run

% for i = 1:10000
%     n = 1; 
%     for k = 5
%         TData = TestDataMk2(k,k,0,0);
%         Allocation = HungarianMk2(TData);
%         Hungarian5(i,n) = TestEffMk2(Allocation,TData,0);
%         n = n+1;
%     end
%     n = 1; 
%     for k = 10
%         TData = TestDataMk2(k,k,0,0);
%         Allocation = HungarianMk2(TData);
%         Hungarian10(i,n) = TestEffMk2(Allocation,TData,0);
%         n = n+1;
%     end
%     n = 1;
%     for k = 100
%         TData = TestDataMk2(k,k,0,0);
%         Allocation = HungarianMk2(TData);
%         Hungarian100(i,n) = TestEffMk2(Allocation,TData,0);
%         disp(Hungarian100(i,n));
%         n = n+1;
%     end
% end





%Bfit(i)=(3.019E-9*exp(2.607*i));
% for i = 1:10
%     TData = TestDataMk2(i,i,0,0);
%     f = @() Hungarian(TData);
%     h(i)=timeit(f);
% end


% plot(t)
% hold all
% plot(f)
%plot(fac)
%plot(Bfit)






%for i = 1:100
% for i = 1:1000
%     TData = TestDataMk3(100,100,100,0,0);
%     t0 = cputime();
%     Allocation = HungarianMk2(TData);
%     Score100(i) = TestEffMk2(Allocation,TData,0);
%     disp(Score100(i))
% end
% for i = 1:1000
%     TData = TestDataMk3(10,10,10,0,0);
%     t0 = cputime();
%     Allocation = HungarianMk2(TData);
%     Score10(i) = TestEffMk2(Allocation,TData,0);
%     disp(Score10til(i))
% end
tMP = zeros(10,50);
tH = zeros(10,50);
tG = zeros(10,20);
tB = zeros(10,10);

for i = 1:10
    X = floor(logspace(0,3));
    k = 1;
    for j = X
        TData = TestDataMk3(j,j,j,0,0);  
        t=cputime();
        AllocationMP = matchpairs(TData,1000);
        tMP(i,k) = cputime() - t;
        
        TData = TestDataMk3(j,j,j,0,0);
        t=cputime();
        AllocationH = HungarianMk2(TData);
        tH(i,k) = cputime() - t;
        k = k+1;
    end
    XG = floor(logspace(0,2,20));
    k = 1;
    for j = XG
        TData = TestDataMk3(j,j,j,0,0);
        
        t0 = cputime();
        [score,t]= GeneticAllocation90(j,j,TData,100);
        tG(i,k) = cputime() - t0;
        
        k = k+1;
    end
    XM = 1:9; 
    k=1;
    for j = XM
        TData = TestDataMk3(j,j,j,0,0);
        t = cputime();
        AllocationB = Brute(TData);
        tB(i,k) = cputime() - t;
        k=k+1;
    end   
    disp(i)
end










