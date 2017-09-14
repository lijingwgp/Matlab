% Chapter 6 Section 5 Computer Problem 2 f)
%
% Compare the results of Computer Problem 1 with Matlabs's ode23
%
% Use this IVP
%   y' = t^3/y^2, y(0) = 1 on [0 1]
%

function []= Hw6_5_2f()

close all
clear all

% initialize time interval
t0 = 0;
t1 = 1;
pt = t0:0.01:t1;

% initial condition
y0 = 1;

% ty is the true solution
ty = @(t) (((3/4)*t.^4 + 1).^(1/3));

% call the solver
[ot1, w1] = RK23Vf([t0 t1], y0, @ff);

%fprintf('%20.15f\n', size(ot,2));
fprintf('number of time steps = %6.2f\n', (size(ot1,2)-1));
fprintf('maximum step size = %8.6f\n', max(diff(ot1)));
fprintf('minimum step size = %10.8f\n', min(diff(ot1)));

% call the application
[ot2, w2] = ode23(@ff, [t0 t1], y0);
disp(ot2);
disp(w2);

% fprintf('number of time steps = %6.2f\n', (size(ot2,2)-1));
% fprintf('maximum step size = %8.6f\n', max(diff(ot2)));
% fprintf('minimum step size = %10.8f\n', min(diff(ot2)));

% put figure in convenient position on screen
figure('Position', [1200 500 560 420])
plot(pt, ty(pt), 'r-', ot1, w1, 'b--', ot2, w2, 'ko');
title('C6S5CP2f   RK23 - ode23 comparison')
xlabel('t')
ylabel('y(t)')
xlim([t0 t1]);
ylim([0.9 1.3]);
hleg = legend('true', 'RK23', 'ode23');
set(hleg, 'Location','NorthWest')

% right hand side function
function [w] = ff(t, y)
w = (t^3)/(y^2);

