function [ x_k ] = region_confiance(f, g_f, H_f, x_0, delta_0, delta_max, gamma_1, gamma_2, eta_1, eta_2, epsilon_1, epsilon_2, maxiter, pas )
% REGION_CONFIANCE algorithme des regions de confiance
% x_k = region_confiance(f, g_f, H_f, x_0, delta_0, delta_max, gamma_1, gamma_2, eta_1, eta_2, epsilon_1, epsilon_2, maxiter )
 
% f fonct dont on cherche un minimum
% grad_f gradient de la fonction dont on cherche un minimum
% hess_f hessienne de la fonction dont on cherche un minimum
% x_0 point de départ, première estimation de la solution recherchée
% delta_0 taille initiale de la région de confiance
% delta_max taille maximum de la région de confiance
% gamma_1 facteur de diminution de la taille de la région de confiance
% gamme_2 facteur d'augmentation de la taille de la région de confiance
% eta_1 seuil de diminution de la taille de la région de confiance
% eta_2 seuil d'augmentation de la taille de la région de confiance
% epsilon_1 précision demandée
% epsilon_2 précision du cas de stagnation
% maxiter nombre maximal d'itérations
% pas 0 pour le pas de Cauchy, 1 pour More-Sorensen
% x_k solution
  
    niter = 0;
    x_k = x_0;
    delta_k = delta_0;
    f_k = f(x_0);
    g_0 = g_f(x_0);
    g_k = g_0;
    H_k = H_f(x_0);
    
    
    while ( norm(g_k) >= epsilon_1*norm(g_0) && niter <= maxiter )
        niter = niter + 1;
        
        if (pas == 0) 
            [s_k, ~] = pas_cauchy( g_k, H_k, delta_k );
        else
            [s_k, ~] = more_sorensen( g_k, H_k, delta_k );
        end

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

