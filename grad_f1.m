function [y] = grad_f1(x)
% gradient de f1
    global n_grad_f1;
    n_grad_f1 = n_grad_f1+1;

    y = zeros(3,1);
    y(1) = 4*(x(1)+x(2)+x(3)-3) + 2*(x(1)-x(2));
    y(2) = 4*(x(1)+x(2)+x(3)-3) - 2*(x(1)-x(2)) + 2*(x(2)-x(3));
    y(3) = 4*(x(1)+x(2)+x(3)-3) - 2*(x(2)-x(3));
end

