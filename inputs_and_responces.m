% Defien the system constants 

mb  = 400;   %kg
mw = 45;     %kg
ks = 69000;       %N/m
kt = 201000 ;     %N/m
C = 1190 ;    %N.s/m

N = [ks*C kt*ks]/(mw*mb);
D = [1 C*(mb+mw)/(mw*mb) (mw*ks+mb*ks+mb*kt)/(mw*mb) C*kt/(mw*mb) ks*kt/(mw*mb)];

input = 0.03 * frest.createStep('StepTime',20,'StepSize',0.1,'FinalTime',100)
---------------------------------------------------------------------------------------------------------------------------------------

%%% Case # 1 >> Step input 
% Displacment input ( road displacment)
x = linspace(0, 100, 10000);
% Step input function
f = @(x) (x >= 20);

% Create a new figure
figure()

% Create a subplot 
subplot(2,1,1)
hold on
% 3 cm, step function
u = 0.03*f(x);
% Plot the results
plot(x,u)
title('Step input'),xlabel('$X(m)$','Interpreter','latex'),ylabel('$X_r(m)$','Interpreter','latex'),grid,ylim([0 0.04])

% Create the figure for the responce
subplot(2,1,2) 
y=lsim(N,D,u,x);
title('The Response of system')
plot(x,y),xlabel('X(m)'),ylabel('X_b(m)'),grid,ylim([0 0.06])



%---------------------------------------------------------------------------------------------------------------%
% Sinosudal 

% Displacment input ( road displacment)
x = linspace(0, 100, 10000);
% sin input function, in m
f = @(x) ((0.5 * sind(100*x)));

% Create a new figure
figure()
% Create a subplot 
subplot(2,1,1) 
% 3 cm, step function
u = f(x)/100;
% Plot the results
plot(x,u)
title('Sin input'),xlabel('$X(m)$','Interpreter','latex'),ylabel('$X_r(m)$','Interpreter','latex'),grid,ylim([-0.01 0.01])

subplot(2,1,2)

y=lsim(N,D,u,x);

plot(x,y)


%--------------------------------------------------------------------------------------------------------------------------------------

%Road bump
figure()
%x = linspace(0, 100, 10000);

subplot(2,1,1) 
x = linspace(0,4*pi,1000);
f = @(x) (x>=5 & x<=5+pi/2);
u= f(x) .* 0.25 .* sin(2.*(x-5));
plot(x,u)

title('Positive'),xlabel('$X(m)$','Interpreter','latex'),ylabel('$X_r(m)$','Interpreter','latex'),grid,ylim([-0.3 0.3])

subplot(2,1,2)

y=lsim(N,D,u,x);

plot(x,y)


