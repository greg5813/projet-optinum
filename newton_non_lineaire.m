function [ lambda ] = newton_non_lineaire(phi, der_phi, lambda_min, lambda_max, epsilon, maxiter)

  %  phi_tmp = str2func(nom_phi);
  %  phi = @(x) phi_tmp(x);
  %  der_phi_tmp = str2func(nom_der_phi);
  %  der_phi = @(x) der_phi_tmp(x);

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
    end

    niter = niter +1;
end

