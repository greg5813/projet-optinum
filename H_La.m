function [ res ] = H_La( x, lambda, mu, H_f, c, H_c, J_c )
%H_LA Summary of this function goes here
%   Detailed explanation goes here

    c_x = c(x);
    H_c_x = H_c(x);
    J_c_x = J_c(x);

    res = H_f(x)+lambda'*H_c(x)+(mu*(J_c_x'*J_c_x));
    
    for i =1:size(c_x,1)
        longueur = size(H_c_x,2);
        res = res + mu * (c_x(i,:) * H_c_x((i-1)*longueur+1:i*longueur,:));
    end

end

