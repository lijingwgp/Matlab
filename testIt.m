function [  ] = testIt(  )
%Compare residuals for GS and SOR


% set up A
n = 100;
 e = ones(n,1);
 A= spdiags([-e 2*e -e], -1:1,n,n)
 A= full(A);
    
    
    
% set up b


b = ones(n,1);

%initial guess
x0 = zeros(n,1);

% set omega
omega = 1.7;

% now run each method

[ resJacobi ] = myJacobi( A,b ,x0);

[ resGS ] = myGS( A,b ,x0);


[ resSOR ] = mySOR( A,b ,x0, omega);



semilogy(1:1:length(resGS), resGS, '+-',1:1:length(resSOR), resSOR,'*-',1:1:length(resJacobi), resJacobi,'d-')
legend('GS','SOR','Jacobi')


end

