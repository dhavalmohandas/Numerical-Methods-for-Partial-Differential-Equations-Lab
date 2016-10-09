clear all
close all
global xi xf ti tf h1
xi = 0;
xf = 1;
ti = 0;
tf = 1;
lambda = 0.5;
h1 = 0.1;

k = 5;

for i=1:k
    step(i) = h1;
    N = fix((xf-xi)/h1);
    x = linspace(xi,xf,N+1);
    u_exact = exp(-1)*sin(pi*x');
    err(i) = max(abs(BTCS()-u_exact));
    h1 = h1/2;
end

for i=1:(k-1)
    order(i) = log(err(i)/err(i+1))/log(2);
end
err
order

figure(1)
plot(log(step),log(err))

