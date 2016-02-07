function [ s ] = pas_cauchy( g_k, H_k, delta_k )
% PAS_CAUCHY calcul du pas de cauchy
% s = pas_cauchy( g_k, H_k, delta_k )

% g_k gradient de la fonction dont on cherche un minimum au point de
% l'itéré k
% H_k hessienne de la fonction dont on cherche un minimum au point de
% l'itéré k
% delta_k taille de la région de confiance à l'itéré k
% s point de la solution du pas de Cauchy à l'itéré k

    c = g_k'*H_k*g_k;

    if ( g_k == 0 )
        t = 0;
    else
        rc = delta_k/norm( g_k );
        if ( c <= 0 )
            t = rc;
        else
            t = min( rc, norm(g_k)^2/c );
        end
    end

    s = -t*g_k;
    
end

