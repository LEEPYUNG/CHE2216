%Compares the parabolic minimum function and the fminbnd built in function.
%Tests in two differing situations- varying alpha and varying width2.

%Varying alpha in equation.
Lmax = [1:1:120]; %Creates an array to keep track of answers for parabolic.
Lmax2 = [1:1:120]; %Creates an arrya to keep track of answers for fminbnd.
count = 1; %Counter for putting answers in Lmax/Lmax2.

w1 = 200; %Constant for equation.
w2 = 200; %Constant for equation.

for i = 30:150 %For loop from 30-150 for varying alpha.
    
   a = deg2rad(i); %Change alpha to radians.
   func= @(theta) w1/sin(theta) + w2/(sin(pi -(a)-theta)); %Function given from homework PDF, plug in a.
   
   [theta,L] =  parabolic_fun(func, 0.1 , pi-a-.01, 10^(-6));   %Call function and store outputs.
   Lmax(count) = L; %Store answer in Lmax.
   
   [theta2, L2] = fminbnd(func,0,pi-a-0.1); %Call function and store outputs
   Lmax2(count) = L2; %Store answer in Lmax2.

   count = count + 1; %Increment count.
end

%Create two plots on top of each other.
figure(1) %Figure 1 reserved for plots varying alpha.
plot(30:150, Lmax);
hold on
plot(30:150, Lmax2);
legend('parabolic', 'fminb');
title("Maximum L for varying Alphas");
xlabel("Alpha");
ylabel("Length");

%%
Lmax3 = [10:1:500]; %Creates an array to keep track of answers for parabolic.
Lmax4 = [10:1:500]; %Creates an arrya to keep track of answers for fminbnd.
count = 1; %Counter for putting answers in Lmax/Lmax2.

w1 = 200; %Constant for equation.

%For loop from 10-500 for varying width2.
for i = 10:500
   a = deg2rad(45); %Change alpha to radians.
   w2 = i;          %Set w2 to i, to vary w2 from 10-500
   
   func= @(theta) w1/sin(theta) + w2/(sin(pi-(a)-theta)); %Function given from homework PDF, plug in w2.
   
   [theta,L] =  parabolic_fun(func, 0.1 , pi-a-0.1, 10^(-6));  %Call function store answers.
   Lmax3(count) = L;  %Store answers to Lmax3.
   
   [theta2, L2] = fminbnd(func,0,pi-a-0.1); %Call function store answers.
   Lmax4(count) = L2; %Store answers to Lmax4.

   count = count + 1;   %Increment Count
end

%Create plot, figure 2 for second scenerio.
figure(2)
title("Maximum L for varying Widths");
plot(10:500, Lmax3);
hold on
plot(10:500, Lmax4);
title("Maximum L for varying Alphas");
legend('parabolic', 'fminb');
xlabel("Width2");
ylabel("Length");

