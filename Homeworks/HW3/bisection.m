function [ bisect ] = bisection(func,xl,xu,es,imax)
%Find roots by the bisection method 

% inputs:
%     func: function to find a zero by bisection
%     xl: lower bound
%     xu: upper bound
%     es: desired tolerance
%     imax: maximum number of iterations to try before giving up
% outputs: 
%      bisect: the zero for the bisect function between the bounds
%

% start finding the low value of the function.
fl = func(xl);
%loop over iterations.
for iter = 1:imax  

    % there is no previous guess for last time, so we arbitrarily pick the 
    % lower bound as the last value.
    if iter > 1
        xrold = xr;
    else
        xrold = xl; 
    end
% the guess for the root is the bisection point
    xr = (xl+xu)/2;
    fr = func(xr);
% if xr is not zero, calculate the relative error, and print out the
% current iteration
    % compute relative approximate error, assuming xr is not zero.
    if (xr ~= 0)
       ea = abs((xr-xrold)/xr)*100;
    else 
       disp('Solution is at zero, printing absolute error')
       ea = abs(xr-xrold);
    end
    fprintf('at iter %6d, xr= %16.8f with error ea = %16.8f\n',iter,xr,ea);

    %identify which two points out of xu,xl and xr bracket the answer
    test = fl*fr;
    if (test < 0)
         xu = xr;
    elseif (test > 0)
         xl = xr;
         fl = fr;
    else
         ea = 0;
    end
    if (ea < es) % found a solution to within tolerance.
        fprintf('Found a solution to within tolerance %.4g\n',es);
        break;
    end
    % whoops! too many iterations.
    if (iter == imax)
        disp(['Reached imax= ' num2str(imax) ' without finding root']); 
        break;
    end
end
bisect = xr;

