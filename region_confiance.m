function [ x_k ] = region_confiance(f, g_f, H_f, x_0, delta_0, delta_max, gamma_1, gamma_2, eta_1, eta_2, epsilon_1, epsilon_2, maxiter )
% algorithme des regions de confiance

    niter = 0;
    x_k = x_0;
    delta_k = delta_0;
    f_k = f(x_0);
    g_0 = g_f(x_0);
    g_k = g_0;
    H_k = H_f(x_0);
    
    
    while ( norm(g_k) >= epsilon_1*norm(g_0) && niter <= maxiter )
        niter = niter + 1;
        
        [s_k, ~] = more_sorensen( g_k, H_k, delta_k );
        %[s_k, ~] = pas_cauchy( g_k, H_k, delta_k );

        if ( norm(s_k) < epsilon_2 )
            fprintf('[Region de confiance] stagnation\n')
            break;
        end
        
        f_xksk = f( x_k + s_k );
        rho_k = ( f_k - f_xksk ) / ( -g_k'*s_k - (s_k'*H_k*s_k)/2 );
        
        if ( rho_k >= eta_1 )
            x_k = x_k + s_k; 
            f_k = f( x_k );
            g_k = g_f( x_k );
            H_k = H_f( x_k );
        end
        
        if ( rho_k >= eta_2 )
            delta_k = min( gamma_2*delta_k, delta_max );
        elseif ( rho_k < eta_1 )
            delta_k = gamma_1*delta_k;           
        end
        
    end
   
    fprintf('[Region de confiance] niter : %d\n', niter)
    
end

