function [x] = newton_local(f, grad_f, hess_f, x0, epsilon, epsilon2, maxiter)
  % algorithme de newton local
     
  	x = x0;
    norm_grad_f_x0 = norm(grad_f(x0));
    niter = 0;
    
    while ( norm(grad_f(x)) >= epsilon*norm_grad_f_x0 && niter <= maxiter)
        x_prev = x;
        d = hess_f(x) \ (-grad_f(x));
		x = x + d;             
        if ( norm(x-x_prev) < epsilon2*norm(x_prev) )
            fprintf('[Newton local] stagnation\n')
            break;
        end
		niter = niter + 1;
    end

    fprintf('[Newton local] niter : %d\n', niter)
end

