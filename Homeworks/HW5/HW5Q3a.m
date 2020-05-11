%HW5Q3a 
T = [0 5 10 15 20 25 30]'; %T vector
c = [14.6 12.8 11.3 10.1 9.09 8.26 7.56]'; %c Vector

Z = [ones(size(T)) T T.^2]; %Z Vector
a = (Z'*Z)\(Z'*c); %Solving for a

%Sum of squares 
Sr = sum((c-Z*a).^2);
disp("This is the Sr: ");
disp(Sr);

%Calculating R2
R2 = 1-Sr/sum((c-mean(c)).^2);
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