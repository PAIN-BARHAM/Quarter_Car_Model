% Defien the system constants 

mb  = 1600/4;   %kg
mw = 180/4;     %kg
ks = 69000;       %N/m
kt = 201000;     %N/m
C = 1190;    %N.s/m

N = [ks*C kt*ks]/(mw*mb);
D = [1 C*(mb+mw)/(mw*mb) (mw*ks+mb*ks+mb*kt)/(mw*mb) C*kt/(mw*mb) ks*kt/(mw*mb)];

%%
%%% Case # 1 >> Step input 
% Displacment input ( road displacment)
x = linspace(0, 100, 2000);
% Step input function
f = @(x) (x >= 20);

% Create a new figure
figure()
% Create a subplot 
subplot(3,1,1) 
hold on
% 3 cm, step function
u = 0.03*f(x);
% Plot the results
plot(x,u)
title('Step input','fontsize',16),xlabel('$X(m)$','Interpreter','latex','fontsize',14),ylabel('$X_r(m)$','Interpreter','latex','fontsize',14),grid,ylim([0 0.04])
saveas(gcf,'myfigure1.pdf')


%%

% Sinosudal 

% Displacment input ( road displacment)
x = linspace(0, 100, 2000);
% sin input function, in m
f = @(x) ((0.5 * sind(100*x)));

% Create a new figure
% Create a subplot 
subplot(3,1,2) 
% 3 cm, step function
u = f(x)/100;
% Plot the results
plot(x,u)

title('Sin input','fontsize',16),xlabel('$X(m)$','Interpreter','latex','fontsize',14),ylabel('$X_r(m)$','Interpreter','latex','fontsize',14),grid,ylim([-0.01 0.01])

saveas(gcf,'myfigure2.pdf')

%%

% Road bump
subplot(3,1,3) 
x = linspace(0,4*pi);
f = @(x) (x>=5) .* (x<=5+pi/2) * 0.25 .* sin(2.*(x-5));
u = f(x);
plot(x,u)

title('Road bump','fontsize',16),xlabel('$X(m)$','Interpreter','latex','fontsize',14),ylabel('$X_r(m)$','Interpreter','latex','fontsize',14),grid,ylim([-0.3 0.3])

saveas(gcf,'Profiles.pdf')
