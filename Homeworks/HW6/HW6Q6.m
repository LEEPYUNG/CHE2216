%% HW6Q6

%% 
% Determine the pressure drop for a 10-cm length tube
% for a viscous liquid ( ? = 0.005 N · s/m2, density = ? =
% 1 × 103 kg/m3) with a flow of 10 × 10?6 m3/s and the
% following varying radii along its length:
%
%x (m):      0      4       6       8       12      16         20
%p (g/cm^3): 4      3.95    3.89    3.80    3.60    3.41       3.30
%A  (cm^2):  100    103     106     110     120     133         150
   
%Vectors to hold p and A values
p = [4.00 3.95 3.89 3.80 3.6 3.41 3.3];
A = [100  103  106  110  120 133  150];
%Vector to hold pA values
pA = zeros(1,7);
%Loop to populate integrand
for i=1:7
   pA(i) = p(i) * A(i);
end

%Integral of first section
I1 = SimpThird(4,8,pA(2),pA(3),pA(4));
%Integral of second section
I2 = SimpEighth(8,20,pA(4),pA(5),pA(6),pA(7));
%Integral of third section
I3 = trap(0,4,pA(1),pA(2));

mass = I1+I2+I3;
disp("The total mass: " + mass + " grams.");











