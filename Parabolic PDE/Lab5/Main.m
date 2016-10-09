clear all
close all
format long
xi = 0;
xf = 1;
ti = 0;
tf = 1;
h1 = 0.1;

for p=1:5
step(p) = h1;    
lambda = 0.5;
h2 = lambda*h1^2;
N = fix((xf-xi)/h1);
M = fix((tf-ti)/h2);
x = linspace(xi,xf,N+1);
t = linspace(ti,tf,M+1);
A1 = zeros(N+1,N+1);
A2 = zeros(N+1,N+1);

for i=1:N+1
    A1(i,i) = 1+lambda;
    A2(i,i) = 1-lambda;
    if i>1
        A1(i,i-1) = -lambda/2;
        A2(i,i-1) = lambda/2;
    end
    if i<N+1
        A1(i,i+1) = -lambda/2;
        A2(i,i+1) = lambda/2;
    end    
end

A1(1,2) = 2*A1(1,2);
A1(N+1,N) = 2*A1(N+1,N);
A2(1,2) = 2*A2(1,2);
A2(N+1,N) = 2*A2(N+1,N);
u0 = cos(pi*x');
u = zeros(1,N+1);

%exact solution
u_exact = exp(-1)*cos(pi*x);

for j=1:M
    rhs = A2*u0 + 0.5*h2*(f(x',t(j))+f(x',t(j+1)));
    u = A1\rhs;
    u0 = u;
end

err(p) = max(abs(u'-u_exact));
h1 = h1/2;
end

for i=1:4
    order(i) = log(err(i)/err(i+1))/log(2);
end

order

figure(1)
plot(x,u)
hold on
plot(x,u_exact)

%figure(2)
%plot(err,log(step))
% 
% [u u_exact']

