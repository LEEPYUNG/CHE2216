function [I] = trap(a,b,f1,f2)
%Calculuate value of integralwith simp1/3
%   INPUT: 
% a: Lower bound
% b: Upper Bound
% f1: Y of first point
% f2: Y of second point
%   OUTPUT:
% I: value of integral

h = (b-a)/2;
I = (h)*(f1+f2);

end

