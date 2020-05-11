% %% HW6Q1
% % Use the portion of the given steam table for superheated
% % water at 200 MPa to find 
% %(a) the corresponding entropy s for a specific volume ? of 0.118 with linear
% % interpolation 
% %(b) the same corresponding entropy using quadratic interpolation
% %(c) the volume corresponding to an entropy of 6.45 using inverse interpolation.
% 
% % v 0.10377 0.11144 0.12547
% % s 6.4147  6.5453  6.7664
% 
% %find s for v = 0.118

%% PART A
ansA = linearInterpolate(0.118, 0.11144,0.12547,6.5453,6.7664); %Use written function.
disp("PART A: ");
disp("W/ Linear Regression, f(0.118) = ");
disp(ansA);

%% PART B
ansB = quadraticInterpolate(0.118, 4,3,2,0.25,0.3333,0.5 ); %Use written function.
disp("PART B: ");
disp("W/ Quadratic Regression, f(0.118) = ");
disp(ansB);

%% PART C s = 6.45
[coefficients] = polyfit([0.10377 0.11144 0.12547],[6.4147 6.5453 6.7664], 2); %Use written function.
coefficients(3)= coefficients(3) - 6.45;
roots = roots(coefficients);
disp("PART C: ");
disp("W/ Inverse Interpolation The volume is: ");
disp(roots(2,1));

