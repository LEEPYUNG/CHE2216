function [ans] = afunction(x)
%This function finds a y value given an input x.
%Input:
%   x: The number you want to plug in into the equation
%output:
%   ans: The output, y value given input x.

ans = (exp(cos(x)))-(x^3)+(2*x^2)+(5*x)-3;
end

