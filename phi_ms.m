function [ phi ] = phi_ms( lambda, delta, V, vp, g )
% fonction phi défénit dans more_sorensen

    phi = 0;
    for i=1:size(vp,1)
        phi = phi +((V(:,i)'*g)/(vp(i)+lambda))^2;
    end
    phi = phi - delta^2;
    
end

