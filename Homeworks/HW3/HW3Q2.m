%%
%This script approximates the root with NewtonRaph, Modified Secant, and
%FZero.

ansFP = [0,0,0]; %Creates a vector to store the roots of the 3 different methods.
%Inputs a function file "afunction" that implements the equation given in
%the homework PDF.
%tol = 10^-10
%inital guess = 1
%h = 0.01
% 
%Approximates with newtonraph function.
disp("TESTING NEWTON RAPH.");
ansFP(1) = newtonraph(@afunction,@dfunction,1,10^(-10),100); %Solves the first root.



%Approximates with modifiedsecant function.
disp("TESTING MODIFIED SECANT.");
ansFP(2) = modifiedsecant(@afunction,10^(-10),1,0.01);

%Approximates with fzero function.
disp("TESTING FZERO.");
options = optimset('Display', 'iter');
ansFP(3) = fzero(@afunction, 1, options);

%Calculate Approximate Relative Error from fzero answers.
errors = [-0.810193 -0.162917 -0.431421 -0.454536 -0.453149 -0.453157 -0.453157 -0.453157]; %Errors for fzero.
relativeErrors = 1:1:7; %Create an array to hold relative errors.
count = 2; %Create a counter for the while loop.

while(count < 9)
    relativeErrors(count-1) = abs((errors(count)-errors(count-1))/errors(count)); %Calculate relative absolute error.
    count = count + 1;
end

%The comparision of convergenece:
%Newton Raph iterations: 5
%Modified Secant iterations: 7
%Fzero iterations: 8

%The newton raph method had the fastest convergence compared to the
%modified secant and the fzero methods. It took newton raph method 5
%iterations to get to the final answer.

