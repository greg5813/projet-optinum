function [ res ] = g_La( x, lambda, mu, g_f, c, g_c, J_c )
% gradient du lagrangien augmenté

res = g_f(x)+lambda'*g_c(x)+(mu*(J_c(x)'*c(x)));


end

