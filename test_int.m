function [ h, approxT,approxS,errT,errS ] = test_int( f,a,b,exact_int )

h0 = (b-a); 

for k = 1:15
   h(k) = h0/2^(k);
   approxT(k) = compTrapezoid(f,a,b,h(k) );
   approxS(k) = compSimp(f,a,b,h(k) )
   errT(k)  = abs(approxT(k) - exact_int);
   errS(k) = abs(approxS(k) - exact_int);
    
end




figure(2)
loglog(h,errT,'*-',h,errS,'o-')
legend('Trapezoid', 'Simpson')
end

