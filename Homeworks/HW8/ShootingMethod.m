
[t,y] = ode45(@Ex2402, [0,10],[300,-5]);
tb1 = y(length(y));
disp(tb1);
temp1 = y(:,1);

