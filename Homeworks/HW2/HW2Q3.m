%This script finds the amount of terms needed to approximate the function at differing step sizes.

%%
%This is for TaylorSeriesCos0
tol = 10^-6; %Create a variable for tolerance.

stepsPi0 = [0.1,0.2,0.8]; %Create a vector to vary step sizes.
stepCountsPi0 = [0,0,0]; %Create a veector to store final answers.
counterPi0 = 1; %Create a counter keep track of term size.

for i = 1:3  %Create a for loop to iterate the steps0 vector.
    [TS, rE, rAE] = TaylorCos0(stepsPi0(i),counterPi0); %Get the outputs out of the function.
    while rE > (tol) %If rE doesnt meet tolerance requirements... 
        counterPi0= counterPi0 + 1; %Increment counter...
        [TS, rE, rAE] = TaylorCos0(stepsPi0(i),counterPi0); %Solve another iteration..
    end
    stepCountsPi0(i) = counterPi0; %Store the answer in the first spot of the vector.
    counterPi0 = 1; %Reset the counter.
end
%%
%This is for TaylorSeriesCosPi/4
stepsPi4 = [0.1,0.2,0.8]; %Create a vector to vary step sizes.
stepCountsPi4 = [0,0,0];%Create a veector to store final answers.
counterPi4 = 1;%Create a counter keep track of term size.

for i = 1:3 %Create a for loop to iterate the steps0 vector.
    [TS, rE, rAE] = TaylorCos0(stepsPi4(i),counterPi4);%Get the outputs out of the functino.
    while rE > (10^(-6))%If rE doesnt meet tolerance requirements... 
        counterPi4 = counterPi4 + 1;%Increment counter...
        [TS, rE, rAE] = TaylorCosPi4(stepsPi4(i),counterPi4); %Solve another iteration..
    end
    stepCountsPi4(i) = counterPi4;%Store the answer in the first spot of the vector.
    counterPi4 = 1; %Reset the counter.
end
