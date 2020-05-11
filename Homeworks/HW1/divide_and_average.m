function [x_new] = divide_and_average(a,x_curr, limit)
%This function is a babylonian method to compute sqaure roots.
%Input:
%   a: The number you want to square root.
%   x_curr: the current guess for the square root.
%   x_limit: The limit- how close we want the answer to be to the real
%   answer.
%Output:
%   x_new: The square root answer for the input.

%Set the initial guess to the x_current. This will be used to calculate the
%x_new in the next line. 
 x_current = x_curr;
 x_new = (x_current + (a/x_current))/2;

 %A while loop to check if the answer is in the range of the limit given as
 %input. If x_new error percentage is less than the limit, that is the
 %answer. if not, calculate x_new again using x_new as the x_current in the
 %formula.
while 1
   if abs((x_new-x_current)/x_new)< limit
       break
   end 
   x_current = x_new;
   x_new = (x_current + (a/x_current))/2;
end

%Display the answer.
disp("The square root of: " + a + " is: " + x_new);
