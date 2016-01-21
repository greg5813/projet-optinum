function [ x_k, lambda_k, mu_k ] = lagrangien_aug( f, g_f, H_f, c, g_c, H_c, J_c, mu_0, tau, x_0, lambda_0, eps1, eps2, eps3, maxiter, delta_0, delta_max, gamma_1, gamma_2, eta_1, eta_2, eps4, maxiter2 )
% algorithme 

    % lagrangien_aug(@(x) f1(x),@(x) grad_f1(x),@(x) hess_f1(x),@(x) c1(x),@(x) grad_c1(x),@(x) hess_c1(x),@(x) jacob_c1(x),1.5,1.5,[0.5; 1.25; 1],1,10^-10,10^-10,10^-10,1000,1,2,0.5,1.5,0.25,0.75,10^-10,1000)
    % lagrangien_aug(@(x) f2(x),@(x) grad_f2(x),@(x) hess_f2(x),@(x) c2(x),@(x) grad_c2(x),@(x) hess_c2(x),@(x) jacob_c2(x),1.5,1.5,[1; 0],1,10^-10,10^-10,10^-10,1000,1,2,0.5,1.5,0.25,0.75,10^-10,1000)
    
eta_0_chap = 0.1258925;
alpha = 0.1;
beta = 0.9;
eps_0 = 1/mu_0;
eta_0 = eta_0_chap/mu_0^alpha;
x_k = x_0;
mu_k = mu_0;
eps_k = eps_0;
lambda_k = lambda_0;
eta_k = eta_0;
k = 0;

g_L = g_La(x_k,lambda_k,0,g_f,c,g_c,J_c);

while ( (norm(g_L)>=eps1 || norm(c(x_k))>=eps2) && k<maxiter ) 
    
    Laug = @(x) La(x,lambda_k,mu_k,f,c);
    g_Laug = @(x) g_La(x,lambda_k,mu_k,g_f,c,g_c,J_c);
    H_Laug = @(x) H_La(x,lambda_k,mu_k,H_f,c,H_c,J_c);
    
    x_k_prev = x_k;
    x_k = region_confiance(Laug,g_Laug,H_Laug,x_k,delta_0,delta_max,gamma_1,gamma_2,eta_1,eta_2,eps_k,eps4,maxiter2);
    g_L = g_La(x_k,lambda_k,0,g_f,c,g_c,J_c);
    
    if (norm(g_L)<eps1 && norm(c(x_k))<eps2)
        disp('[Lagrangien augmenté] convergence')
        return;
    elseif (norm(x_k-x_k_prev)<eps3)
        disp('[Lagrangien augmenté] stagnation')
        return;
    else
        
        if (norm(c(x_k)) <= eta_k)
            lambda_k = lambda_k + mu_k*c(x_k);
            eps_k = eps_k/mu_k;
            eta_k = eta_k/(mu_k^beta);
        else
            mu_k = tau*mu_k;
            eps_k = eps_0/mu_k;
            eta_k = eta_0_chap/(mu_k^alpha);
        end
        
    end
    
    k = k + 1;
    disp(k)
end



end

