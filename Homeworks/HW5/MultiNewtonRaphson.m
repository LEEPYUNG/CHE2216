function [xVector] = MultiNewtonRaphson(initialGuess)
%This MultiNewtonRaphson is modified to solve Q1.
%INPUT
%initialGuess: The initial guess of function, a column vector. 
%
%OUTPUT:
%xVector: the roots we want to find.

%disp(initialGuess);

B = -0.5;
y = 4;
tol = 10^-6;

f = @(V, W) V - ((V^3)/3) - W; 
g = @(V, W) V + B - (y*W); 

df1 = @(V) 1-(V^2);
df2 = -1;
dg1 = 1;
dg2 = -y;

Jacobian = @(x)[df1(x) df2 ; dg1, dg2]; %Jacobian anonymous function

iter = 1;
while(1)
fOut = [f(initialGuess(1,1),initialGuess(2,1)) ; g(initialGuess(1,1),initialGuess(2,1))]; %Solving for f vector.
J = Jacobian(initialGuess(1,1)); %Solving for Jacobian.
fx = J\fOut; %Solving for Jacobian inverse * functionOutput.
    
xVector = initialGuess - (fx); %Solving vector with newton raphsons.
% disp("At iter: " + iter + " the vector is: ");
% disp(xVector);

[ansX] = xVector; %Checking for tolerance.
error = norm(Jacobian(ansX(1,1))\fOut);

if(error < tol)
    disp("Tolerance for both variables met.");
    break;
else
    initialGuess = xVector;
end
iter = iter + 1;

end



end


