function [yy] = linearInterpolate(xx,x1,x2,y1,y2)
%Calculuate f(xx) with linear interpolation
%   INPUT: 
% xx: x value of unknown
% x1: x of point 1
% x2: x of point 2
% y1: y of point 1
% y2: y of point 2
%   OUTPUT:
% yy: y value of unknown
yy = y1 + ((y2-y1)/(x2-x1))*(xx-x1); %From Textbook
end

