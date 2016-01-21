function [y] = hess_f2(x)
% hessienne de f2

    y = [-400*(x(2)-x(1)^2) + 800*x(1)^2 + 2 , -400*x(1); -400*x(1), 200];
end

