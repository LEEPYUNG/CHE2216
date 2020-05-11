%Homework5 Question 2

%% Part A
f = @(x,y,z) (4*x) - (4*y) + (x^3) - (x^8) + (2*x*y) - (3*y^2) - (2 * z^2) - (z * x^2); %The function
initialGuess = [2;1;0]; %The initial Guess
disp("The points (x,y,z) respectively are: ");

tic
[finalValues, eigenValues] = MultiNewtonMax(initialGuess);
toc

disp(finalValues);
disp("The value of f at this point is: ");
disp(f((finalValues(1,1)),(finalValues(2,1)),(finalValues(3,1))));
disp("The eigenvalues of the Hessian is: ");
disp(eigenValues);
disp("Since all the eigenvalues are negative, this is a maximum.");

%% Part B

x = [0.9733 -0.3422 -0.2368];
f = @(x) (-1)*((4*(x(1))) - (4*x(2)) + (x(1)^3) - (x(1)^8) + (2*x(1)*x(2)) - (3*(x(2))^2) - (2 * x(3)^2) - (x(3) * x(1)^2)); 
initialGuess1 = [2, 1, 0];
disp("This is value with fminsearch: ");
options = optimset('MaxFunEval',2000,'tolx', 10^-8, 'Disp', 'iter');

tic
disp(fminsearch(f,initialGuess1,options));
toc

%% Part C

% Overall, Newton raphson takes less iterations and less time as compared 
% the built in fminsearch. However, the time it takes per iteration, fminsearch 
% is better. It takes less time per iteration of fminsearch
% than it is per iteration of newtonRaphson.

