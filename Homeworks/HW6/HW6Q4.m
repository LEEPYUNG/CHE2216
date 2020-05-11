%% HW6Q3
%
%Ta = 20C
%dT/dt = -k(T-Ta)
%Plot dT/dt verse T-Ta
%Employ Linear Regression to Evaluate k
%
%Time 0     5       10       15       20     25
%T    80    44.5    30.0     24.1     21.7   20.7

Time = [0 5 10 15 20 25];
T = [80,44.5,30.0,24.1,21.7,20.7]; %Vector of temperatures

Tdifferences = zeros(1,4); %initializing the vectors
derivatives = zeros(1,4);

for i = 2:5
    derivatives(i-1) = centralFirst(T(i+1),T(i-1),5); %Use function to calculate derivative
    Tdifferences(i-1) = T(i) - 20;
end

plot(Tdifferences,derivatives); %plot with titles and labels
title('dT/dt vs T-Ta');
xlabel('T-Ta');
ylabel('dT/dt');

%Linear Regression to solve for k
a = polyfit(Tdifferences, derivatives, 1 ); %find constants for y = mx + b
disp("The slope is: " + a(1));