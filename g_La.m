function [ res ] = g_La( x, lambda, mu, g_f, c, g_c, J_c )
%G_LA Summary of this function goes here
%   Detailed explanation goes here

res = g_f(x)+lambda'*g_c(x)+(mu*(J_c(x)'*c(x)));


end

