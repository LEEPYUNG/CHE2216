%Homework5 Question 1

%% Part A
%FitzHugh-Nagumo Equations
%dV/dt = V - (V^3)/3 -W
%dW/dt = V + B - yW
%V = membrane potentional of neuron, W = linear relaxation of membrane.
%Setting to steady state, the equations become
% V - (V^3)/3 - W = f(x)
% V + B - yW      = g(x)

%From plotting, there are three roots 
% (1) (-1.408, -0.477)
% (2) (-0.169,-0.167)
% (3) (1.577, 0.269)

%Defining equations + derivatives

%Root1
initialGuess1 = [-1.3; -0.4];
realAns1 = [-1.4085; -0.4771];
ansVector1 = MultiNewtonRaphson(initialGuess1);
disp("This is the first root with Newton: ");
disp(ansVector1);

%Root2
initialGuess2 = [-0.1; -0.1];
realAns2 = [-0.169; -0.167];
ansVector2 = MultiNewtonRaphson(initialGuess2);
disp("This is the second root with Newton: ");
disp(ansVector2);

%Root3
initialGuess3 = [1.5; 03];
realAns3 = [1.577; 0.269];
ansVector3 = MultiNewtonRaphson(initialGuess3);
disp("This is the third root with Newton: ");
disp(ansVector3);

%% Part B
B = -0.5;
y = 4;

%Root1
x = [-1.4085 -0.4771];
costFunction = @(x) (((x(1) - ((x(1)^3)/3) - x(2))^2)+((x(1) + B - (y*x(2)))^2)); 
initialGuess1 = [-1.3, -0.4];
disp("This is first root with fminsearch: ");
disp(fminsearch(costFunction, initialGuess1));

%Root2
x = [-0.169 -0.167];
costFunction = @(x) (((x(1) - ((x(1)^3)/3) - x(2))^2)+((x(1) + B - (y*x(2)))^2)); 
initialGuess1 = [-0.1 -0.1];
disp("This is second root with fminsearch: ");
disp(fminsearch(costFunction, initialGuess1));

%Root3
x = [1.577 0.269];
costFunction = @(x) (((x(1) - ((x(1)^3)/3) - x(2))^2)+((x(1) + B - (y*x(2)))^2)); 
initialGuess1 = [1.5 03];
disp("This is third root with fminsearch: ");
disp(fminsearch(costFunction, initialGuess1));
