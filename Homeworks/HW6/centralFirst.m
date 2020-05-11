function [y] = centralFirst(ya,yb,h)
%Calculuate f'(x) with central lower order
%   INPUT: 
% ya: y before point 1
% yb: y after point 1
% h : step size
%   OUTPUT:
% y: y value of unknown
y = (ya-yb)/(2*h); %From Textbook
end

