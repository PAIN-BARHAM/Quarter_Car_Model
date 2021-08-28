% Defien the system constants

mb  = 400;   %kg
mw = 45;     %kg
ks = 69000;       %N/m
kt = 201000 ;     %N/m
C = 1190 ;    %N.s/m

% Numerator and Denomenator of the sys
N = [ks*C kt*ks]/(mw*mb);
D = [1 C*(mb+mw)/(mw*mb) (mw*ks+mb*ks+mb*kt)/(mw*mb) C*kt/(mw*mb) ks*kt/(mw*mb)];

% The speed of the car in m/s, since all system values are in SI units
v = [20 40 60] * (1000/3600);

%---------------------------------------------------------------------------------------------------

figure()

% Displacment input ( road displacment)
x = linspace(0, 100, 10000);
% Step input function
f = @(x) (x >= 20);

% 3 cm, step function
u = 0.03*f(x);
% Plot the results
plot(x,u)

hold on
for i=1:3
    t = linspace(0,50,10000);
    x = v(i)*t;
    u = 0.03*f(x);
    y = lsim(N,D,u,t);
    plot(x,y),xlim([0 200])
end

grid,title('Step input','Interpreter','latex'), legend('input(3 xm, after 20 m)','20 km/h','40 km/h','60 km/h','Interpreter', 'latex')
xlabel('X(m)', 'Interpreter', 'latex'),ylabel('$X_r(m)$','Interpreter', 'latex')

%---------------------------------------------------------------------------------------------------

figure()
% Displacment input ( road displacment)
x1 = linspace(0, 100, 10000);
% sin input function, in m
f = @(x) ((0.5 * sind(100*x)));

% 3 cm, step function
u = f(x)/100;
% Plot the results
plot(x,u)

hold on
for i=1:3
    t = linspace(0,100,10000);
    x = v(i)*t;
    u = f(x1)/100;
    y = lsim(N,D,u,t);
    plot(x,y),xlim([0 200])
end

grid,title('Sin input','Interpreter', 'latex'), legend('20 km/h','40 km/h','60 km/h','Interpreter', 'latex')
xlabel('$X(m)$','Interpreter', 'latex'),ylabel('$X_r(m)$','Interpreter', 'latex')

%-----------------------------------------------------------------------------------------------------------------------

figure()

% input signal
x1 = linspace(0,4*pi,1000);
f = @(x) (x>=5 & x<=5+pi/2);
u1= f(x1) .* 0.25 .* sin(2.*(x1-5));
plot(x1,u1)
hold on

for i=1:3
x1 = linspace(0,4*pi,1000);
t =  linspace(0,10,1000);
x = v(i) * t;
f = @(x) (x>=5 & x<=5+pi/2);
u= f(x) .* 0.25 .* sin(2.*(x-5));
y = lsim(N,D,u,t);
plot(x,y)
end

grid,title('Road bump input','Interpreter', 'latex'), legend('input','20 km/h','40 km/h','60 km/h','Interpreter', 'latex')
xlabel('$X(m)$','Interpreter', 'latex'),ylabel('$X_r(m)$','Interpreter', 'latex')
