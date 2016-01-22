% load the functions

f1 = @(x) f1(x);
g_f1 = @(x) grad_f1(x);
H_f1 = @(x) hess_f1(x);

f2 = @(x) f2(x);
g_f2 = @(x) grad_f2(x);
H_f2 = @(x) hess_f2(x);

c1 = @(x) c1(x);
g_c1 = @(x) grad_c1(x);
H_c1 = @(x) hess_c1(x);
J_c1 = @(x) jacob_c1(x);

c2 = @(x) c2(x);
g_c2 = @(x) grad_c2(x);
H_c2 = @(x) hess_c2(x);
J_c2 = @(x) jacob_c2(x);

phi1 = @(x) phi1(x);
d_phi1 = @(x) der_phi1(x);

phi2 = @(x) phi2(x);
d_phi2 = @(x) der_phi2(x);