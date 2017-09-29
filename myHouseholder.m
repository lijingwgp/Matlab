function [Q,R] = myHouseholder(A)

[m,n] = size(A);

R = A;

for k = 1:n
    
    x = R(k:m,k);
    
    v = x;
    
    v(1) = sign(v(1)) * norm(x) + v(1);
    
    v = v / norm(v);
    
    R(k:m,k:n) = R(k:m,k:n) - 2*v*(v'*R(k:m,k:n));
    
    Q = A * inv(R);
    
end

end