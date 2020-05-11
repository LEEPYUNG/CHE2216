%HW8Q1

[x,y] = ode45(@dydxn, [0,20],[5 fzero(@res,-1)]);
plot(x,y(:,1));
xlabel('X');
ylabel('Y');
title('plotHW8Q1');