function [ s, lambda ] = more_sorensen( g, H, delta )
    
    s = 0;
    lambda = 0;
    [V,D] = eig(H);
    vp = diag(D);
    d = H\-g;
    phi = @(x) phi_ms(x,delta,V,vp,g);
    der_phi = @(x) der_phi_ms(x,delta,V,vp,g);
    
    if ( min(vp) >= 0 && norm(d) < delta )
        %disp('pas de newton accepté')
        s = d;
    else
        %disp('pas de newton refusé')
        [vp, indices] = sort(vp);
        V = V(:,indices);
        if ( V(:,1)'*g ~= 0 )
            %disp('pas semi def pos')
            lambda_min = -vp(1) + 10^-6;
            lambda_max = lambda_min +1;
            niter = 0;
            while (phi(lambda_min)*phi(lambda_max)>=0 && niter<1000)
                lambda_max = sign(lambda_max)*1.5*lambda_max;
                niter = niter + 1;
            end
            if (niter == 100)
                disp('attention pas de couple lambda_min lambda_max trouvé');
            end
            lambda = newton_non_lineaire(phi,der_phi,lambda_min,lambda_max,10^-10,10000);
            for i=1:size(vp,1)
                s = s -((V(:,i)'*g)/(vp(i)+lambda))*V(:,i);
            end
        else
           % disp('projection')
            s_1 = 0;
            for i=2:size(vp,1)
                s_1 = s_1 -((V(:,i)'*g)/(vp(i)+lambda))*V(:,i);
            end
            if (norm(s_1)>delta)
               % disp('cas facile')
                lambda_min = -vp(1) + 10^-6;
                lambda_max = lambda_min +1;
                niter = 0;
                while (phi(lambda_min)*phi(lambda_max)>=0 && niter<1000)
                    lambda_max = sign(lambda_max)*1.5*lambda_max;
                    niter = niter + 1;
                end
                if (niter == 100)
                    disp('attention pas de couple lambda_min lambda_max trouvé');
                end
                lambda = newton_non_lineaire(phi,der_phi,lambda_min,lambda_max,10^-10,10000);
                for i=1:size(vp,1)
                    s = s -((V(:,i)'*g)/(vp(i)+lambda))*V(:,i);
                end
            else
                %disp('cas difficile')
                s = s_1 + sqrt(delta^2 - norm(s_1)^2)*V(:,1);
                lambda = -vp(1);
            end
        end
    end
    

end


