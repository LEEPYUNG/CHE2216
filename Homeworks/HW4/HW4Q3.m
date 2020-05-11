%HW4Q3
format long;

%%
%K = 4 with 5 Stages.
%Making Constants
yin = -0.1;
xin = 0;
F2 = 1000;
F1 = 500;
K = 4;
steps = 5;

%Pre-Allocating Arrays for A, b, and setting the first instance of b to yin. 
A = zeros(steps,steps);
b = zeros(steps,1);
b(1,1) = yin;

%Iterating through each row and filling in spots.
for i = 1: steps %Iterating through rows.
    count = i;   %Make count = i to iterate through each spots.
    
    %CONDITION 1: First Step
    if( i == 1) 
        A(i, count) =  -1 * (1+2*K);
        A(i, count + 1) = 2*K;
       
    %CONDITION 2: Last Step
    elseif ( i == steps)
        A(i, count-1) = 1;
        A(i, count) = -1 * (1+2*K);
    
    %CONDUTION 3: Intermediate Step
    else
        count = count-1;
        A(i,count) = 1;
        A(i,count + 1) = -1 * (1+2*K); 
        A(i , count + 2) = 2*K; 
    end          
end

%aug = [arr bArr]; %Make augmented matrix with arr and bArr
[L,U] = lumine(A);
Yout1 = lusolve(L, U, b); %Solving for the y out values.
[rowSize1,columnSize] = size(Yout1);
Xout1 = zeros( rowSize1, columnSize); %Create an Xout array for the x values.

for i = 1:size(Xout1)
    Xout1(i,1) = K*Yout1(i,1);
end




%%
%K = 0.7 with 50 Stages.
%Making Constants
yin = -0.1;
xin = 0;
F2 = 1000;
F1 = 500;
K = 0.7;
steps = 40;

%Pre-Allocating Arrays for A, b, and setting the first instance of b to yin. 
A = zeros(steps,steps);
b = zeros(steps,1);
b(1,1) = yin;

%Iterating through each row and filling in spots.
for i = 1: steps %Iterating through rows.
    count = i;   %Make count = i to iterate through each spots.
    
    %CONDITION 1: First Step
    if( i == 1) 
        A(i, count) =  -1 * (1+2*K);
        A(i, count + 1) = 2*K;
       
    %CONDITION 2: Last Step
    elseif ( i == steps)
        A(i, count-1) = 1;
        A(i, count) = -1 * (1+2*K);
    
    %CONDUTION 3: Intermediate Step
    else
        count = count-1;
        A(i,count) = 1;
        A(i,count + 1) = -1 * (1+2*K); 
        A(i , count + 2) = 2*K; 
    end          
end

%aug = [arr bArr]; %Make augmented matrix with arr and bArr
[L,U] = lumine(A);
Yout2 = lusolve(L, U, b); %Solving for the y out values.
[rowSize2,columnSize] = size(Yout2);
Xout2 = zeros( rowSize2, columnSize); %Create an Xout array for the x values.

for i = 1:size(Xout2)
    Xout2(i,1) = K*Yout2(i,1);
end


%%

%Return final Yout value and Xout Value.
disp("The final Yout for K=4 with 5 stages is: ");
disp(Yout1(rowSize1,1));
disp("The final Xout or K=4 with 5 stages is: ");
disp(Xout1(1,1));

%Return final Yout value and Xout Value.
disp("The final Yout for K=0.7 with 40 stages is: ");
disp(Yout2(rowSize2,1));
disp("The final Xout for K=0.7 with 40 stages is: ");
disp(Xout2(1,1));





    
