function [root] = modifiedsecant(func, tol, input, per)
%This function implements modifiedsecant to find a root of a function
%within a tolerance
%Input:
%   func: function that will be used in modified Secant method.
%   tol: the tolerance we will use to narrow down our root.
%   input: initial guess.
%   h: pertubation size
%Output:
%   root: The square root answer for the input.

%Create x0,xi: x0 is the second guess, xi is the initial guess.
xi = input;
h = xi * per; %h is the step size.
x0 = xi + h; 

%Create x2old for approximate error caluclation.
x2old = 0;

%iter variable to keep track of iterations
iter = 1;

while 1
%Find the next guess, x2.
x2new = xi - ((xi - x0)*(func(xi)))/((func(xi))-(func(x0)));

%Check if this new x2 meets tolerance requirements. Calculatoring Approximate Relative error
rAE = abs((x2new - x2old)/x2new);

%Test if it's within tolerance, if so break out of loop.
if(rAE < tol)
    break; %solution is within tolerance.
else 
     fprintf('at iter %6d, error rAE = %16.12f\n',iter,rAE);
     %fprintf("\n");
     iter = iter +1;
    x2old = x2new;% change the current approximation to the new one.
    x0 = xi;
    xi = x2new;
end
end

root = x2new;
disp("The root for this function within the given tolerance is: " + root);















