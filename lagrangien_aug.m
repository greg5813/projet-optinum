function [ x_k, lambda_k, mu_k ] = lagrangien_aug( f, g_f, H_f, c, g_c, H_c, J_c, mu_0, tau, x_0, lambda_0, eps1, eps2, eps3, maxiter, delta_0, delta_max, gamma_1, gamma_2, eta_1, eta_2, eps4, eps5, maxiter2 )

eta_0_chap = 0.1258925;
alpha = 0.1;
beta = 0.9;
eps_0 = 1/mu_0;
eta_0 = eta_0_chap/mu_0^alpha;
x_k = x_0;
x_k_prec = x_k + eps3 + 1;
mu_k = mu_0;
eps_k = eps_0;
lambda_k = lambda_0;
eta_k = eta_0;
k = 0;

g_L = g_La(x_k,lambda_k,0,g_f,c,g_c,J_c);

while ( norm(g_L)>=eps1 && norm(c(x_k))>=eps2 && k<=maxiter ) 
    
    La = @(x) La(x,lambda_k,mu_k,f,c)
    g_La = @(x) g_La(x,lambda_k,mu_k,g_f,c,g_c,J_c);
    H_La = @(x) H_La(x,lambda_k,mu_k,H_f,c,H_c,J_c);
    
    x_k_prev = x_k;
    x_k = region_confiance(La,g_La,H_La,x_k,delta_0,delta_max,gamma_1,gamma_2,eta_1,eta_2,eps4,eps5,maxiter2);
    
    if (norm(g_La(x_k))<eps_k)
        disp('convergence')
        return;
    elseif (norm(x_k-x_k_prev)<eps3)
         disp('stagnation')
         break;
    else
        
        if (norm(c(x_k)) <= eta_k)
            lambda_k = lambda_k + mu_k*c_k(x_k);
            mu_k = mu_k;
            eps_k = eps_k/mu_k;
            eta_k = eta_k/(mu_k^beta);
        else
            lambda_k = lambda_k;
            mu_k = tau*mu_k;
            eps_k = eps_0/mu_k;
            eta_k = eta_0_chap/(mu_k^alpha);
        end
        
    end
    
    k = k + 1;
end

end

