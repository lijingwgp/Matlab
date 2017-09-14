% Trapezoid Method for Solving Initial Value Problems

% NOTE: 1) f is a user defined function for y' = f(t, y)
%       2) f can be a scalar
%       3) if f is a vector, it must return a row vector

% Input:  interv - interval [a,b], ics - initial conditions,
%         n - number of steps, f - user defined function for rhs
% Output: t - time steps, w - solution

% Usage: y = trapVf([0 10], [pi/4, 0], 0.1, @f);

function [t, w] = trapVf(interv, ics, h, f)
n = round((interv(2) - interv(1))/h);
t = zeros(n+1,1);
t(1) = interv(1);

w = zeros(n+1, length(ics));
w(1,:) = ics;

for i = 1:n
  t(i+1) = t(i) + h;
  w(i+1,:) = trapstepVf(t(i), w(i,:), h, f);
end


% One step of Vector Trapezoid Method
% Input: t - current time, y - current function values,
%        h - stepsize, f - rhs
% Output: w - approximate solution at time t + h
function [w] = trapstepVf(t, y, h, f)
fty = f(t, y);
fthy = f(t+h, y + h*fty);
w = y + (h/2)*(fty + fthy);



