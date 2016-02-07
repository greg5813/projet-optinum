function [x] = newton_local(grad_f, hess_f, x0, epsilon, epsilon2, maxiter)
  % NEWTON_LOCAL algorithme de Newton local
  % x = newton_local(f, grad_f, hess_f, x0, epsilon, epsilon2, maxiter)
  
  % grad_f gradient de la fonction dont on cherche un minimum
  % hess_f hessienne de la fonction dont on cherche un minimum
  % x0 point de départ, première estimation de la solution recherchée
  % epsilon précision demandée
  % epsilon2 précision du cas de stagnation
  % maxiter nombre maximal d'itérations
  % x solution 
     
  	x = x0;
    grad_f_x = grad_f(x);
    norm_grad_f_x0 = norm(grad_f(x0));
    niter = 0;
    
    while ( norm(grad_f_x) >= epsilon*norm_grad_f_x0 && niter <= maxiter)
        niter = niter + 1;
                
        x_prev = x;
        d = hess_f(x) \ (-grad_f_x);
		x = x + d;   
        if ( norm(x-x_prev) < epsilon2*norm(x_prev) )
            fprintf('[Newton local] stagnation\n')
            break;
        end
        grad_f_x = grad_f(x);
    end

    fprintf('[Newton local] niter : %d\n', niter)
end

