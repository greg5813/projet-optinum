function [ res ] = La( x, lambda, mu, f, c )
% lagrangien augmenté
    global n_La;
    n_La = n_La+1;

res = f(x)+lambda'*c(x)+(mu*norm(c(x))^2)/2;

end

