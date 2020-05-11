function [I] = trapMultiple(a,b,n)
%Calculuate value of integral with trap
%   INPUT: 
% a: Lower bound
% b: Upper Bound
% n: how many steps
%   OUTPUT:
% I: value of integral

func = @(x) 1 + cos(x); %Declaring Function
h = (b-a)/n; %stepsize
s = 0.5 * (func(a) + func(b));

for i = 1:n-1 
     s = s + func(a + i*h); %Make Summatino
end
       I = h * s;  %Solve for I

end

