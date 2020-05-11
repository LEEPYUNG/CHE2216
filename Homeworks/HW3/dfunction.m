function [ans] = dfunction(x)
%This function finds a y value given an input x. This is a supplementary
%functino to HW3Q2.
%Input:
%   x: The number you want to plug in into the equation
%output:
%   ans: The output, y value given input x.

ans = -(exp(-x))+(15*((cos(x))^2)*(sin(x)))-(2*x)-(5);
end