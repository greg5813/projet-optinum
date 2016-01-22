function [y] = f1(x)
% fonction f1
    global n_f1;
    n_f1 = n_f1+1;
    
    y = 2 * ( x(1) + x(2) + x(3) - 3 )^2 + ( x(1) - x(2) )^2 + ( x(2) - x(3) )^2;
    
end

