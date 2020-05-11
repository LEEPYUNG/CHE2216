%% P2Q2b

%Initial Conditions
Yl = 0.14;
Xp1 = 0.19;
Xp2 = 0.19;
Xp3 = 0.19;
Xa = 0.18;
Xv = 0.15;

%logistical paramenters
y0 = [Yl Xp1 Xp2 Xp3 Xa Xv];
tspan = 0:0.001:10; %time
h = 0.001; %step sizze
[tp, yp] = rk4sys(@dydtMaker2, tspan, y0, 0.01);

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

% 2b) Since there is oscillation in breathing, there is an oscillation in the graph 
% in the lung and pulmonary compartment lines. Steady state is still reached between 
% 1 to 2 minutes. The oxygen concentration varies from high to low concentrations 
% because there is an oscillation in breathing.