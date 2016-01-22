function [y] = hess_f1(x)
% hessienne de f1
    global n_hess_f1;
    n_hess_f1 = n_hess_f1+1;

    y = [6 2 4; 2 8 2; 4 2 6];
    
end

