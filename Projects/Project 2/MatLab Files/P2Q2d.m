%% P2Q2d

%Initial Conditions
Yl = 0.14;
Xp1 = 0.19;
Xp2 = 0.19;
Xp3 = 0.19;
Xa = 0.18;
Xv = 0.15;

%logistical paramters 
y0 = [Yl Xp1 Xp2 Xp3 Xa Xv];
tspan = 0:0.001:10;
h = 0.001;
[tp, yp] = rk4sys(@dydtMaker4, tspan, y0, 0.01);

%Plotting
hold on
plot(tp, yp(:,1));
plot(tp, yp(:,2));
plot(tp, yp(:,3));
plot(tp, yp(:,4));
plot(tp, yp(:,5));
plot(tp, yp(:,6));

xlabel('Time (min)');
ylabel('Concentration of O2');
legend('YL','Xp1','Xp2','Xp3','Xa','Xv');
title('Concentration of O2 vs Time');

%2d) The graph has the oscillations trending downwards, 
% as compared to the constant oscillatory lines in the graph of b.
% The Xv line trends negatively toward a concentration of 0 while 
% the Xa concentration of appears to reach a steady state value.
