function [err, approx, h] = modcomsimp(f, a, b, exact)
% Composite 3/8 Simpson's Rule
% Input: f - function
%        a, b - ending points
%        exact - exact area under the curve
% Output: err - error term 
%         approx - approximation of the area under the curve
%         h - length of the panels

h = zeros(9,1);
err = zeros(9,1);
aprox = 0;

for i=1:9
    
    h(i) = (b-a)/3^i;
    m = round((b-a)/(3*h(i)));
    x = a:h(i):b;

    sum1 = 0;
    sum2 = 0;
    sum3 = 0;
    for k = 1:m
        sum1 = sum1 + f(x(3*k-1));
        sum2 = sum2 + f(x(3*k));
        sum3 = sum1 + sum2;
    end

    sum4 = 0;
    for j = 1:m-1
        sum4 = sum4 + f(x(3*j+1));
    end

    approx = (3*h(i)/8)*(f(a) + f(b) + 3*sum3 + 2*sum4);
    err(i) = abs(exact - approx);
end

loglog(h,err)

end


    