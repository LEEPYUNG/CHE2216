%% HW6Q2
% Estimate J1 (2.1) using third- and fourth-order interpolating
% polynomials. Determine the percent relative error for each
% case based on the true value, which can be determined with
% MATLAB’s built-in function besselj.
%
% 1.8      2      2.2    2.4    2.6
% 0.5815 0.5767 0.5560 0.5202 0.4708

format long
%% Third Order
disp("THIS IS FOR ORDER 3");
ans3 = InterpolatingPolynomial3(2.1,1.8,2,2.2,2.4,0.5815,0.5767,0.5560,0.5202); 
realAns3 = besselj(1,2.1);
error3 = abs((ans3 - realAns3)/(ans3));

disp("This is the value from interpolation: ");
disp(ans3);
disp("This is the real value: ");
disp(realAns3);
disp("This is the error: ");
disp(error3 * 100 + "%");

%% Fourth Order
fprintf('\n');
disp("THIS IS FOR ORDER 4");
ans4 = InterpolatingPolynomial4(2.1, 1.8, 2.0, 2.2, 2.4, 2.6, 0.5815, 0.5767, 0.5560, 0.5202, 0.4708); 
realAns4 = besselj(1,2.1);
error4 = abs((ans4 - realAns4)/(ans4));

disp("This is the value from interpolation: ");
disp(ans4);
disp("This is the real value: ");
disp(realAns4);
disp("This is the error: ");
disp(error4 * 100 + "%");