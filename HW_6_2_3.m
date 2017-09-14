% 6.2 Computer Problem 5a
% for the IVP y' = 1 + y^2, y(0) = 0 
% solution y = tan(t)
close

% initial and final time
t0 = 0.0;
t1 = 1.0;
tp = t0:0.01:t1;

% initial condition
y0 = 0;

% initialize error vector
% err = zeros(1,6);

% initialize h vector
% n = 5;
% k = 0:n;
% h = 0.1*2.^(-k);
h = 0.1;

% ty is the true solution
ty = @(t) tan(t);

% f is the RHS function
f = @(t, y) (1+y^2);
% ft = @(t, y) (1/y^2);
% fy = @(t, y) (-2*y^-1);

% iterate over the values of h
% for k = 0:n,
    % use Trapezoid's method to compute an approximate solution
    % [t, w] = trapVf([t0 t1], y0, h(k+1), f);
    % err(k+1) = abs(ty(t1) - w(length(w)));
% end
[t, w] = trapVf([t0 t1], y0, h, f);
% create loglog plot of error vs h
scrsz = get(0, 'ScreenSize');
% put figure in convenient position on screen
figure('Position', [scrsz(3)/5 20 560 420])

% loglog(h, err,'b--o')
% title('(C6S1CP4b) Error vs h')
% xlabel('h')
% ylabel(['error at  t)
plot(t, w, 'b-', tp, ty(tp), 'g--')
