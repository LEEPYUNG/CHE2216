%dy making function for HW8Q1

function dy = dydxn(x,y)
dy = [y(2);((2*y(2))+y(1)-x(1))/7];
