function [ int_approx ] = compSimp(f,a,b,h )
%f is the integrand function
% a,b are endpoints of the interval
%m is the number of panels

%define h,x
h
m = (b-a)/(2*h)
x = a:h:b

sum1 = 0;
for k = 2:2:2*m
    sum1 = sum1 + f(x(k))
end% end for k
 

sum2 = 0;
for i = 3:2:2*m-1
    sum2 = sum2 + f(x(i))
end


int_approx = (h/3)*(f(x(1)) + f(x(2*m+1)) + 2*sum2 + 4*sum1);


end
