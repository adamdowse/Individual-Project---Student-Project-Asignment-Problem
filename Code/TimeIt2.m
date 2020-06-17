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






for i = 1:50
    j = 1;
    for k = [floor(linspace(1,20,100)),20:10:100]
        TData = TestDataMk3(100,100,k,0,0);
        [Score3(i,j),t3(i,j)] = GeneticAllocation90(100,100,TData,100);
        disp(t3(i,j))
        j = j+1;
        
    end
end
















