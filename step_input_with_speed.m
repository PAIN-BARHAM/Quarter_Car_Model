% t = linspace(0,50,10000);
% Defien the system constants 
mb  = 400;      %kg
mw = 45;        %kg
ks = 69000;     %N/m
kt = 201000 ;   %N/m
C = 1190 ;       %N.s/m

% Numerator and Denomenator of the sys
N = [ks*C kt*ks]/(mw*mb);
D = [1 C*(mb+mw)/(mw*mb) (mw*ks+mb*ks+mb*kt)/(mw*mb) C*kt/(mw*mb) ks*kt/(mw*mb)];

% The speed of the car in m/s, since all system values are in SI units
v = [20 40 60] * (1000/3600);
sys = tf(N,D);

hold on

for j=1:3
t = 0:0.01:50;
u = zeros(size(t));

cond = 20/v(j);

for i=1:length(t)
    if t(i) < cond
        u(i) = 0;
    else
        u(i) = 0.03 * v(j);
    end
end

y = lsim(sys,u,t);

plot(t,y)

end
grid,title('Step input','Interpreter','latex'), legend('20 km/h','40 km/h','60 km/h','Interpreter', 'latex')