%Answer should be 676,416,064.

%%
%(a) Write a loop which uses a variable that starts at zero, and adds successive odd numbers
%to this variable with each iteration. 

%creates a variable called sum1- where all the odd integers will be added.
%Also creates a variable called count1 to count how many odd numbers were
%looped through.
sum1 = 0;
count1 = 0;

%Creates a loop that iterates from 1 to 52015. If number is not even, add
%that number to sum1. 
for i = 1:52015
    if mod(i,2) ~= 0
        sum1 = sum1 + i;
        count1 = count1 +1;
    end
end

%Displays sum1.
disp("This is sum1: " + sum1);

%%

%(b) Create an array through the linspace function or the colon operator and sum this array
%using built-in Matlab functions

%creates a variable called sum1- where all the odd integers will be added
%Also creates a variable called count2 to count how many odd numbers were
%looped through.
sum2 = 0;
count2 = 0;

%Creates a 1x52015 array, numbers ranging from 1-52015 evenly spaced out in
%it.
arr = linspace(1,52015,52015);

%Creates a loop that iterates from the entire length of arr. If that particular index of arr is not even, add
%that number to sum2. 
for i = 1:length(arr)
    if mod(i,2) ~= 0
        sum2 = sum2 + i;
        count2 = count2 +1;
    end
end

%Displays sum2.
disp("This is sum2: " + sum2);

%%
%(c) Check the results from (a) and (b) using the formula:
%i.e., that the sum of all odd integers from 1 to n is [(n+1)/2]2 (if n is odd). Include this
%check in your Matlab script.
%There should be a total of 26008 odd numbers between 1 - 52015. According
%to the equation given, the sum of all odd numbers should be 26008 squared.

if(count1 == 26008 &&  count2 == 26008)
    if(count1^2 == sum1 && count2^2 == sum2)
        disp("The sums are correct.");
    else
        disp("The sums were not added up correctly.");
    end
end



