clear all;
close all;

global N h x

x0 = 0;
xN = 2;
N = 50;
h = (xN-x0)/N;

for i=1:(N-1)
   x(i) = (i)*h;
   u0(i) = sin(pi*0.5*x(i));
end



t0=0;
tf=1;

tspan = t0:0.1:tf;
[t y] = ode45('molrhs',tspan,u0)

% exact solution
for i=1:(N-1)
    u_exact(i) = exp(-pi*pi*0.25)*sin(0.5*pi*x(i));
end

plot(x,y(11,:),'*');
hold on;
plot(x,u_exact);