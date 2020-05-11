%%
%This script approximates the root with falseposition function file. We
%will test with false approximation and fZero.

%This section is falsePosition.

ansFP = [0,0,0]; %Creates a vector to store the roots of the func
%Inputs a function file "afunction" that implements the equation given in
%the homework PDF.

ansFP(1) = falseposition(@afunction,10^(-7),-2,-1); %Solves the first root.
ansFP(2) = falseposition(@afunction,10^(-7),-1,1); %Solves the second root.
ansFP(3) = falseposition(@afunction,10^(-7),1,4); %Solves the third root.

%All answers are stored in ansFP.

%%
%This approximates the root with fZero. 

ansFZ = [0,0,0]; %Creates a vector to store the roots of the func

%Creates three vectors to store the bounds for the three roots.
x1 = [-2,-1];
x2 = [-1,1];
x3 = [1,4];

%Inputs a function file "afunction" that implements the equation given in
%the homework PDF.
ansFZ(1) = fzero(@afunction,x1);
ansFZ(2) = fzero(@afunction,x2);
ansFZ(3) = fzero(@afunction,x3);

%All answers are stored in ansFZ.
%%