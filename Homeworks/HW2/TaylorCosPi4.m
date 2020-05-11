function [TS,rE,rAE] = TaylorCosPi4(x,n)
%This is a function that claculates the Taylor series with function 2cos(4x) around pi/4.
%Input:
%   x: the step for the taylor series.
%   n: a number representing terms.
%Output:
%   TS: The resulting taylor series.
    newTS = 0;
    approximationOld = 0;
    
for i = 0:n-1
    TSnext = (((-1)^(i+1))*(2^(4*i+1))*((x-(pi/4)).^(2*i)))/factorial(2*i); %Solve for next term.
   
    approximationOld = newTS;
    newTS = newTS + TSnext; %Concatenate the term to the TS.
end

%total taylor series
TS = newTS


%%
%Calculating Relative error
trueAns = 2*cos(4*x); %Calculate trueAnswer with function.
rE =  abs((TS-trueAns)/trueAns); %Calculate by using TS found above.

%%
%Calculatoring Approximate Relative error
rAE = abs((TS - approximationOld)/TS);

%%