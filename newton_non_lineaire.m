function [ lambda , niter] = newton_non_lineaire(phi, der_phi, lambda_min, lambda_max, epsilon, maxiter)
% NEWTON_NON_LINEAIRE algorithme de newton pour les equations non linéaires
% lambda = newton_non_lineaire(phi, der_phi, lambda_min, lambda_max, epsilon, maxiter)

% phi fonction dont on cherche un zéro
% der_phi derivée de la fonction dont on cherche un zéro
% lambda_min borne inférieure de la zone de dichotomie
% lambda_max borne supérieure de la zone de dichotomie
% epsilon précision demandée
% maxiter nombre maximal d'itérations
% lambda solution

    niter = 0;
    lambda = lambda_max;
    phi_lambda_max = phi(lambda_max);

    while ( min( abs(phi(lambda_min)), abs(phi_lambda_max) ) >= epsilon && niter<=maxiter )
        niter = niter +1;
   
        phi_lambda = phi(lambda);
        der_phi_lambda = der_phi(lambda);
        lambda_N = lambda - phi_lambda / der_phi_lambda;
    
        if ( lambda_min-lambda_N <=0 && lambda_max-lambda_N >=0 && abs(phi(lambda_N)) < abs(phi_lambda)/2 )
        lambda = lambda_N; 
        else
            lambda_D = (lambda_min + lambda_max) / 2;
            if ( phi(lambda_D)*phi_lambda_max <= 0)
                lambda_min = lambda_D;
            else
                lambda_max = lambda_D;
                phi_lambda_max = phi(lambda_max);
            end
            lambda = lambda_D;
        end
        
    end

    fprintf('[Newton non linéaire] niter : %d\n', niter)
end

