%HW4Q4
format long;

%%
%deltaX = 1.
%Making Constants
C1 = 80;CN = 20;deltaX = 1;D = 2; U = 1;k = 0.2;

x = linspace(0,10,11);

%Pre-Allocating Arrays for A, b. 
Asize = 11;

A = zeros(Asize,Asize);
b = zeros(Asize,1);
b(1,1) = C1;
b(Asize,1) = CN;

con1 = (D/deltaX^2)+(U/(2*deltaX)); 
con2 = ((-2*D)/(deltaX^2))-(k);
con3 = (D/deltaX^2)-(U/(2*deltaX));

%Iterating through each row and filling in spots.
for i = 1: Asize %Iterating through rows.
    count = i;   %Make count = i to iterate through each spots.
    
    %CONDITION 1: First Step
    if( i == 1) 
        A(i, count) = 1;
       
    %CONDITION 2: Last Step
    elseif ( i == Asize)
        A(i, count) = 1;
         
    %CONDUTION 3: Intermediate Step
    else
        count = count-1;
        A(i,count) = con1;
        A(i,count + 1) = con2; 
        A(i , count + 2) = con3; 
    end          
end

figure (1)
c = A\b;
disp(c);
plot(x,c);
title("Concentration vs Distance");
xlabel("Distance");
ylabel("Concetration");

%%

%deltaX = 0.1
%Making Constants
C1 = 80;
CN = 20;
deltaX = 0.1;
D = 2; 
U = 1;
k = 0.2;

x = linspace(0,10,101);

%Pre-Allocating Arrays for A, b. 
Asize = 101;

A = zeros(Asize,Asize);
b = zeros(Asize,1);
b(1,1) = C1;
b(Asize,1) = CN;

con1 = (D/deltaX^2)+(U/(2*deltaX));
con2 = ((-2*D)/(deltaX^2))-(k);
con3 = (D/deltaX^2)-(U/(2*deltaX));

%Iterating through each row and filling in spots.
for i = 1: Asize %Iterating through rows.
    count = i;   %Make count = i to iterate through each spots.
    
    %CONDITION 1: First Step
    if( i == 1) 
        A(i, count) = 1;
       
    %CONDITION 2: Last Step
    elseif ( i == Asize)
        A(i, count) = 1;
         
    %CONDUTION 3: Intermediate Step
    else
        count = count-1;
        A(i,count) = con1;
        A(i,count + 1) = con2; 
        A(i , count + 2) = con3; 
    end          
end

figure (2)
c = A\b;
disp(c);
plot(x,c);
title("Concentration vs Distance");
xlabel("Distance");
ylabel("Concetration");

fprintf("In the matrix with a step size is 0.1, the approximations are better because the step size is smaller. The graph is more smooth than the lower stepsize graph.");
