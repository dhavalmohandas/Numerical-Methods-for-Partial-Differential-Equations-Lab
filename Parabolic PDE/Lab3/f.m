function [a] = f(x,t)
%a = (pi^2-1)*exp(-t)*sin(pi*x);
%a = 0
a = (pi^2-1)*exp(-t)*cos(pi*(x-0.5));

end

