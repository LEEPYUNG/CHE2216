function [y] = euler_explicit(t, delT)
%Euler's method 
%   INPUT: 
% t: the time
% delT: stepSize
%   OUTPUT:
% y: value of y at time t

func = @(y,t) ((1/3)+(-t)+(+3*y)); %Function of Derivative given

tVal = [0:delT:t]; %Value of time
yVal = [0:delT:t]; %Value of Y Values
yVal(1) = 1;  %Initial Condition
derivativeValues = [0:delT:t]; %Values of Deriviatves at given y and t.

for i = 2:length(yVal) %Caluclating Euler equations
    derivativeValues(i-1) = func(yVal(i-1), tVal(i-1)); %Calculating new derivatives
    yVal(i) = yVal(i-1) + (derivativeValues(i-1)*(delT));  %
end
y = yVal(length(yVal));
end

