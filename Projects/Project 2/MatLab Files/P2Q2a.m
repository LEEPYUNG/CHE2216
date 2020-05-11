%% P2Q2a

%Initial Conditions
Yl = 0.14;
Xp = 0.19; 
Xa = 0.18;
Xv = 0.15;

%logistical paramenters
y0 = [Yl Xp Xa Xv];
tspan = 0:0.01:10;
h = 0.01;
[tp, yp] = rk4sys(@dydtMaker, tspan, y0,0.01);

%Plotting
hold on
plot(tp, yp(:,1));
plot(tp, yp(:,2));
plot(tp, yp(:,3));
plot(tp, yp(:,4));

xlabel('Time (min)');
ylabel('Concentration of O2');
legend('YL','Xp','Xa','Xv');
title('Concentration of O2 vs Time');

% 2a) It took approximately 1 to 2 minutes to reach steady state.