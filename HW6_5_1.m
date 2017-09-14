function []= HW6_5_1()

close all
clear all

% initialize time variables
interv = [0,1];
% tp is for plotting the true solution
% tp = t0:0.01:t1;

% setup ics, h, number of step
y0 = 1;
% h = 0.05;
% ns = 3;

% define true slution
% ty = @(t, y) (exp((t.^2)/2).*(2+y0)-t.^2-2);
f = @(t,y) (t^3)/(y^2);

% call the solver
[t, w, h, count] = RK23(interv, y0, f);
count

% comparing the results for question2
[T, W] = ode23(f, interv, y0);
figure(1);
plot(t,w,'b-o')
figure(2);
plot(T,W,'b-+')




% put figure in convenient position on screen
% figure('Position', [600 400 560 420])
% plot the true solution and the approximate solution
% plot(tp, ty(tp), 'r-', 'LineWidth', 2);
% hold on;
% plot(t, w, 'b--', 'LineWidth', 2);
% xlim([t0-0.1 t1+0.1]);
% ylim([-10 3000]);
% title(['C6S5CP1f,  RK23,  y(0) = -1.99,  h = ', num2str(h)])
% hleg = legend('true', 'approx');
% set(hleg, 'Location','NorthWest');




function [t, w, h, count] = RK23(interv, y0, f)
    
h = (interv(2) - interv(1))/4;
t(1) = interv(1);
w(1,:) = y0;


count=0;
i=1;
while t < interv(2)
  [h, w] = RK23step(t(i),h, w(i,:), f);
  t(i+1) = t(i) + h;
  w(i+1,:) = w;
  i=i+1;
  count=count+1;
  H(count)=h;
end
max(H)


function [h, z] = RK23step(t, h, y, f)
tol = 10^(-8);

s1 = f(t, y);
s2 = f(t + h, y + h*s1);
s3 = f(t + h/2, y + h*((s1+s2)/2));
err = abs(h*(s1-2*s3+s2)/3);

while err > tol
    h = h/2;
    s1 = f(t, y);
    s2 = f(t + h, y + h*s1);
    s3 = f(t + h/2, y + h*((s1+s2)/2));
    err = abs(h*(s1-2*s3+s2)/3);
end

if err < tol/10
    h = 2*h;
end

z = y + h*(s1+4*s3+s2)/6;








