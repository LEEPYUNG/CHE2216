function [TS,rE,rAE] = TaylorCos0(x,n)
%This is a function that claculates the Taylor series with function 2cos(4x)
%around value 0.
%Input:
%   x: the step for the taylor series.
%   n: a number representing terms.
%Output:
%   TS: The resulting taylor series.

    newTS = 0; %Setting Taylor Series Sum to 0 first.
    approximationOld = 0;
    
for i = 0:n-1
    TSnext = (((-1)^(i))*(x^(2*i))*(2^((4*i)+1)))/factorial(2*i); %Solve for the next term.
    approximationOld = newTS;
    newTS = newTS + TSnext; %Concatenate the next term to TS. 
end


%Display the total taylor series.
TS = newTS; 
disp(TS);

%%
%Calculating Relative error
trueAns = 2*cos(4*x); %Calculate trueAnswer with function.
rE =  abs((TS-trueAns)/trueAns); %Calculate by using TS found above.

%%
%Calculatoring Approximate Relative error
rAE = abs((newTS - approximationOld)/newTS);

%%