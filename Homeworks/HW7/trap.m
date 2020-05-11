function [I] = trap(a,b, n)

%   INPUT: 
% a: Lower bound
% b: Upper Bound

%   OUTPUT:
% I: value of integral

func = @(x) (((1.941-24.36*x)^2) /((2.92)*(0.02407-x)*(0.01605-x))); %Declaring Function

h = (b-a)/n;
s = 0.5*(func(a) + func(b));

for i = 1:n-1
   s = s + func(a + i*h);
end


I = h*s;

end

