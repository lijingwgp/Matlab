function [x, num] = svd_lsq(A, b1)
% Using SVD and apply to a least square problem
%
% Input: A - coefficient matrix
%        b - function values
%        
% Output: x - solution matrix
%         num - condition number of the coefficient matrix

[m, n] = size(A);
[U, S, V] = svd(A, 0);

y = zeros(n, 1);
bhat = U'*b1;

for i = 1:n
    y(i) = bhat(i) / S(i,i);
end
x = V*y;
num = cond(S*V');
end
 