format long

ti = 0;
tf = 1;
xi = 0;
xf = 1;
h1 = 0.05;
lambda = 0.4;
h2 = lambda*h1^2;
N = fix((xf-xi)/h1);
M = fix((tf-ti)/h2);
x = linspace(xi,xf,N+1);
t = linspace(ti,tf,M+1);
u = zeros(M+1,N+1);

%u(1,:) = sin(pi*x);
%u(1,:) = sin(pi*0.5*x);
u(1,:) = cos(pi*(x-0.5));

for i=1:M
    for j=2:N
        u(i+1,j) = lambda*u(i,j-1)+(1-2*lambda)*u(i,j)+lambda*u(i,j+1)+h2*f(x(j),t(i));
    end
end

u_exact = zeros(1,N+1);

for i=1:(N+1)
    %u_exact(i) = exp(-1)*sin(pi*x(i));
    %u_exact(i) = exp(-pi^2*0.25)*sin(0.5*pi*x(i));
    u_exact(i) = exp(-1)*cos(pi*(x(i)-0.5));
end

%figure(1)
plot(x,u(M+1,:),'*');
hold on
plot(x,u_exact);

%figure(2)
%surf(x,t,u)

[u(M+1,:)' u_exact']

