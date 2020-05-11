function [yy] = InterpolatingPolynomial3(xx,x1,x2,x3,x4,y1,y2,y3,y4)
%Calculuate f(xx) with linear interpolation
%   INPUT: 
% xx: x value of unknown
% x1: x of point 1
% x2: x of point 2
% x3: x of point 3
% x4: x of point 4
% y1: y of point 1
% y2: y of point 2
% y3: y of point 3
% y4: y of point 4
%   OUTPUT:
% yy: y value of unknown

%Solve for b1 b2 b3, b4.
first = [((y2-y1)/(x2-x1)); ((y3-y2)/(x3-x2)); ((y4-y3)/(x4-x3))]; %Making First differences vector
second = [((first(2,1)-first(1,1))/(x3-x1));((first(3,1)-first(2,1))/(x4-x2))]; %Second Differences vector
third = (second(2,1)-second(1,1))/(x4-x1);   %Third Differences Vector

b1 = y1;
b2 = first(1,1);
b3 = second(1,1);
b4 = third(1,1);


disp(b1 + " " + b2 + " " +b3 + " " +b4 + " ");

yy= b1 + (b2*(xx-x1)) + (b3*(xx-x1)*(xx-x2)) + (b4*(xx-x1)*(xx-x2)*(xx-x3)) ; %From Textbook.
end

