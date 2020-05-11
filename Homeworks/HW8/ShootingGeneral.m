
[x,y] = ode45(@dydxn, [0,20],[5 fzero(@res,-0.5)]);
plot(x,y(:,1));