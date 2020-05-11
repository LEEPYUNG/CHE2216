%Residual Function for HW8Q1

function r = res(za)
[x,y] = ode45(@dydxn, [0,20], [5,za]);
r = y(length(x),1)-8;

