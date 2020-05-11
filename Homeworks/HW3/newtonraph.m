function [ nr ] = newtonraph(func,dfunc,xr,es,imax)
%Find roots by the Newton-Raphson mrthod
%
% inputs:
%     func: function to find a zero by newton raphson
%     dfunc: analytical derivative of the function
%     xr: guess for the root
%     es: desired tolerance
%     imax: maximum number of iterations to try before giving up.
% outputs: 
%      falsep: the zero for the input function between the bounds
%

% start by finding the value of the function at the start point.

%loop over iterations.
for iter = 1:imax  

    % save old point
    xrold = xr;
    
    % compute a new point
    fxr = func(xr);
    dfxr = dfunc(xr);
    xr = xr - fxr/dfxr;

    if (xr ~=  0)
        ea = abs((xr-xrold)/xr); % compute relative error
    else 
       disp('Solution is at zero, printing absolute error')
       ea = abs(xr-xrold);
    end
    fprintf('at iter %6d, xr= %16.12f with error ea = %16.12f\n',iter,xr,ea);
         
    if (iter == imax) % check if we've reached the iteration
        disp(['Reached imax= ' num2str(imax) ' without finding root']); 
        break;
    end    
    if ((ea < es) || (xr==0)) % found a solution to within tolerance, or it's zero.
        disp('Found a solution to within tolerance!');
        break;
    end

end
nr = xr;

