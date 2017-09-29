function [ res] = myGS( A,b ,x0)
%Solve Ax= b using Gauss-Seidel method
% assume A os square
[m,n] = size(A);
x = x0;

xtrue = A\b;
maxit = 1000;




for k = 1:maxit
    for i = 1:n
        s1 = 0;
        for j = 1:i-1
            s1 = s1 + A(i,j)*xnew(j);
        end
        s2 = 0;
        for j = i+1:n
            s2 =  s2 + A(i,j)*x(j);
        end
        
        xnew(i,1) = (b(i)-s1-s2)/A(i,i);
        %pause
    end %end for i
    
    x = xnew;
    
    %compute the residual at each step
    res(k) = norm(b-A*x);
    if ( res(k) <1e-15)
        break;
    end
    
    
end %end for k




end% end function

