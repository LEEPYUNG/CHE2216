function [ans] = afunction(x)
%This function finds a y value given an input x.
%Input:
%   x: The number you want to plug in into the equation
%output:
%   ans: The output, y value given input x.

ans = (exp(-x))-(5*((cos(x))^3))-(x^2)-(5*x);
end

