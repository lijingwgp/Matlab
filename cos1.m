% Program 3.3 Building a sin calculator key, attempt #2
% Approximates cos curve with degree 9 polynomial
%     (Caution: do not use to build bridges,
%     at least until we have discussed accuracy.)
% Input:  x
% Output: approximation for cos(x)
function y=cos1(x)
% First calculate the interpolating polynomial and 
%   store coefficients
n = 10;
b=(pi/4)*cos((1:2:2*n-1)*pi/(2*n))+(pi/4);yb=cos(b);    % b holds base points
c=newtdd(b,yb,4);
%For each input x, move x to the fundamental domain and evaluate
%      the interpolating polynomial
s=1;                       % Correct the sign of cos
x1=mod(x,2*pi);
if x1>pi/2
  x1 = 2*pi/2-x1;
  s = -1;
end
if x1 > pi
  x1 = 3pi/2-x1;
end
y = s*nest(n-1,c,x1,b);