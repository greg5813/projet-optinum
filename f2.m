function [y] = f2(x)
% fonction f2
    global n_f2;
    n_f2 = n_f2+1;
    
    y = 100*(x(2)-x(1)^2)^2 + (1-x(1))^2;
    
end

