function [ s ] = pas_cauchy( g_k, H_k, delta_k )

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

