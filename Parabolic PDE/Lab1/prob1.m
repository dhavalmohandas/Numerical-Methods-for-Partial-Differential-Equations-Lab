function V = prob1(t,y)

rh1 = y(2);
rh2 = 40*cos(t);-4*y(2)-13*y(1);

V = [rh1;rh2];
end