k = -2*pi:0.01:2*pi;             % define the interval 

y1 = sin(k);                     % define functions
y2 = sin1(k);

siner = y1 - y2;                 % calculating the errors

plot (k, siner)                  % plot the error