function [root] = MatrixMakerQ5(conv)

%thanks will i love u
A = MatrixMaker(conv);
b = zeros(21,1);
b(1) = 13751; %in mols/hr
x = A\b;

%Recycle Rate
recycleRateE = (x(7)*(98.96)) /453.592; %in lb/hr
recycleRateV = (x(14) * 62.498) / 453.592; %in lb/hr
recycleRate = recycleRateE + recycleRateV; %in lb/hr

root = 7000 - recycleRate; 

end

