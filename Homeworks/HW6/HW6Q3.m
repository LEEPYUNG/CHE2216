%% HW6Q3
%Compute g at y = 55000.
%
% 0      30000      60000    90000    120000
% 9.8100 9.7487     9.6879   9.6278   9.5682
 


%% Fourth Order SINCE 5 points, use fourth order
fprintf('\n');
ans4 = InterpolatingPolynomial4(55000, 0,30000,60000,90000,120000,9.8100,9.7487,9.6879,9.6278,6.5682 ); 
realAns4 = 9.63949880456 %Got this value from vcalc.com

error4 = abs((ans4 - realAns4)/(ans4));

%Calculate Error
disp("This is the value from interpolation: ");
disp(ans4);
disp("This is the real value: ");
disp(realAns4);
disp("This is the error: ");
disp(error4 * 100 + "%");