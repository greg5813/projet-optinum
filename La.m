function [ res ] = La( x, lambda, mu, f, c )
%LA Summary of this function goes here
%   Detailed explanation goes here

res = f(x)+lambda'*c(x)+(mu*norm(c(x))^2)/2;

end

