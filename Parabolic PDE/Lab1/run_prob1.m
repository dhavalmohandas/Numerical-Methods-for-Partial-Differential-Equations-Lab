clear all
close all

t0 = 0;
tN = 5;
tspan = [t0:0.01:tN];
[T,Y] = ode45('prob1',tspan,[3,4])