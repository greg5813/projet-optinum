function [ phi ] = phi_ms( lambda, delta, V, vp, g )

    phi = 0;
    for i=1:size(vp,1)
        phi = phi -(2*(V(:,i)'*g)^2/(vp(i)+lambda))^3;
    end

end
