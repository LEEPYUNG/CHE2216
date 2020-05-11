function [T] = zombie_interest(P,r,n)
%This is a function that claculates the zombie population starting from an
%initial population, given a rate and time period.
%Input:
%   P: an Integer representing inital population
%   r: a number representing growth rate
%   n: a number representing days passed.
%Output:
%   T: Total zombie population given n days.
    
%First create output value by inserting equation given in the homework.
T = P*(1+0.01*r)^n;

end

