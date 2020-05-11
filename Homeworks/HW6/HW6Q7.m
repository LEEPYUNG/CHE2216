%% HW6Q7

%% PART A
tol = (10)^-5;
func = @(x) 1 + cos(x); %Declaring Function
lowerBound = 0; %LowerBound
upperBound = 3*pi/2; %UpperBound

%Analytical Answer
realValue = integral(func,lowerBound,upperBound); 
disp("This is the analytical value: " + realValue);

%% PART B
%Using multiple iterations of trapezoidal rule
oldAns = 0;
count = 1;
trapValue = 0;

while 1 
   trapValue = trapMultiple(lowerBound,upperBound,count);
   error = abs((trapValue - realValue)/realValue); %Check for error.
   if(error < tol)
       break;
   else
       count = count + 1;
   end
end

disp("The value using trapezoid rule: " + trapValue);
disp("It took " + (count + 1)  + " function calls.");

%% PART C
%Using multiple iterations of 1/3simp rule
oldAns = 0;
count = 1;
SimpValue = 0;

while 1 
   simpValue = simp3Multiple(lowerBound,upperBound,count);
   error = abs((simpValue - realValue)/realValue); %Check for error.
   if(error < tol)
       break;
   else
       count = count + 1;
   end
end

disp("The value using simp rule: " + simpValue);
disp("It took " + (count + 1) + " function calls.");

%% PART D
[Q, quadCount] = quad(func, lowerBound, upperBound, tol); 
disp("The value using quad: " + Q);
disp("It took " + quadCount + " function calls.");
