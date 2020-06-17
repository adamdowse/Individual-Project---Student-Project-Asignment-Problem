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






for i = 1:100
    j = 1;
    for k = floor(1:2:100)
        TData = TestDataMk3(100,100,k,0,0);
        t0 = cputime();
        Allocation = matchpairs(TData,100);
        t(i,j) = cputime() - t0;
        disp(t(i,j))
        Score(i,j) = TestEffMk2(Allocation,TData,0);
        j = j+1;
    end
end
















