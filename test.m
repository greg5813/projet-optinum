warning('off','all')
clear;
load_functions;

set_cmpt;
x0 = [1;0;0];
x = newton_local(g_f1, H_f1, x0, 10^-15, 10^-15, 20000)
set_cmpt;
x0 = [10;3;-2.2];
x = newton_local(g_f1, H_f1, x0, 10^-15, 10^-15, 20000)

set_cmpt;
x0 = [-1.2;1];
x = newton_local(g_f2, H_f2, x0, 10^-15, 10^-15, 20000)
set_cmpt;
x0 = [10;0];
x = newton_local(g_f2, H_f2, x0, 10^-15, 10^-15, 20000)
set_cmpt;
x0 = [0;1/200+1/(10^12)];
x = newton_local(g_f2, H_f2, x0, 10^-15, 10^-15, 20000)

x = lagrangien_aug(f1,g_f1,H_f1,c1,g_c1,H_c1,J_c1,1.5,1.5,[0; 1; 1],1,10^-10,10^-10,10^-10,1000,1,2,0.5,1.5,0.25,0.75,10^-10,1000)    
