count = linspace(0.4, 0.99, 50);
root = zeros(1,50);

for i = 1:50
   func = (plugflow_function(count(i))); 
   root(i) = bisection(func,0.0001,40,10^(-6),100);
end

plot(count,root);
xlim([.5,1]);
xlabel("Value for Xa");
ylabel("Recycle Rate R");
title("Plot of Value for Xa vs Recycle Rate R");