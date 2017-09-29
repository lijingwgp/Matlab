x=[65 64 64 63 62 62 62 62 60 59 57 58 58 60 65 68 70 72 73 74 75 76 75 72];
tplot=(0:24/1000:24-24/1000);

%interpolate
c1=dftinterp([0,24],x,24,1000);

%m=6
c2=dftfilter([0,24],x,6,24,1000);

%m=12
c3=dftfilter([0,24],x,12,24,1000);

plot(tplot, c1,tplot, c2,tplot, c3)

legend('interpolation','least square1','least square2');