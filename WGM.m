function dydt = WGM(t,y,g,nu,beta,kappa,k,omega,a,d,z)
etax = - a*k*sin(k * y(1)-omega * t);
hx = - 0*a*k*exp(-k * z)*sin(k * y(3) - omega * t);
dydt(1) = y(2);
dydt(2) = - g * etax - kappa * (y(1)-y(3)-d) + nu * y(2);
dydt(3) = y(4); 
dydt(4) = - g * hx + kappa * (y(1)-y(3)-d) + beta * abs(y(3)); 
dydt=dydt';