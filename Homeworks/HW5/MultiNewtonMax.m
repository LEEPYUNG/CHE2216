function [ansVector, eigenValues] = MultiNewtonMax(initialGuess)
%This MultiNewtonMax is modified to solve Q2.
%INPUT
%initialGuess: The initial guess of function, a column vector 3x1. 
%
%OUTPUT:
%ansVector: the values we want to find.

tol = 10^-8;
f = @(x,y,z) (4*x) - (4*y) + (x^3) - (x^8) + (2*x*y) - (3*y^2) - (2 * z^2) - (z * x^2);
%initialGuess = [2;1;0];

%calculate Gradient
gradient =@(x,y,z) [4+(3*x^2)-(8*x^7) + (2*y) - (2*x*z);(-4) + (2*x) - (6*y); (-4*z) - (x^2)];

%calculate Hessian
Hessian =@(x,y,z) [(6*x)+(-56*x^6)+(-2*z),2,-2*x ;2,-6,0 ;(-2*x),0,-4];


iter = 1;
while(1)
G = gradient(initialGuess(1,1), initialGuess(2,1), initialGuess(3,1)); %Solving for gradient
H = Hessian(initialGuess(1,1), initialGuess(2,1), initialGuess(3,1)); %Solving for hessian.
fx = H\G; %Solving for hessian inverse * gradientOutput.
    
ansVector = initialGuess - (fx); %Solving vector with newton raphsons.
% disp("At iter: " + iter + " the vector is: ");
% disp(ansVector);

[ansX] = ansVector; %Checking for tolerance.
error = norm(Hessian(ansX(1,1), ansX(2,1), ansX(3,1))\G);

if(error < tol)
    %disp("Tolerance for both variables met.");
    break;
else
    initialGuess = ansVector;
end
iter = iter + 1;

end

%Prove Maximum 
eigenValues = eig(H); %solving eigenvalues
