%This file is to test the outputs of the divide_and_average function.
%Tested three inputs and all outputs were expected and compared to the
%built in sqrt function.
divide_and_average(16,5,(10^-6));
divide_and_average(61,10,(10^-6));
divide_and_average(2015,10,(10^-6));

disp(sqrt(16));
disp(sqrt(61));
disp(sqrt(2015));