%Animation


for iters = 1:46
    
    histogram(Score(iters,:))
    axis([0.3 0.7 0 900]);
    pause(0.3)

    drawnow;
end

