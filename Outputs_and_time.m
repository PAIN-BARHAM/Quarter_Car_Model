%%
% t = linspace(0,50,10000);
% Defien the system constants 
mb  = 400;      %kg
mw = 45;        %kg
ks = 69000;     %N/m
kt = 201000 ;   %N/m
C = 1190 ;       %N.s/m

% Numerator and Denomenator of the sys

Num = [kt*C kt*ks];
Den  = [mw*mb C*(mb+mw) (mw*ks+mb*ks+mb*kt) C*kt ks*kt];

% The speed of the car in m/s, since all system values are in SI units
v = [20 40 60] * (1000/3600);
sys = tf(Num,Den);

%%
figure()
f = @(x) (x >= 20) * 0.03;
hold on

for j=1:3
en = 100/v(j);
t =  linspace(0,en,1000);
x = t * v(j);
X_r = f(x);
y = lsim(sys,X_r,t); % Xb in m
plot(t,y)
end
grid,title('Step input','Interpreter','latex','fontsize',20), legend('20 km/h','40 km/h','60 km/h','Interpreter', 'latex','fontsize',14)
xlabel('time (s)','Interpreter','latex','fontsize',20), ylabel('$X_b (m)$','Interpreter','latex','fontsize',20)

xh = get(gca,'xlabel');   % handle to the label object
p = get(xh,'position');   % get the current position property
p(2) = 1.2*p(2) ;         % double the distance, 
set(xh,'position',p) ;      % set the new position

yh1 = get(gca,'ylabel');   % handle to the label object
p1 = get(yh1,'position');   % get the current position property
p1(2) = 1.05*p1(2);           % double the distance, 
set(yh1,'position',p1);       % set the new position


%%

figure()
% x = 0:0.01:100; % x in m
f_sin = @(x) (0.5/100) *sin(100*x);
hold on
for j=1:3
en = 100/v(j);
t =  linspace(0,en,1000);
x = t * v(j);
X_r_sin = f_sin(x);
y = lsim(sys,X_r_sin,t); % Xb in m
plot(t,y)
end

grid,title('Sin input','Interpreter','latex','fontsize',20), legend('20 km/h','40 km/h','60 km/h','Interpreter', 'latex','fontsize',14)
xlabel('time (s)','Interpreter','latex','fontsize',20), ylabel('$X_b (m)$','Interpreter','latex','fontsize',20)

xh = get(gca,'xlabel');   % handle to the label object
p = get(xh,'position');   % get the current position property
p(2) = 1.*p(2) ;           % double the distance, 
set(xh,'position',p)       % set the new position

yh = get(gca,'ylabel');   % handle to the label object
p = get(yh,'position');   % get the current position property
p(2) = 1.1*p(2) ;           % double the distance, 
set(yh,'position',p);       % set the new position

%%
figure()

f_bump = @(x) (x>=5) .* (x<=5+pi/2) * 0.25 .* sin(2.*(x-5));

hold on
for j=1:3
en = 100/v(j);
t =  linspace(0,en,1000);
x = t * v(j);
X_r_bump =f_bump (x);
y = lsim(sys,X_r_bump,t); % Xb in m
plot(t,y)
end

grid,title('bumb road input','Interpreter','latex','fontsize',20), legend('20 km/h','40 km/h','60 km/h','Interpreter', 'latex','fontsize',14)
xlabel('time (s)','Interpreter','latex','fontsize',20), ylabel('$X_b (m)$','Interpreter','latex','fontsize',20)

xh = get(gca,'xlabel');   % handle to the label object
p = get(xh,'position');   % get the current position property
p(2) = 1.*p(2) ;           % double the distance, 
set(xh,'position',p)       % set the new position

yh = get(gca,'ylabel');   % handle to the label object
p = get(yh,'position');    % get the current position property
p(2) = 1.1*p(2) ;           % double the distance, 
set(yh,'position',p);       % set the new position