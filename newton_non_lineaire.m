function [ lambda ] = newton_non_lineaire(phi, der_phi, lambda_min, lambda_max, epsilon, maxiter)
% algorithme de newton pour les equations non linéaires

    niter = 0;
    lambda = lambda_max;

    while ( min( abs(phi(lambda_min)), abs(phi(lambda_max)) ) >= epsilon && niter<=maxiter )
   
        phi_lambda = phi(lambda);
        der_phi_lambda = der_phi(lambda);
        lambda_N = lambda - phi_lambda / der_phi_lambda;
    
        if ( lambda_min-lambda_N <=0 && lambda_max-lambda_N >=0 && abs(phi(lambda_N)) < abs(phi_lambda)/2 )
        lambda = lambda_N; 
        else
            lambda_D = (lambda_min + lambda_max) / 2;
            if ( phi(lambda_D)*phi(lambda_max) <= 0)
                lambda_min = lambda_D;
            else
                lambda_max = lambda_D;
            end
            lambda = lambda_D;
        end
        niter = niter +1;
    end

    fprintf('[Newton non linéaire] niter : %d\n', niter)
end

