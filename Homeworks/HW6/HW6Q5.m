%% HW6Q5
%
% dp/dx = -8uQ/(pi*r^4)
% p = pressure, x = distance, u = dynamic viscosity, Q = flor, r = radius
% 
%% PART A
% Determine the pressure drop for a 10-cm length tube
% for a viscous liquid ( ? = 0.005 N · s/m2, density = ? =
% 1 × 103 kg/m3) with a flow of 10 × 10?6 m3/s and the
% following varying radii along its length:
%
%x (m): 0       0.02       0.04        0.05       0.06        0.07       0.10
%r (m): 0.002   0.00135    0.00134    0.0016     0.00157    0.00142    0.002

disp("PART A");

%Row Vector to hold radius values
radius = [0.002 0.00135 0.00134 0.0016 0.00157 0.00142 0.002];
%Row Vector to hold x values
x = [0 0.02 0.04 0.05 0.06 0.07 0.10];
%Making anonymous function
I = @(r) ((-8*0.005*(10*10^-6))/(pi*r^4));
%Vector to hold Integrand values
Integrand = zeros(1,7);
%Loop to populate integrand
for i=1:7
   Integrand(i) = I(radius(i)); 
end

%Integral of first section
I1 = SimpThird(0,0.04,Integrand(1),Integrand(2),Integrand(3));
%Integral of second section
I2 = SimpEighth(0.04,0.07,Integrand(3),Integrand(4),Integrand(5), Integrand(6));
%Integral of third section
I3 = trap(0.07,0.10,Integrand(6), Integrand(7));

PressureDrop = I1+I2+I3;
disp("The total pressure drop: " + PressureDrop + "N/m^2.");

%% PART B
% Compare your result with the pressure drop that would
% have occurred if the tube had a constant radius equal to
% the average radius.

disp("PART B");

%Finding Average Radius Value with simpson rules
%Integral of first section
I1 = SimpThird(0,0.04,radius(1),radius(2),radius(3));
%Integral of second section
I2 = SimpEighth(0.04,0.07,radius(3),radius(4),radius(5), radius(6));
%Integral of third section
I3 = trap(0.07,0.10,radius(6), radius(7));

AverageRadius = (I1+I2+I3)/0.1;

%Calcualting pressure drop
PressureDrop2 = I(AverageRadius) * 0.1; %Multiplying by dx since it's not dependent on x.
disp("The Pressure drop with a constant radius is: " + PressureDrop2 + "N/m^2.");

%% PART C
% Determine the average Reynolds number for the tube to
% verify that flow is truly laminar (Re = ??D?? < 2100
% where ? = velocity).
% ( ? = 0.005 N · s/m2, density = ? = 1 × 10^3 kg/m3) with a flow of 10 × 10?6 m3/s

%v = velocity
%D = diameter 
%u = constant
%p = constatnt
%R = pvD/u; %Equation for reynolds 

disp("PART C");

v = 0.00001/(pi*AverageRadius^2); %v = Q/A
R = (10^3) * v * (2*AverageRadius) / 0.005;

disp("Reynolds number is: " + R);
disp("Since R < 2100, it is in laminar flow.");









