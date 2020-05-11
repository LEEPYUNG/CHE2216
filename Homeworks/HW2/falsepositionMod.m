function [root] = falsepositionMod(func, es, xl,xu, yInput)
%This function implements false position to find a root of a function
%within a tolerance: 
%This is a modified version of the false position method. Instead of
%finding a root, it finds the x value for an wanted input y value.
%Input:
%   func: function that will be used in falseposition method.
%   es: the tolerance we will use to narrow down our root.
%   xu: upper bound
%   xl: lower bound
%   yInput: what value of y that is searched for.
%Output:
%   root: The square root answer for the input.


%set last approximation as lower value
xrold = xl;

%Start whileloop here
while 1

%find the low and high value of function
fl = func(xl);
fu = func(xu);

%guess the root
xr = xu +((yInput-fu)*(xl - xu))/(fl - fu);

%Calculate the root function value
fr = func(xr);

%CALCULATE approximate error here and then if passes, break.
ea = abs((xr-xrold)/xr);

%Test if it's within tolerance, if so break out of loop.
if(ea < es)
  
    break; %solution is within tolerance.
else
    xrold = xr; % change the current approximation to the new one.
end

%test whether to throw away upper or lower bound.
if(fr * fu < 0)
    xl = xr;
else
    xu = xr;
end 
    
end %End of while loop.

root = xr;




