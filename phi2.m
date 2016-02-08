function [ y ] = phi2( x )
% fonction phi2
    global n_phi2;
    n_phi2 = n_phi2+1;
    
    y = 4 / (x-38)^2 + 400 / (x+20)^2 - 0.7^2;

end

