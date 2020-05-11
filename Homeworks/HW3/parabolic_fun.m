function [ xmin, fxmin ] = parabolic_fun(func,x1,x3,tol)
% Golden section maximization
% Inputs: func = function handle to be maximized
%         x1 = lower bracket
%         x3 = uppper bracket
%         tol = tolerance for estimated error
% Outputs: x2 = x value of the minimum
%          fx2 = y value of the minimum
%
%  x1   x4  x2     x3 
%  ordering of the points 

%Guess value for x2.
 x2 = (x1 + x3)/2; 

%Set x4old, rAE to use for relative approximate error.
x4old = 1;
rAE = 0;
 
%Create iteration variable to keep track of iterations.
iter = 0;

%Start the While Loop.
while 1
   
     %Iteration count.
     iter = iter + 1;
       
     %Calculate x4
     x4 = x2 -(0.5)*(((((x2-x1)^2)*(func(x2)-func(x3)))-(((x2-x3)^2)*(func(x2)-func(x1))))/(((x2-x1)*(func(x2)-func(x3))-((x2-x3)*(func(x2)-func(x1)))))); 
     
     %compare x4 and x2.
     temp = 0;
     if(x4 > x2) %If x4 is bigger than x2, switch the labels.
        temp = x4;
        x4 = x2;
        x2 = temp;
     end
     
     %Check if x4 meets tolerance levels.
     rAE = abs((x4 - x4old)/x4);
     if(rAE < tol)
       %  disp("The solutions was met within the tolerance level at iteration: " + iter);
         break; %If it does, break out of while loop.
     end
     
     %Set x4old to x4.
     x4old = x4;    
     
     %Make comparisons between x2 and x4.
     if (func(x2) < func(x4))
         x1 = x4;
     elseif(func(x4) < func(x2))
         x3 = x2;
         x2 = x4;        
     end
     
     %disp("This is the rAE: " + rAE + " at iteration: " + iter);
     
end

xmin = x4;
fxmin = func(x4);
%disp("FINAL ANSWER... Iteration: " + iter + " xmin: " + xmin + " and rAE: " + rAE);
 
 
 
 
 
 
