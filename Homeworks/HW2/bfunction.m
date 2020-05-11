function [ans] = bfunction(x)
%This function finds a y value given an input x. Solves question 6.
%Input:
%   x: The number you want to plug in into the equation/
%output:
%   ans: The output, y value given input x.

%Sets the constant for the equation.
A = (1.21 * 10^1);
B = (2.82 * 10^-1);
C = (-1.77 * 10^-4);
D = (5.56 * 10^-8);
E = (-6.35 * 10^-12);

ans = A + B*x + (C*(x^2)) + (D*(x^3)) + (E*(x^4)); %Solves the equation.
end

