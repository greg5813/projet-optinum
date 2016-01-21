function [y] = grad_f2(x)
% gradient de f2

    y = zeros(2,1);
    y(1) = -400*x(1)*(x(2)-x(1)^2) - 2*(1-x(1));
    y(2) = 200*(x(2)-x(1)^2);
end

