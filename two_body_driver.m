% Two-Body Problem

% Initialize:
%   t0 - start time
%   t1 - stop time
%   h - time step
%   p - steps per point plotted
%   n - number of points to plot
%   y(1,:) = [x1 vx1 y1 vy1 x2 vx2 y2 vy2] - initial conditions
%    ["x-pos of m1" "x-vel of m1" "y-pos of m1" "y-vel of m1"
%     "x-pos of m2" "x-vel of m2" "y-pos of m2" "y-vel of m2"]

function []= two_body_driver()

% ### INITIALIZE ###
t0 = 0;
t1 = 40;

h = 0.001;

p = 4;

n = round((t1 - t0)/(p*h));

y(1,:) = [2 0.2 2 -0.2 0 -0.01 0 0.01];
% y(1,:) = [0 3.8 2.4 0 0 0 0 -0.1];

% time vector and initial time
t = t0:h:t1;
t(1) = t0;

% mass1 and mass2
% m1 = 0.3;
% m2 = 0.3;
m1 = 0.3;
m2 = 0.03;
g = 1;
mg1 = m1*g;
mg2 = m2*g;


% plot/animation control
set(gca,'XLim',[-10 20],'YLim',[-20 10],'Drawmode','fast','Visible','on','NextPlot','add');
cla;
% draw blue dot for mass1 and red dot for mass2
mass1 = line('color','b','Marker','.','markersize',25,...
  'xdata',y(1,1),'ydata',y(1,3));
mass2 = line('color','r','Marker','.','markersize',25,...
  'xdata',y(1,5),'ydata',y(1,7));
drawnow;

% set up for plotting the path of mass1
head1=line('color','b','Marker','.','markersize',25,...
  'erase','xor','xdata',[],'ydata',[]);
tail1=line('color','r','LineStyle','--','erase','none',...
  'xdata',[],'ydata',[]);

% set up for plotting the path of mass2
head2=line('color','r','Marker','.','markersize',25,...
  'erase','xor','xdata',[],'ydata',[]);
tail2=line('color','b','LineStyle','--','erase','none',...
  'xdata',[],'ydata',[]);

for k=1:n
% use eulerstepVf to compute the steps along the paths of
% mass1 and mass2 - compute p steps
  for i=1:p
    y(i+1,:) = eulerstepVf(t(i), y(i,:), h, @f);
  end
  % reinitialize y(1,:) - for computing the next p steps
  y(1,:)=y(p+1,:);t(1)=t(p+1);
  % plot the next step in the paths of mass1 and mass2
  set(head1,'xdata',y(1,1),'ydata',y(1,3))
  set(tail1,'xdata',y(2:p,1),'ydata',y(2:p,3))
  set(head2,'xdata',y(1,5),'ydata',y(1,7))
  set(tail2,'xdata',y(2:p,5),'ydata',y(2:p,7))
  drawnow;
end


function y = eulerstepVf(t, y, h, f)
y = y + h*f(t, y);


function w = f(t, u)
% mass1 and mass2
m1 = 0.3;
m2 = 0.03;
g = 1;
mg1 = m1*g;
mg2 = m2*g;
w = zeros(1, length(u));
w(1) = u(2);
w(2) = mg2*(u(5)-u(1))/((u(5)-u(1))^2+(u(7)-u(3))^2)^(3/2);
w(3) = u(4);
w(4) = mg2*(u(7)-u(3))/((u(5)-u(1))^2+(u(7)-u(3))^2)^(3/2);
w(5) = u(6);
w(6) = mg1*(u(1)-u(5))/((u(5)-u(1))^2+(u(7)-u(3))^2)^(3/2);
w(7) = u(8);
w(8) = mg1*(u(3)-u(7))/((u(5)-u(1))^2+(u(7)-u(3))^2)^(3/2);

