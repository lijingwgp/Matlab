function [x] = backsub[L,U,b]
% This function will compute the unknown vector x for us
% Since now L, and U are found.
% Input parameters - L lower triangular factor
%                    U Upper triangular factor
%                    b rhs vector
% Output parameters -x solution vector

[n,m] = size(L);            % The purpose of this part is to compute c
c(1) = b(1)/L(1);           % To compute the first c  

for i=2:n-1;                % For each row
    for j=1:i-1;            % For each column
        b(i) = b(i) - c(i)*L(i,i);     % To compute the numerator
    end
    
    c(i) = b(i)/c(i);                  % To determine each c
end


x = zeros(n,1);                        % To construct a vector n by 1
[n,m] = size(U)
x(n) = c(n)/U(n)                       % To compute the last row first

for i = n-1:-1:1;                      % From the second last row going back
    for j = n:-1:i;                    % From the last column going back
        c(i) = c(i)-x(i)U(i,j);
    end
    
    x(i) = c(i)/U(i,i);                % Compute x's
end
end