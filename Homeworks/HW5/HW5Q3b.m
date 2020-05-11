%HW5Q3b 


T = [0 5 10 15 20 25 30 0 5 10 15 20 25 30 0 5 10 15 20 25 30]'; %T vector
c = [zeros(7,1); 10*ones(7,1); 20*ones(7,1)]; %Concentration column vector
Z = [ones(21,1) T c]; %Solving Z matrix
y = [14.6 12.8 11.3 10.1 9.09 8.26 7.56 12.9 11.3 10.1 9.03 8.17 7.46 6.85 11.4 10.3 8.96 8.08 7.35 6.73 6.2]';
a = (Z'*Z)\(Z'*y); %Solving for a

%Sum of squares 
Sr = sum((y-Z*a).^2);
disp("This is the Sr: ");
disp(Sr);

%Calculating R2
R2 = 1-Sr/sum((y-mean(y)).^2);
disp("This is the R2: ");
disp(R2);

%Calcualate Standard Error
syx = sqrt(Sr/(length(T) - length(a)));
disp("This is the syx: ");
disp(syx);

%Uncertainties in parameters
Ztz = inv(Z'*Z);
errorParam1 = syx * sqrt(Ztz(1,1)); 
errorParam2 = syx * sqrt(Ztz(2,2)); 
errorParam3 = syx * sqrt(Ztz(3,3)); 

disp("This is the error in parameter 1: ");
disp(errorParam1);
disp("This is the error in parameter 2: ");
disp(errorParam2);
disp("This is the error in parameter 3: ");
disp(errorParam3);

%Calculating the line 
T = 12; %in celcius
C = 15; %g/mL
dissolvedOxygen =  a(1) + (a(2))*T + a(3)*C;
disp("This is the dissolved oxygen at 12 celcius and 15 g/mL: ");
disp(dissolvedOxygen + " g/mL.");

%Calculating Error
error = abs((9.09 - dissolvedOxygen)/9.09) * 100;
disp("The relative error is: ");
disp(error + "%");

%The possible causes of the discrepancy is because of human and error and bceause the 
%the data of the concetrations are not linear.
