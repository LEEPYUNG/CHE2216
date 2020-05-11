function [yy] = quadraticInterpolate(xx,x1,x2,x3,y1,y2,y3)
%Calculuate f(xx) with linear interpolation
%   INPUT: 
% xx: x value of unknown
% x1: x of point 1
% x2: x of point 2
% x3: x of point 3
% y1: y of point 1
% y2: y of point 2
% y3: y of point 3
%   OUTPUT:
% yy: y value of unknown

%Solve for b1 b2 b3.

b1 = y1; 
b2 = (y2-y1)/(x2-x1);
b3 = (((y3-y2)/(x3-x2))-((y2-y1)/(x2-x1)))  /(x3-x1);

yy= b1 + (b2*(xx-x1)) + (b3*(xx-x1)*(xx-x2)); %From Textbook.
end

