%HW5Q4
x = [50 80 130 200 250 350 450 550 700];
y = [99 177 202 248 229 219 173 142 72];

[ansP] = fminsearch(@fSSR, [50,50], [], x, y);

disp("The pM is: " + ansP(1));
disp("The iM is: " + ansP(2));