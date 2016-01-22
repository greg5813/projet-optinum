function [ y ] = grad_c1( x )
% gradient de c1
    global n_grad_c1;
    n_grad_c1 = n_grad_c1+1;

    y = [1; 0; 1];
 
end

