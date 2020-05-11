%% HW7Q2D

realValue = 89.6205;
tol = 10^-4;
counter = 1;
oldValue = 1;

while 1
trapValue = trap(0,0.012, counter);
error = abs((trapValue - realValue)/realValue);
disp("This is the error: " + error + " at counter: " + counter);
disp("This is the value: " + trapValue + " at counter: " + counter);
fprintf('\n');

if(error < tol)
    break;
end
    oldValue = trapValue;
    counter = counter +1;
end



disp("The value using trap rule: " + trapValue);

