% Program 12.5 Unshifted QR Algorithm
% Computes eigenvalues/vectors of symmetric matrix
% Input: matrix A, number of steps k
% Output: eigenvalues lam and eigenvector matrix Qbar
function [lam,Qbar]=unshiftedqr(A,k)
% initialize matrices
[m,n]=size(A);
Q=eye(m,m);
Qbar=Q; R=A;

% compute actual eigenvalues for the matrix A according theorem 8.1
for j=1:3
    lamture(j)=1-2*cos(pi*j)/(m+1);
end

for j = 1:k
  [Q,R] = qr(R*Q);          % QR factorization
  Qbar=Qbar*Q;              % accumulate Q's    
end

% compute the errors
 for i=1:3
    error(i)=abs(lamture(j)-lam(i));
 end
 
lam=diag(R*Q);              % diagonal converges to eigenvalues
x=1:k;

semilogy(x,error(1),x,error(2),x,error(3))
    
end



