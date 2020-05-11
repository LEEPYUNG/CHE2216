%% HW7Q5

%y' = [A]y + g
%y = [CA1 CB1 CA2 CB2]T

A = [-.25 0 0 0; 0.15 -0.1 0 0; (1/3) 0 -((1/3)+ .14) 0; 0 (1/3) 0.14 (-1/3)];
g = [0.04; 0; 0; 0];

[EVectors,Evalues] = eig(A); %get eigen values and vectors

%We want 
%y(t) = C[EigenVectors]e^(eigenValues*t) + xp

%Xp
Xp = -inv(A) * g;

%Finding C values
initial = [0.4; 0; 0; 0];
C = EVectors\(initial - Xp);

%Creating individual EigenVectors
EVector1 = [0;0;0;1];
EVector2 = [0;0.5735;0;0.8192];
EVector3 = [0;0;0.7071;-0.7071];
EVector4 = [0.3936;-0.3936;0.5874;-0.5874];

%Creating individual Equations for Each Concentration
CA1 = @(t) (C(1,1)*EVector1(1,1)*exp(t*Evalues(1,1)))+(C(2,1)*EVector2(1,1)*exp(t*Evalues(2,2))) + (C(3,1)*EVector3(1,1)*exp(t*Evalues(3,3))) + (C(4,1)*EVector4(1,1)*exp(t*Evalues(4,4))) + (Xp(1,1)); 
CA2 = @(t) (C(1,1)*EVector1(2,1)*exp(t*Evalues(1,1)))+(C(2,1)*EVector2(2,1)*exp(t*Evalues(2,2))) + (C(3,1)*EVector3(2,1)*exp(t*Evalues(3,3))) + (C(4,1)*EVector4(2,1)*exp(t*Evalues(4,4))) + (Xp(2,1)); 
CA3 = @(t) (C(1,1)*EVector1(3,1)*exp(t*Evalues(1,1)))+(C(2,1)*EVector2(3,1)*exp(t*Evalues(2,2))) + (C(3,1)*EVector3(3,1)*exp(t*Evalues(3,3))) + (C(4,1)*EVector4(3,1)*exp(t*Evalues(4,4))) + (Xp(3,1)); 
CA4 = @(t) (C(1,1)*EVector1(4,1)*exp(t*Evalues(1,1)))+(C(2,1)*EVector2(4,1)*exp(t*Evalues(2,2))) + (C(3,1)*EVector3(4,1)*exp(t*Evalues(3,3))) + (C(4,1)*EVector4(4,1)*exp(t*Evalues(4,4))) + (Xp(4,1)); 

%Plot
time   = [0:50];
ansCA1 = [0:50];
ansCA2 = [0:50];
ansCA3 = [0:50];
ansCA4 = [0:50];

for i = 1:51
   ansCa1(i) = CA1(i);
   ansCa2(i) = CA2(i);
   ansCa3(i) = CA3(i);
   ansCa4(i) = CA4(i);
end

hold on
plot(time,ansCa1);
plot(time,ansCa2);
plot(time,ansCa3);
plot(time,ansCa4);

legend({'CA1','CB1','CA2','CB2'});














