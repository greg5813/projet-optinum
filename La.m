function [ res ] = La( x, lambda, mu, f, c )
% lagrangien augmenté

res = f(x)+lambda'*c(x)+(mu*norm(c(x))^2)/2;

end

