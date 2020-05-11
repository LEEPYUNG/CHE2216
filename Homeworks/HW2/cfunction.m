function [ans] = cfunction(x)
%This function finds a y value given an input x. Solves question 6.
%This is a modified function of bfunction created to answer question 6.
%Input:
%   x: The number you want to plug in into the equation/
%output:
%   ans: The output, y value given input x.

%The constants 
A =  (1.21 * 10^1);
B = (2.82 * 10^-1);
C = (1.77 * 10^-4);
D = (5.56 * 10^-8);
E = (6.35 * 10^-12);

%The deltaConstants aka the errors for each constants.
delA =  0.03*(1.21 * 10^1);
delB = 0.03*(2.82 * 10^-1);
delC = 0.03*(1.77 * 10^-4);
delD = 0.03*(5.56 * 10^-8);
delE = 0.03*(6.35 * 10^-12);

%Final answer would be the errors for each constant + the error for the
%temperature. This ans would be the absolute error.

%when T = 200 --> absolute Error = 2.64 
%when T = 1200 --> absolute Error = 22.4296 
ans = delA + delB*x + delC*(x^2) + delD*(x^3) + delE*(x^4) + (0+B+(2*C*x)+(3*D*x^2)+(4*E*x^3));

%Calculating relative Error.
rE = 2.64/bfunction(200); %Calculates to 0.04
disp("rE for 200: " + rE);   %200 

rE2 = 22.4296/bfunction(1200); %Calculates to 0.12
disp("rE2 for 1200: " + rE2);   %1200 
end








