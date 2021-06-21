function dydt = WGM(t,y,g,nu,beta,kappa,k,omega,a,d,z)
etax = - a*k*sin(k * y(1)-omega * t);
hx = - a*k*exp(-k * z)*sin(k * y(3) - omega * t);
eta = a*cos(k * y(1)-omega * t);
h =  a*exp(-k * z)*cos(k * y(3) - omega * t);
l = d^2+(y(1)-y(3)).^2;
dydt(1) = y(2);
dydt(2) = - g * etax + ...
1/l^(3/2)*kappa*((d-sqrt(l))*l*(y(1)-y(3))+d^2*(y(1)-y(3))*...
   (h-eta)+d*(d-sqrt(l))*l*etax ) ...
    - nu * y(2);
dydt(3) = y(4); 
dydt(4) = - g * hx + beta * abs(y(3))-...
 1/l^(3/2)*kappa*((d-sqrt(l))*l*(y(1)-y(3))-d^2*(y(1)-y(3))*...
   (h-eta)+d*(-d+sqrt(l))*l*hx ); 
dydt=dydt';

