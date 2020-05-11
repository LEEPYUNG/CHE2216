function [I] = SimpThird(a,b,f1,f2,f3)
%Calculuate value of integralwith simp1/3
%   INPUT: 
% a: Lower bound
% b: Upper Bound
% f1: Y of first point
% f2: Y of second point
% f3: Y of third point
%   OUTPUT:
% I: value of integral

h = (b-a)/2;
I = (h/3)*((f1)+(4*(f2))+(f3));

end

