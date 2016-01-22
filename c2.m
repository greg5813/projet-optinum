function [ y ] = c2( x )
% fonction contrainte de f2
    global n_c2;
    n_c2 = n_c2+1;

    y = x(1)^2 + x(2)^2 - 1.5;

end

