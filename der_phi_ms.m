function [ phi ] = phi_ms( lambda, delta, V, vp, g )
% derivée de la fonction phi definie dans more_sorensen
    global n_der_phi_ms;
    n_der_phi_ms = n_der_phi_ms + 1;

    phi = 0;
    for i=1:size(vp,1)
        phi = phi -(2*(V(:,i)'*g)^2/(vp(i)+lambda))^3;
    end

end

