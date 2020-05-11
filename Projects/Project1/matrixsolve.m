%Writes 21x21 matrix and solves. 

%%
%A is 21x21 Matrix
%B is 21x1 Matrix

clear
clc

A = MatrixMaker(0.4);
b = zeros(21,1);
b(1) = 13751; %mols/hr
x = A\b;

%Print out labels.
labels = ["E1" "E2" "E3" "E4" "E5" "E6" "E7" "V1" "V2" "V3" "V4" "V5" "V6" "V7" "H1" "H2" "H3" "H4" "H5" "H6" "H7"];
for i = 1:21
    disp(labels(i) + ": " + x(i) + " mol/h");
end 

%Recycle Rate
fprintf('\n');
recycleRateE = (x(7)*(98.96)) /453.592;
recycleRateV = (x(14) * 62.498) / 453.592;
recycleRate = recycleRateE + recycleRateV;
disp("This is the recycle flow rate: " + recycleRate + " lbs/hr");

%Overall process yield of VCM
%fprintf('\n');
VCMyield = (x(13))/13751;
disp("This is the overall process yield of VCM: " + VCMyield );

%% part C
recycleArray = zeros(100,1);
conv=linspace(.1,.5);
for i = 1:100 
    
    A = MatrixMaker(conv(i));
    b = zeros(21,1);
    b(1) = 13751; %in mols/hr
    x = A\b;

    %Recycle Rate
    recycleRateE = (x(7)*(98.96)) /453.592; %in lb/hr
    recycleRateV = (x(14) * 62.498) / 453.592; %in lb/hr
    recycleRate = recycleRateE + recycleRateV; %in lb/hr

    recycleArray(i) = recycleRate;
end

figure(1)
plot(conv, recycleArray);
title("Conversion vs Recycle Rates");
xlabel("Conversion%");
ylabel("Recycle Rate lb/hr");
    
%% Part 4

%10% conversion
VCMyield = zeros(26,1);
VCMyield2 = zeros(26,1);

for i = 5:30 
    A = MatrixMakerRecovery(0.1, i/100);
    b = zeros(21,1);
    b(1) = 13751; %in mols/hr
    x = A\b;

    VCMyield(i-4) = (x(13))/13751;
end

for i = 5:30 
    A = MatrixMakerRecovery(0.5, i/100);
    b = zeros(21,1);
    b(1) = 13751; %in mols/hr
    x = A\b;

    VCMyield2(i-4) = (x(13))/13751;
end

figure(2)
plot(5:30, VCMyield);
title("VCM Process Yield vs VCM Recovery Rate with 10% Conversion");
xlabel("Recovery Rate %");
ylabel("VCM mols/hr");

figure(3)
plot(5:30, VCMyield2);
title("VCM Process Yield vs VCM Recovery Rate with 50% Conversion");
xlabel("Recovery Rate %");
ylabel("VCM mols/hr");

%% Part 5
  func = @(conv) MatrixMakerQ5(conv);
  a = fzero(func, 0.2);
    
  disp("This is the optimum conversion rate: " + a + "mols of EDC converted/EDC fed" );




