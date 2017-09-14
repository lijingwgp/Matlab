function [ int_approx ] = compTrapezoid(f,a,b,h )
%f is the integrand function
% a,b are endpoints of the interval
%m is the number of panels

%define h,x

m = (b-a)/h;
x = a:h:b;

sum = 0;
for k = 2:m
    sum = sum + f(x(k))
end% end for k


int_approx = (h/2)*(f(x(1)) + f(x(m+1)) + 2*sum);


end

