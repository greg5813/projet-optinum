warning('off','all')
clear;
%close all;
load_functions;

% tests région de confiance
RC1 = cell(2,3);
set_cmpt;
x0 = [1;0;0];
[x,niter] = region_confiance(f1, g_f1, H_f1, x0, 1, 2, 0.5, 1.5, 0.25, 0.75, 10^-15, 10^-15, 1000,0);
x
RC1{1,1} = niter;
RC1{1,2} = n_grad_f1;
RC1{1,3} = n_hess_f1;
set_cmpt;
x0 = [10;3;-2.2];
[x,niter] = region_confiance(f1, g_f1, H_f1, x0, 1, 2, 0.5, 1.5, 0.25, 0.75, 10^-15, 10^-15, 1000,0);
x
RC1{2,1} = niter;
RC1{2,2} = n_grad_f1;
RC1{2,3} = n_hess_f1;
cnames = {'niter','appels gradient f','appels hessienne f'};
rnames = {'f1(x011)','f1(x012)'};
fig1 = figure('Name','Tests région de confiance f1 pas de Cauchy','NumberTitle','off','Position',[1 1 500 150]);
timetable1 = uitable('Data',RC1,'ColumnName',cnames,'RowName',rnames);
timetable1.Position(3) = timetable1.Extent(3);
timetable1.Position(4) = timetable1.Extent(4);

RC1 = cell(2,3);
set_cmpt;
x0 = [1;0;0];
[x,niter] = region_confiance(f1, g_f1, H_f1, x0, 1, 2, 0.5, 1.5, 0.25, 0.75, 10^-15, 10^-15, 1000,1);
x
RC1{1,1} = niter;
RC1{1,2} = n_grad_f1;
RC1{1,3} = n_hess_f1;
set_cmpt;
x0 = [10;3;-2.2];
[x,niter] = region_confiance(f1, g_f1, H_f1, x0, 1, 2, 0.5, 1.5, 0.25, 0.75, 10^-15, 10^-15, 1000,1);
x
RC1{2,1} = niter;
RC1{2,2} = n_grad_f1;
RC1{2,3} = n_hess_f1;
cnames = {'niter','appels gradient f','appels hessienne f'};
rnames = {'f1(x011)','f1(x012)'};
fig1 = figure('Name','Tests région de confiance f1 More-Sorensen','NumberTitle','off','Position',[1 1 500 150]);
timetable1 = uitable('Data',RC1,'ColumnName',cnames,'RowName',rnames);
timetable1.Position(3) = timetable1.Extent(3);
timetable1.Position(4) = timetable1.Extent(4);

RC2 = cell(3,3);
set_cmpt;
x0 = [-1.2;1];
[x,niter] = region_confiance(f2, g_f2, H_f2, x0, 1, 2, 0.5, 1.5, 0.25, 0.75, 10^-15, 10^-15, 1000,0);
x
RC2{1,1} = niter;
RC2{1,2} = n_grad_f2;
RC2{1,3} = n_hess_f2;
set_cmpt;
x0 = [10;0];
[x,niter] = region_confiance(f2, g_f2, H_f2, x0, 1, 2, 0.5, 1.5, 0.25, 0.75, 10^-15, 10^-15, 1000,0);
x
RC2{2,1} = niter;
RC2{2,2} = n_grad_f2;
RC2{2,3} = n_hess_f2;
set_cmpt;
x0 = [0;1/200+1/(10^12)];
[x,niter] = region_confiance(f2, g_f2, H_f2, x0, 1, 2, 0.5, 1.5, 0.25, 0.75, 10^-15, 10^-15, 1000,0);
x
RC2{3,1} = niter;
RC2{3,2} = n_grad_f2;
RC2{3,3} = n_hess_f2;
cnames = {'niter','appels gradient f','appels hessienne f'};
rnames = {'f2(x021)','f2(x022)','f2(x023)'};
fig2 = figure('Name','Tests région de confiance f2 pas de Cauchy','NumberTitle','off','Position',[1 1 500 150]);
timetable2 = uitable('Data',RC2,'ColumnName',cnames,'RowName',rnames);
timetable2.Position(3) = timetable2.Extent(3);
timetable2.Position(4) = timetable2.Extent(4);

RC2 = cell(3,3);
set_cmpt;
x0 = [-1.2;1];
[x,niter] = region_confiance(f2, g_f2, H_f2, x0, 1, 2, 0.5, 1.5, 0.25, 0.75, 10^-15, 10^-15, 1000,1);
x
RC2{1,1} = niter;
RC2{1,2} = n_grad_f2;
RC2{1,3} = n_hess_f2;
set_cmpt;
x0 = [10;0];
[x,niter] = region_confiance(f2, g_f2, H_f2, x0, 1, 2, 0.5, 1.5, 0.25, 0.75, 10^-15, 10^-15, 1000,1);
x
RC2{2,1} = niter;
RC2{2,2} = n_grad_f2;
RC2{2,3} = n_hess_f2;
set_cmpt;
x0 = [0;1/200+1/(10^12)];
[x,niter] = region_confiance(f2, g_f2, H_f2, x0, 1, 2, 0.5, 1.5, 0.25, 0.75, 10^-15, 10^-15, 1000,1);
x
RC2{3,1} = niter;
RC2{3,2} = n_grad_f2;
RC2{3,3} = n_hess_f2;
cnames = {'niter','appels gradient f','appels hessienne f'};
rnames = {'f2(x021)','f2(x022)','f2(x023)'};
fig2 = figure('Name','Tests région de confiance f2 More-Sorensen','NumberTitle','off','Position',[1 1 500 150]);
timetable2 = uitable('Data',RC2,'ColumnName',cnames,'RowName',rnames);
timetable2.Position(3) = timetable2.Extent(3);
timetable2.Position(4) = timetable2.Extent(4);

RC2 = cell(9,9);
x0 = [0;1/200+1/(10^12)];
for (i=1:9)
    for (j=1:9)
        [x,niter] = region_confiance(f2, g_f2, H_f2, x0, 1, 2, 0.1*i, 0.1*j+1, 0.25, 0.75, 10^-15, 10^-15, 1000,1);
        RC2{i,j} = niter;
    end
end
cnames = {'0.1','0.2','0.3','0.4','0.5','0.6','0.7','0.8','0.9'};
rnames = {'1.1','1.2','1.3','1.4','1.5','1.6','1.7','1.8','1.9'};
fig2 = figure('Name','Tests région de confiance MS influence gamma1 et gamma2 f2(x023)','NumberTitle','off','Position',[1 1 500 150]);
timetable2 = uitable('Data',RC2,'ColumnName',cnames,'RowName',rnames);
timetable2.Position(3) = timetable2.Extent(3);
timetable2.Position(4) = timetable2.Extent(4);

RC2 = cell(9,9);
x0 = [10;3;-2.2];
for (i=1:9)
    for (j=1:9)   
        [x,niter] = region_confiance(f1, g_f1, H_f1, x0, 1, 2, 0.1*i, 0.1*j+1, 0.25, 0.75, 10^-15, 10^-15, 1000,0);
        RC2{i,j} = niter;
    end
end
cnames = {'0.1','0.2','0.3','0.4','0.5','0.6','0.7','0.8','0.9'};
rnames = {'1.1','1.2','1.3','1.4','1.5','1.6','1.7','1.8','1.9'};
fig2 = figure('Name','Tests région de confiance Cauchy influence gamma1 et gamma2 f1(x012)','NumberTitle','off','Position',[1 1 500 150]);
timetable2 = uitable('Data',RC2,'ColumnName',cnames,'RowName',rnames);
timetable2.Position(3) = timetable2.Extent(3);
timetable2.Position(4) = timetable2.Extent(4);
