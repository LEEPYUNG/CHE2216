%HW8Q2
%% NUMERICAL SOLUTION
%Parameters 
D = 5000; %Dispersion Coefficient 
Cin = 100; %Concertration in
U = 100; % m/hr
k = 2; %2/hr
L = 100; %m
deltaX = 10; %m

%Constants for Matrix
m3 = (D/(deltaX)^2)-(U/(2*deltaX));
m2 = ((-2*D)/(deltaX)^2)-(k);
m1 = (D/(deltaX^2))+(U/(2*deltaX));

%Boundary Constants
b1 = (D/(2*deltaX));
b2 = U;
b3 = -D/(2*deltaX);     

d1 = -1/(2*deltaX);
d2 = 1/(2*deltaX);

%X = [C-1 C0 C1 C2 C3 C4 C5 C6 C7 C8 C9 C10 C11]';
b = [U*Cin; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0];

%Plotting matrix A
%    C-1   C0    C1    C2    C3    C4    C5    C6    C7    C8      C9      C10    C11
A = [b1    b2    b3    0     0     0     0     0     0     0       0       0      0   ;  %-1
     m1    m2    m3    0     0     0     0     0     0     0       0       0      0   ;  %0
     0     m1    m2    m3    0     0     0     0     0     0       0       0      0   ;  %1
     0     0     m1    m2    m3    0     0     0     0     0       0       0      0   ;  %2
     0     0     0     m1    m2    m3    0     0     0     0       0       0      0   ;  %3
     0     0     0     0     m1    m2    m3    0     0     0       0       0      0   ;  %4
     0     0     0     0     0     m1    m2    m3    0     0       0       0      0   ;  %5
     0     0     0     0     0     0     m1    m2    m3    0       0       0      0   ;  %6
     0     0     0     0     0     0     0     m1    m2    m3      0       0      0   ;  %7
     0     0     0     0     0     0     0     0     m1    m2      m3      0      0   ;  %8
     0     0     0     0     0     0     0     0     0     m1      m2      m3     0   ;  %9
     0     0     0     0     0     0     0     0     0     0       m1      m2     m3  ;  %10
     0     0     0     0     0     0     0     0     0     0       d1      0      d2  ]; %11
 
C = A\b; %Left Division
distance = (0:10:100)'; %Distance Matrix    
Cplot = C(2:12);  %Using only data from 0-110

figure(1)
plot(distance,Cplot);
title('plotHW8Q2a: Numerical Graph');
xlabel('x');
ylabel('Concentration');
%% ANALYTICAL
lamb1=U/2/D*(1+sqrt(1+(4*k*D)/U^2)); %Lambda 1
lamb2=U/2/D*(1-sqrt(1+(4*k*D)/U^2)); %Lambda 2

%Function for Analtical Values
cFunction =@(x)(U*Cin)/((U-D*lamb1)*lamb2*exp(lamb2*L)-(U-D*lamb2)*lamb1*exp(lamb1*L))*(lamb2*exp(lamb2*L+lamb1*x)-lamb1*exp(lamb1*L+lamb2*x));

%Allocating Arrays
analyticalC = zeros(10,1)';
analyticalC = analyticalC';

%Collecting Values
analyticalC(1) = cFunction(0);
for i = 2:11
    analyticalC(i) = cFunction((i-1)*10);
end

figure(2);
plot(distance,analyticalC);
title('plotHW8Q2b: Analytical Graph');
xlabel('x');
ylabel('Concentration');
