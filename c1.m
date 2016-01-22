function [ y ] = c1( x )
% fonction contrainte de f1
    global n_c1;
    n_c1 = n_c1+1;
    
    y = x(1)+x(3)-1;

end

