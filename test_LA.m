warning('off','all')
clear;
%close all;
load_functions;

% tests langrangien augmenté
NLA1 = cell(2,10);
set_cmpt;
x0 = [0;1;1];
[x,l,m,niter] = lagrangien_aug(f1,g_f1,H_f1,c1,g_c1,H_c1,J_c1,1.5,1.5,x0,1,10^-15,10^-15,10^-15,1000,1,2,0.5,1.5,0.25,0.75,10^-15,1000)    
NLA1{1,1} = l;
NLA1{1,2} = m;
NLA1{1,3} = niter;
NLA1{1,4} = n_f1;
NLA1{1,5} = n_grad_f1;
NLA1{1,6} = n_hess_f1;
NLA1{1,7} = n_c1;
NLA1{1,8} = n_grad_c1;
NLA1{1,9} = n_hess_c1;
NLA1{1,10} = n_jacob_c1;
set_cmpt;
x0 = [0.5;1.25;1];
[x,l,m,niter] = lagrangien_aug(f1,g_f1,H_f1,c1,g_c1,H_c1,J_c1,1.5,1.5,x0,1,10^-15,10^-15,10^-15,1000,1,2,0.5,1.5,0.25,0.75,10^-15,1000)    
NLA1{2,1} = l;
NLA1{2,2} = m;
NLA1{2,3} = niter;
NLA1{2,4} = n_f1;
NLA1{2,5} = n_grad_f1;
NLA1{2,6} = n_hess_f1;
NLA1{2,7} = n_c1;
NLA1{2,8} = n_grad_c1;
NLA1{2,9} = n_hess_c1;
NLA1{2,10} = n_jacob_c1;
rnames = {'f1(xc11)','f1(xc12)'};
cnames = {'lambda','mu','niter','appels f1','appels gradient f1','appels hessienne f1','appels c1','appels gradient c1','appels hessienne c1','appels jacobienne c1'};
fig5 = figure('Name','Tests Lagrangien augmenté f1','NumberTitle','off','Position',[1 1 500 150]);
timetable5 = uitable('Data',NLA1,'ColumnName',cnames,'RowName',rnames);
timetable5.Position(3) = timetable5.Extent(3);
timetable5.Position(4) = timetable5.Extent(4);

NLA2 = cell(2,10);
set_cmpt;
x0 = [1;0];
[x,l,m,niter] = lagrangien_aug(f2,g_f2,H_f2,c2,g_c2,H_c2,J_c2,1.5,1.5,x0,1,10^-15,10^-15,10^-15,1000,1,2,0.5,1.5,0.25,0.75,10^-15,1000)    
NLA2{1,1} = l;
NLA2{1,2} = m;
NLA2{1,3} = niter;
NLA2{1,4} = n_f2;
NLA2{1,5} = n_grad_f2;
NLA2{1,6} = n_hess_f2;
NLA2{1,7} = n_c2;
NLA2{1,8} = n_grad_c2;
NLA2{1,9} = n_hess_c2;
NLA2{1,10} = n_jacob_c2;
set_cmpt;
x0 = [sqrt(3)/2;sqrt(3)/2];
[x,l,m,niter] = lagrangien_aug(f2,g_f2,H_f2,c2,g_c2,H_c2,J_c2,1.5,1.5,x0,1,10^-15,10^-15,10^-15,1000,1,2,0.5,1.5,0.25,0.75,10^-15,1000)    
NLA2{2,1} = l;
NLA2{2,2} = m;
NLA2{2,3} = niter;
NLA2{2,4} = n_f2;
NLA2{2,5} = n_grad_f2;
NLA2{2,6} = n_hess_f2;
NLA2{2,7} = n_c2;
NLA2{2,8} = n_grad_c2;
NLA2{2,9} = n_hess_c2;
NLA2{2,10} = n_jacob_c2;
rnames = {'f2(xc21)','f2(xc22)'};
cnames = {'lambda','mu','niter','appels f2','appels gradient f2','appels hessienne f2','appels c2','appels gradient c2','appels hessienne c2','appels jacobienne c2'};
fig6 = figure('Name','Tests Lagrangien augmenté f2','NumberTitle','off','Position',[1 1 500 150]);
timetable6 = uitable('Data',NLA2,'ColumnName',cnames,'RowName',rnames);
timetable6.Position(3) = timetable6.Extent(3);
timetable6.Position(4) = timetable6.Extent(4);

NLA3 = cell(10,1);
x0 = [0;1;1];
for (i=1:15)
    [x,l,m,niter] = lagrangien_aug(f1,g_f1,H_f1,c1,g_c1,H_c1,J_c1,1.5,i,x0,1,10^-15,10^-15,10^-15,1000,1,2,0.5,1.5,0.25,0.75,10^-15,1000);    
    NLA3{i,1} = niter;
end
cnames = {'niter'};
fig6 = figure('Name','Tests Lagrangien augmenté influence de tau f1(x011)','NumberTitle','off','Position',[1 1 500 150]);
timetable6 = uitable('Data',NLA3,'ColumnName',cnames);
timetable6.Position(3) = timetable6.Extent(3);
timetable6.Position(4) = timetable6.Extent(4);

NLA3 = cell(10,1);
x0 = [sqrt(3)/2;sqrt(3)/2];
for (i=1:15)
    [x,l,m,niter] = lagrangien_aug(f2,g_f2,H_f2,c2,g_c2,H_c2,J_c2,1.5,i,x0,1,10^-15,10^-15,10^-15,1000,1,2,0.5,1.5,0.25,0.75,10^-15,1000)    
    NLA3{i,1} = niter;
end
cnames = {'niter'};
fig6 = figure('Name','Tests Lagrangien augmenté influence de tau f2(x022)','NumberTitle','off','Position',[1 1 500 150]);
timetable6 = uitable('Data',NLA3,'ColumnName',cnames);
timetable6.Position(3) = timetable6.Extent(3);
timetable6.Position(4) = timetable6.Extent(4);