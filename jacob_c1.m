function [ y ] = jacob_c1( x )
% jacobienne de c1
    global n_jacob_c1;
    n_jacob_c1 = n_jacob_c1+1;

    y = [1 0 1];

end

