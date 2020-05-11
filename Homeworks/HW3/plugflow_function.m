function [y] = plugflow_function(x)
%This function finds a y value given an input x.
%Input:
%   x: The number you want to plug in into the equation
%output:
%   ans: The output, y value given input x.

y= @(R) log((1+R*(1-x))/(R*(1-x)))-((R+1)/(R*(1+R*(1-x)))); %Function given from homework PDF, Moved all terms to one side.
end






