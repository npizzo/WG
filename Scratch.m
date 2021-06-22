tspan = [0 20];
IC = [1; 1; 1; 1];
[t,y] = ode45(@WGM,tspan,IC);
plot(t,y(:,1),'-o',t,y(:,3),'-o')

%%
y1 = a * cos(k * y(:,1) - omega * t);
y2 = a * exp(- z * k) * cos(k * y(:,3) - omega * t);
subplot(2,1,1)
plot(y(:,1),y1,'k')
subplot(2,1,2)
plot(y(:,1),-z+y2,'r')
xlabel('x')
ylabel('y')

%% 
g = 0*9.81; 
nu = 0*1e-3;
beta = 0*1e-1;
kappa = 1e-1;
k = 1;
a = 1/10; 
omega = sqrt(g * k);
z = 2; 
d = z+a-a*exp(-k*z);
tspan = [0 60];
IC = [0; a*omega+0.1; 0; a * exp(- k * z) * omega]; %these need to 
%be chosen to satisfy the e.o.m. for water waves
[t,y] = ode45(@(t,y) WGM(t,y,g,nu,beta,kappa,k,omega,a,d,z),tspan,IC);
y1 = a * cos(k * y(:,1) - omega * t);
y2 = a * exp(- z * k) * cos(k * y(:,3) - omega * t);
x = [-pi: .1: pi];
%% make a movie 
for i = 1 : 5 : length(t)
plot(x, a * cos(k*x-omega*t(i)),'--k')
hold on
plot(wrapToPi(y(i,1)),y1(i),'ok','markerfacecolor','k')
hold on
plot(x, -z+a *exp(-k * z)*cos(k*x-omega*t(i)),'--r')
hold on
plot(wrapToPi(y(i,3)), -z+y2(i),'or','markerfacecolor','r')
hold off
ylim([-3 1/2])
xlim([-pi pi])
pause(0.1)
end
