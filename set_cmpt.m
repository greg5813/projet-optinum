% initialise les compteurs d'appels à zéro

% nombre d'appels
% nombre iterations
% convergence vers un point en fonction:
%           - point départ
%           - variation des paramètres (abcd grec)
% comparer les differentes methodes selon les parametres

global n_c1;
n_c1 = 0;
global n_c2;
n_c2 = 0;
global n_der_phi1;
n_der_phi1 = 0;
global n_der_phi2;
n_der_phi2 = 0;
global n_der_phi_ms;
n_der_phi_ms = 0;
global n_f1;
n_f1 = 0;
global n_f2;
n_f2 = 0;
global n_grad_c1;
n_grad_c1 = 0;
global n_grad_c2;
n_grad_c2 = 0;
global n_grad_f1;
n_grad_f1 = 0;
global n_grad_f2;
n_grad_f2 = 0;
global n_grad_La;
n_grad_La = 0;
global n_hess_c1;
n_hess_c1 = 0;
global n_hess_c2;
n_hess_c2 = 0;
global n_hess_f1;
n_hess_f1 = 0;
global n_hess_f2;
n_hess_f2 = 0;
global n_hess_La;
n_hess_La = 0;
global n_jacob_c1;
n_jacob_c1 = 0;
global n_jacob_c2;
n_jacob_c2 = 0;
global n_La;
n_La = 0;
global n_phi1;
n_phi1 = 0;
global n_phi2;
n_phi2 = 0;
global n_phi_ms;
n_phi_ms = 0;



x = lagrangien_aug(@(x) f1(x),@(x) grad_f1(x),@(x) hess_f1(x),@(x) c1(x),@(x) grad_c1(x),@(x) hess_c1(x),@(x) jacob_c1(x),1.5,1.5,[0; 1; 1],1,10^-10,10^-10,10^-10,1000,1,2,0.5,1.5,0.25,0.75,10^-10,1000)    