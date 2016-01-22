function [ y ] = phi1( x )
% fonction phi1
    global n_phi1;
    n_phi1 = n_phi1+1;

    y = 4 / ( x+2 )^2 + 36 / ( x+14 )^2 - 0.5^2;

end

