%This script plots TAylor Series Approximation around Pi/4 from x = 1 to
%x=2, with varying term sizes.

%%
count = [0:0.01:1]; %Creates an array to keep track of iterations.

%Create arrays to store approximations for  term size of 2,4,and 50.
a1 = [0:0.01:1]; %term size = 2
a2 = [0:0.01:1]; %term size = 4
a3 = [0:0.01:1]; %term size = 50

%%
%Plot the graphs now.
hold on

%Plot all three vectors on top of each other.
plot(a1, TaylorCosPi4(count,2),'LineWidth',2);
plot(a2, TaylorCosPi4(count,4),'LineWidth',2);
plot(a3, TaylorCosPi4(count,50),'LineWidth',2);

hold off 

%Set the titles and labels and legends.
title('Taylor Series Approximations for Varying Term Sizes');
xlabel('Step Size');
ylabel('Approximation Value');
legend('2 Terms','4 Terms','50 Terms');
%%