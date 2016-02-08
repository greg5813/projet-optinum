warning('off','all')
clear;
%close all;
load_functions;

% tests Newton local
NL1 = cell(2,3);
set_cmpt;
x0 = [1;0;0];
[x,niter] = newton_local(g_f1, H_f1, x0, 10^-15, 10^-15, 1000);
x
NL1{1,1} = niter;
NL1{1,2} = n_grad_f1;
NL1{1,3} = n_hess_f1;
set_cmpt;
x0 = [10;3;-2.2];
[x,niter] = newton_local(g_f1, H_f1, x0, 10^-15, 10^-15, 1000);
x
NL1{2,1} = niter;
NL1{2,2} = n_grad_f1;
NL1{2,3} = n_hess_f1;
cnames = {'niter','appels gradient f1','appels hessienne f1'};
rnames = {'f1(x011)','f1(x012)'};
fig1 = figure('Name','Tests Newton local f1','NumberTitle','off','Position',[1 1 500 150]);
timetable1 = uitable('Data',NL1,'ColumnName',cnames,'RowName',rnames);
timetable1.Position(3) = timetable1.Extent(3);
timetable1.Position(4) = timetable1.Extent(4);

NL2 = cell(3,3);
set_cmpt;
x0 = [-1.2;1];
[x,niter] = newton_local(g_f2, H_f2, x0, 10^-15, 10^-15, 1000);
x
NL2{1,1} = niter;
NL2{1,2} = n_grad_f2;
NL2{1,3} = n_hess_f2;
set_cmpt;
x0 = [10;0];
[x,niter] = newton_local(g_f2, H_f2, x0, 10^-15, 10^-15, 1000);
x
NL2{2,1} = niter;
NL2{2,2} = n_grad_f2;
NL2{2,3} = n_hess_f2;
set_cmpt;
x0 = [0;1/200+1/(10^12)];
[x,niter] = newton_local(g_f2, H_f2, x0, 10^-15, 10^-15, 1000);
x
NL2{3,1} = niter;
NL2{3,2} = n_grad_f2;
NL2{3,3} = n_hess_f2;
cnames = {'niter','appels gradient f2','appels hessienne f2'};
rnames = {'f2(x021)','f2(x022)','f2(x023)'};
fig2 = figure('Name','Tests Newton local f2','NumberTitle','off','Position',[1 1 500 150]);
timetable2 = uitable('Data',NL2,'ColumnName',cnames,'RowName',rnames);
timetable2.Position(3) = timetable2.Extent(3);
timetable2.Position(4) = timetable2.Extent(4);
