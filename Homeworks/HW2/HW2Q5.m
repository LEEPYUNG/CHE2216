%%
%false positionMod
%This script solves question 5 on the homework. This finds the x alue where
%the y value is 69.

ansFP = [0]; %Preallocates an 1x1 matrix to hold the final answer.

ansFP(1) = falsepositionMod(@bfunction,10^(-5),200,1200,69); %Solves.
