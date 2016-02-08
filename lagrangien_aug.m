function [ x_k, lambda_k, mu_k ] = lagrangien_aug( f, g_f, H_f, c, g_c, H_c, J_c, mu_0, tau, x_0, lambda_0, eps1, eps2, eps3, maxiter, delta_0, delta_max, gamma_1, gamma_2, eta_1, eta_2, eps4, maxiter2 )
% LAGRANGIEN_AUG algorithme du lagrangien augmenté
% [ x_k, lambda_k, mu_k ] = lagrangien_aug( f, g_f, H_f, c, g_c, H_c, J_c, mu_0, tau, x_0, lambda_0, eps1, eps2, eps3, maxiter, delta_0, delta_max, gamma_1, gamma_2, eta_1, eta_2, eps4, maxiter2 )


% f fonction dont on cherche un minimum
% g_f gradient de la fonction
% H_f hessienne de la fonction
% c fonction des contraintes d'égalité
% g_c gradient de la fonction
% H_c hessienne de la fonction
% J_c jacobienne de la fonction
% mu_0 pénalité initiale
% tau facteur de modification de la pénalité
% x_0 point de départ, première estimation de la solution recherchée
% lambda_0 valeur initiale du multiplicateur
% eps1 précision de la solution pour la fonction
% eps2 précision de la solution pour les contraintes
% eps3 précision du cas de stagnation
% maxiter nombre maximal d'itérations
% delta_0 taille initiale de la région de confiance
% delta_max taille maximum de la région de confiance
% gamma_1 facteur de diminution de la taille de la région de confiance
% gamme_2 facteur d'augmentation de la taille de la région de confiance
% eta_1 seuil de diminution de la taille de la région de confiance
% eta_2 seuil d'augmentation de la taille de la région de confiance
% eps4 précision du cas de stagnation de la région de confiance
% maxiter2 nombre maximal d'itérations de la région de confiance

    % x = lagrangien_aug(@(x) f1(x),@(x) grad_f1(x),@(x) hess_f1(x),@(x) c1(x),@(x) grad_c1(x),@(x) hess_c1(x),@(x) jacob_c1(x),1.5,1.5,[0.5; 1.25; 1],1,10^-10,10^-10,10^-10,1000,1,2,0.5,1.5,0.25,0.75,10^-10,1000)
    % x = lagrangien_aug(@(x) f1(x),@(x) grad_f1(x),@(x) hess_f1(x),@(x) c1(x),@(x) grad_c1(x),@(x) hess_c1(x),@(x) jacob_c1(x),1.5,1.5,[0; 1; 1],1,10^-10,10^-10,10^-10,1000,1,2,0.5,1.5,0.25,0.75,10^-10,1000)
    
    % x = lagrangien_aug(@(x) f2(x),@(x) grad_f2(x),@(x) hess_f2(x),@(x) c2(x),@(x) grad_c2(x),@(x) hess_c2(x),@(x) jacob_c2(x),1.5,1.5,[1; 0],1,10^-10,10^-10,10^-10,1000,1,2,0.5,1.5,0.25,0.75,10^-10,1000)
    % x = lagrangien_aug(@(x) f2(x),@(x) grad_f2(x),@(x) hess_f2(x),@(x) c2(x),@(x) grad_c2(x),@(x) hess_c2(x),@(x) jacob_c2(x),1.5,1.5,[sqrt(3)/2; sqrt(3)/2],1,10^-10,10^-10,10^-10,1000,1,2,0.5,1.5,0.25,0.75,10^-10,1000)
    
    
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
norm_c_x_k = norm(c(x_k));

g_L = grad_La(x_k,lambda_k,0,g_f,c,g_c,J_c);

while ( (norm(g_L)>=eps1 || norm_c_x_k>=eps2) && k<=maxiter ) 
    k = k + 1;
    
    Laug = @(x) La(x,lambda_k,mu_k,f,c);
    g_Laug = @(x) grad_La(x,lambda_k,mu_k,g_f,c,g_c,J_c);
    H_Laug = @(x) hess_La(x,lambda_k,mu_k,H_f,c,H_c,J_c);
    
    x_k_prev = x_k;
    x_k = region_confiance(Laug,g_Laug,H_Laug,x_k,delta_0,delta_max,gamma_1,gamma_2,eta_1,eta_2,eps_k,eps4,maxiter2,1);
    norm_c_x_k = norm(c(x_k));
    g_L = grad_La(x_k,lambda_k,0,g_f,c,g_c,J_c);
    
    if (norm(g_L)<eps1 && norm_c_x_k<eps2)
        fprintf('[Lagrangien augmenté] convergence\n')
        break;
    elseif (norm(x_k-x_k_prev)<eps3)
        fprintf('[Lagrangien augmenté] stagnation\n')
        break;
    else
        
        if (norm_c_x_k <= eta_k)
            lambda_k = lambda_k + mu_k*c(x_k);
            eps_k = eps_k/mu_k;
            eta_k = eta_k/(mu_k^beta);
        else
            mu_k = tau*mu_k;
            eps_k = eps_0/mu_k;
            eta_k = eta_0_chap/(mu_k^alpha);
        end
        
    end
    
end

    fprintf('[Lagrangien augmenté] niter : %d\n', k)

end

