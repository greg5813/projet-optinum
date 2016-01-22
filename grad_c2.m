function [ y ] = grad_c2( x )
% gradient de c2
    global n_grad_c2;
    n_grad_c2 = n_grad_c2+1;
    
    y = 2*x;

end

