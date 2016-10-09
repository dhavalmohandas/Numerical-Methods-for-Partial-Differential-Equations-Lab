function u = BTCS()
global xi xf ti tf h1
lambda = 0.5;

h2 = lambda*(h1^2);
N = fix((xf-xi)/h1);
M = fix((tf-ti)/h2);
x = linspace(xi,xf,N+1);
t = linspace(ti,tf,M+1);

A = zeros(N-1);
u0 = sin(pi*(x(2:N))');
u = zeros(N-1,1);


for i=1:(N-1)
    A(i,i) = 1+2*lambda;
    if i>1
        A(i,i-1) = -lambda;
    end
    if i<(N-1)
        A(i,i+1) = -lambda;
    end
end

for i=2:(M+1)
    b = u0 + h2*f((x(2:N))',t(i));
    u = A\b;
    u0 = u;
end

u = cat(1,[0],u);
u = cat(1,u,[0]);


end