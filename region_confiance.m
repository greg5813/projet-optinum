function [ res ] = region_confiance(f, g_f, H_f, x_0, delta_0, delta_max, gamma_1, gamma_2, eta_1, eta_2, epsilon_1, epsilon_2, maxiter )

    %f_tmp = str2func(nom_f);
    %f = @(x) f_tmp(x);
    %gf_tmp = str2func(nom_g_f);
    %g_f = @(x) gf_tmp(x);
    %Hf_tmp = str2func(nom_H_f);
    %H_f = @(x) Hf_tmp(x);
    

    niter = 0;
    x_k = x_0;
    delta_k = delta_0;
    f_k = f(x_0);
    g_0 = g_f(x_0);
    g_k = g_0;
    H_k = H_f(x_0);
    
    
    while ( norm(g_k)/norm(g_0) >= epsilon_1 && niter <= maxiter )
        
        [s_k, ~] = more_sorensen( g_k, H_k, delta_k );
        %[s_k, ~] = pas_cauchy( g_k, H_k, delta_k );

        if ( norm(s_k) < epsilon_2 )
            disp('stagnation')
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
        
        niter = niter + 1;
        
    end
    
    res = x_k;
    disp(niter)
    
end

