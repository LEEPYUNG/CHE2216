%% HW7Q6

% PART B
func = @(x) exp(3*x)+(x/3); %Analytical Solution
realAns = func(5);
disp("This is the real value at t=5: " + realAns);
fprintf('\n');

%% deltT = 0.2
y = euler_explicit(5,0.2);
error = abs((realAns-y)/(realAns)) * 100;
disp("The value of y at delta T 0.2: " + y);
disp("The error: " + error + "%");
fprintf('\n');

%% deltT = 0.1

y = euler_explicit(5,0.1);
error = abs((realAns-y)/(realAns)) * 100;
disp("The value of y at delta T 0.1: " + y);
disp("The error: " + error + "%");
fprintf('\n');

%% deltT = 0.05

y = euler_explicit(5,0.05);
error = abs((realAns-y)/(realAns)) * 100;
disp("The value of y at delta T 0.05: " + y);
disp("The error: " + error + "%");
fprintf('\n');

%% deltT = 0.025

y = euler_explicit(5,0.025);
error = abs((realAns-y)/(realAns)) * 100;
disp("The value of y at delta T 0.025: " + y);
disp("The error: " + error + "%");