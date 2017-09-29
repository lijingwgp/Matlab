function [L,U] = myLU(A)        
% To create the function, myLU, to compute L and U 
% Input parameters - A an n by n matrix
% Output parameters- L lower triangular factor
%                    U upper triangular factor

[n,m] = size(A);                % To identify the size of matrix A
L = eye(n,m);                   % To create an identity matrix with n by m

for j = 1:n-1                   % A for loop to count all the columns
    
    if abs(A(j,j)) < eps        % To check the error
        error('Encounters a Zero Pivot'); 
    end
    
    for i = j+1:n               % Another for loop to count all the rows
        mult = A(i,j)/A(j,j);   % To create a multiplier
        A(i,j)= 0;              % Allow thoes positions to be 0
        L(i,j) = mult;          % To record multiplier into the identity
        
        for k = j+1:n           % To go through the rest of the positions
            A(i,k) = A(i,k)-mult*A(j,k)
        end
    end
end
U = A                           % Catch A
end

                                
        