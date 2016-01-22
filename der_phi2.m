function [ y ] = der_phi2( x )
% derivée de phi2
    global n_der_phi2;
    n_der_phi2 = n_der_phi2 + 1;

    y = -8 / (x-38)^3 -800 / (x+20)^3;

end

