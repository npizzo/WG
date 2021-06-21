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
x = [0: .1: 2*pi];
for 1 = 1 : 5 
subplot(5,1,i)
plot(x, a * cos(k*x-omega*t(i)),'--k')
hold on
plot(y(i,1),y1(i),'ok','markerfacecolor','k')
end
