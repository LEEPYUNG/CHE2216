function [I] = simp3Multiple(a,b,n)
%Calculuate value of integral with simp3
%   INPUT: 
% a: Lower bound
% b: Upper Bound
% n: how many steps
%   OUTPUT:
% I: value of integral

func = @(x) 1 + cos(x); %Declaring Function
h = (b-a)/(n); %stepsize
s = func(a) + func(b);

for i = 1:2:n-1  %For the middle term
     s = s + 4*func(a + i*h);
end
for i = 2:2:n-2  %For the third term
    s = s + 2*func(a+i*h);
end

I = h/3 * s; %Solve for I

end

