% Apply the Shooting Method to the BVP
% y'' = 2 e^{-2y}(1-t^2)
% y(0) = 0, y(1) = ln(2)
% 
% Find a bracketing interval [s0, s1] and plot the solution.

function []= Hw7_1_3b()

close all
clear all

% initialize time variables, h, and tolerance
ta = 0;
tb = 1;
h = 0.01;
tol = 10^(-10);

% initialize bcs
ya = 0;
yb = log(2);
disp(['y(tb) = ', num2str(yb)]);

% guess s0 and s1
s0 = 0.5;
s1 = -1.0;

% call the solver for s0 and s1
[~, w0] = RK4Vf([ta tb], [ya, s0], h, @ff);    % creating the bracket
[~, w1] = RK4Vf([ta tb], [ya, s1], h, @ff);    % only return position

% compute and display the error, check that they have different signs
e0 = yb - w0(1,end);
disp(['error1 = ', num2str(e0)]);
e1 = yb - w1(1,end);
disp(['error2 = ', num2str(e1)]);

error = min(abs(e0), abs(e1));     % want the error that below the yb

while abs(error) > tol
    s = (s0+s1)/2;      % compute new slope if the error is too large
    [t, w] = RK4Vf([ta tb], [ya, s]', h, @ff);
    error = yb - w(1,end);         % compute new error
    if error*e0 > 0                % check the new bracket
        s0 = s;                    % bring the upper bracket downward
%        e0 = error;
    else
        s1 = s;                    % using s as the new lower bracket
%        e1 = error;
    end
end
disp(['final s = ', num2str(s)]);

% put figure in convenient position on screen
figure('Position', [800 500 560 420])
% plot the approximate solution
plot(t, w(1,:), 'k-', 'LineWidth', 2);
xlim([ta-0.1 tb+0.1]);
ylim([-0.1 1]);
title(['C7S1CP3b,  Shooting Method,  h = ', num2str(h)]);
hleg = legend('approx');
set(hleg, 'Location','NorthWest');

% define the Right Hand Side (RHS)
function y = ff(t, u)
y = zeros(length(u), 1);
y(1) = u(2);
y(2) = 2*exp(-2*u(1))*(1-t^2);




% Vector RK4 Method for Solving Initial Value Problems
% Input:  interv - interval [a,b]
%         ics - initial conditions
%         h - step size
%         f - user defined function for rhs
% Output: t - time steps, w - solution
% Usage: y = RK4Vf([0 10], [pi/4, 0]', 0.1, @f);
% NOTE: 1) f is defined by a Matlab "function" for f(t, y)
%       2) f can be a scalar
%       3) if f is a vector, it must return a column vector

function [t, w] = RK4Vf(interv, ics, h, f)
% creating step size, time vector, and initial time
n = round((interv(2) - interv(1))/h);
t = zeros(n+1,1);
t(1) = interv(1);

% creating position vector and initial position
w = zeros(length(ics), n+1);
w(:,1) = ics;

% computing new position with new time
for i = 1:n
  t(i+1) = t(i) + h;
  w(:, i+1) = RK4stepVf(t(i), w(:, i), h, f);
end

% One step of RK4Vf
% Input: t - current time
%        y - current function values
%        h - stepsize
%        f - rhs
% Output: w - approximate solution w at time t + h

function [w] = RK4stepVf(t, y, h, f)
% compute s1, s2, s3, s4
h2 = h/2;
s1 = f(t, y);
s2 = f(t + h2, y + h2*s1);
s3 = f(t + h2, y + h2*s2);
s4 = f(t + h, y + h*s3);
% compute w_i+1
w = y + (h/6)*(s1 + 2*s2 + 2*s3 + s4);
