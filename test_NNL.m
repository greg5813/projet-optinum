warning('off','all')
clear;
%close all;
load_functions;

% tests Newton non linéaire
NNL1 = cell(2,3);
set_cmpt;
[x,niter] = newton_non_lineaire(phi1, d_phi1, -30, 0, 10^-15, 1000);
x
NNL1{1,1} = niter;
NNL1{1,2} = n_phi1;
NNL1{1,3} = n_der_phi1;
set_cmpt;
[x,niter] = newton_non_lineaire(phi1, d_phi1, 0, 10, 10^-15, 1000);
x
NNL1{2,1} = niter;
NNL1{2,2} = n_phi1;
NNL1{2,3} = n_der_phi1;
cnames = {'niter','appels phi1','appels dérivée phi1'};
fig3 = figure('Name','Tests Newton non linéaire phi1','NumberTitle','off','Position',[1 1 500 150]);
timetable3 = uitable('Data',NNL1,'ColumnName',cnames);
timetable3.Position(3) = timetable3.Extent(3);
timetable3.Position(4) = timetable3.Extent(4);

NNL2 = cell(4,3);
set_cmpt;
[x,niter] = newton_non_lineaire(phi2, d_phi2, 0, 10, 10^-15, 1000);
x
NNL2{1,1} = niter;
NNL2{1,2} = n_phi2;
NNL2{1,3} = n_der_phi2;
set_cmpt;
[x,niter] = newton_non_lineaire(phi2, d_phi2, 10, 40, 10^-15, 1000);
x
NNL2{2,1} = niter;
NNL2{2,2} = n_phi2;
NNL2{2,3} = n_der_phi2;
set_cmpt;
[x,niter] = newton_non_lineaire(phi2, d_phi2, -50, -10, 10^-15, 1000);
x
NNL2{3,1} = niter;
NNL2{3,2} = n_phi2;
NNL2{3,3} = n_der_phi2;
set_cmpt;
[x,niter] = newton_non_lineaire(phi2, d_phi2, 35, 50, 10^-15, 1000);
x
NNL2{4,1} = niter;
NNL2{4,2} = n_phi2;
NNL2{4,3} = n_der_phi2;
cnames = {'niter','appels phi2','appels dérivée phi2'};
fig4 = figure('Name','Tests Newton non linéaire phi2','NumberTitle','off','Position',[1 1 500 150]);
timetable4 = uitable('Data',NNL2,'ColumnName',cnames);
timetable4.Position(3) = timetable4.Extent(3);
timetable4.Position(4) = timetable4.Extent(4);
