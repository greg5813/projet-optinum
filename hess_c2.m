function [ y ] = hess_c2( x )
% hessienne de c2
    global n_hess_c2;
    n_hess_c2 = n_hess_c2+1;

    y = [2 0; 0 2];

end

