%% HW8Q3

length = -4:0.01:4;
realFunc = @(x) 2*x;


%% Plotting Fourier Series

hold on 
plot(length, realFunc(length));
plot(length, fourier(1,length));
plot(length, fourier(2,length));
plot(length, fourier(4,length));
plot(length, fourier(100,length));

legend('2x','n = 1','n = 2',' n = 4','n = 100');
xlabel('x');
ylabel('y');
title('plotHW8Q3');













