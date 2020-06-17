%Drawing the Graphs

% load('C:\Users\ad00878\OneDrive\Documents\Uni\Individual Project - Student Project Asignment Problem\Data\Hungarian\HungarianTTMaster.mat')
% %Hungarian
% loc = [1, 50, 100, 101, 102, 103];
% x = [1, 50, 100, 500, 1000, 1500];
% xP= 1:5000;
% 
% HMaximum = max(HungarianTTMaster);
% HAverage = mean(HungarianTTMaster,'omitnan');
% 
% HAverageFit = 1.134E-7.*xP.^2.544;
% HMaxFit = 1.466E-7.*xP.^2.582;
% 
% 
% %Plot Hungarian
% 
% hold all
% scatter(x,HAverage(loc),[],'Blue');
% plot(xP,HAverageFit,'Blue');
% scatter(x,HMaximum(loc),[],'Red');
% plot(xP,HMaxFit,'Red');

%Brute
% hold all
% x = 1:10;
% X = linspace(1,15);
% 
% BMax = max(bnew);
% BAverage = mean(bnew,'omitnan');
% 
% BMaxFit = 2.226E-5.*gamma(1.065.*X+1);
% BAveFit = 2.117E-5.*gamma(1.066.*X+1);
% 
% y = ones(1,100).*259200;
% 
% scatter(x,BMax);
% scatter(x,BAverage);
% plot(X,BMaxFit);
% plot(X,BAveFit);
% plot(X,y);
x = logspace(0,7);
YBF = BF(x);
YG = G(x);
YH = H(x);
YMP = MP(x);

function y = BF(x)
    y = 2.117e-5.*gamma(1.066.*x+1);
end
function y1 = G(x)
    %y = 46.57*exp(0.009676*x);
    y1 = 1.17e-7.*x.^3.965;
end
function y1 = H(x)
    y1 = 2.573e-7.*x.^2.456;
end
function y1 = MP(x)
    y1 = 9.331e-8.*x.^1.98;
end




