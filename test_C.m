warning('off','all')
clear;
%close all;
load_functions;

% tests pas de Cauchy
set_cmpt;
q1;
s = pas_cauchy(g,H,1)
set_cmpt;
q2;
s = pas_cauchy(g,H,1)
set_cmpt;
q3;
s = pas_cauchy(g,H,1)