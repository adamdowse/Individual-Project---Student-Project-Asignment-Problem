%fINDING THE BEST STUDENT TIME POPULATION GRAPH
% 
% for k = 1:10
%     jk = 0;
%     %Loop population size
%     for j = [2,4,8,16,32]
%         jk = jk + 1;
%         ik = 0;
%         %Loop Students
%         for i = [10,20,40,80,160,320]
%             ik = ik + 1;
%             TData = TestDataMk3(i,i,i,0,0);
%             time100(jk,ik,k) = GeneticAllocation90(i,i,TData,j);
%             disp(j);
%             disp(i);
%         end
%     end
% end
%-----------------------------------------------------------------------------
%Changing mutation rate
% j = 1;
% for i = [logspace(1,-3,8),logspace(-3,-5,3), 0]
%     TData = TestDataMk3(100,100,100,0,0);
%     [Score(j,:),t(j,:)] = GeneticAllocation90(100,100,TData,100,i);
%     disp(Score);
%     j = j+1;
% end
%-----------------------------------------------------------------------------

%Changing Number of students

for k = 1:5
    j = 1;
    for i = [floor(logspace(1,3,5))]
        TData = TestDataMk3(i,i,i,0,0);
        [Score2(k,j),t2(k,j)] = GeneticAllocation90(i,i,TData,100);
        j = j +1;
    end
end

% j = 1;
% for x = Eqx
%     Exp(j) = 175.6*exp(0.004061*x);
%     Pol2(j) = 0.009114*x^2-1.383*x+44.73;
%     Pol3(j) = 8.354e-06*x^3+0.002339*x^2-0.02792*x+2.433;
%     Pow(j) = 0.00005331*x^2.758;
%     Pol2CF(j) = 984.2*x^2+598.5*x+11.19;
%     day3(j) = 259200;
%     j = j+1;
% end













% % TData = TestDataMk3(100,100,100,0,0);

% H = HungarianMk2(TData);
% HScore = TestEffMk2(H,TData,3);
% [GScore30,time30] =GeneticAllocation90(18000,100,100,TData);