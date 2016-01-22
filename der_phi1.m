function [ y ] = der_phi1( x )
% dérivée de phi1
    global n_der_phi1;
    n_der_phi1 = n_der_phi1 + 1;

    y = -8 / (x+2)^3 - 72 / (x+14)^3; 

end

