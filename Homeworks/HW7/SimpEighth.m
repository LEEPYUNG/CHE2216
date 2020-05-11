function [I] = SimpEighth(a,b,f1,f2,f3,f4)
%Calculuate value of integralwith simp1/3
%   INPUT: 
% a: Lower bound
% b: Upper Bound
% f1: Y of first point
% f2: Y of second point
% f3: Y of third point
% f4: Y of fourth point
%   OUTPUT:
% I: value of integral

h = (b-a)/3;
I = (3*h/8)*((f1)+(3*(f2))+(3*f3) + (f4));

end

