%% P2Q1b
%Parameters for Model 1
Ka = 7500; %ml air/min
M = 220; %ml O2/min
Qa = 4000; %ml air/min
Qb = 4500; %ml blood/min
Va = 1600; %ml 
Yair = 0.21; %ml O2/ml air
Vp = 75; %ml
Vv = 45000; %ml
P = 760; %mmHg
sigma = 0.97; %Fraction of venous blood that goes through the lungs
Keq = 0.65; %Equilbirum between Yl , Xp
Vl = 2720; %ml
tao = 5; %seconds

%Initial Conditions
Yl = 0.14;
Xp = 0.19; 
Xa = 0.18;
Xv = 0.15;

x0 = [Yl Xp Xa Xv].';

A = [((-Ka/Vl)+(-Qa/Vl))        (Keq*Ka/Vl)                             0          0;
     (Ka/Vp)                    ((-Keq*Ka/Vp)+(-sigma*Qb/Vp))           0          (sigma*Qb/Vp);
     0                          (sigma*Qb/Va)                           (-Qb/Va)   ((1-sigma)*Qb/Va);
     0                          0                                       (Qb/Vv)    (-Qb/Vv)
];

b = [(Qa*Yair/Vl)   0  0    -(M/Vv)].';

%% Finding Particular Solution + EigenValues/Vectors + Steady State 

yp = A\-b; %Particular Solution Calculation
[Evectors, Evalues] = eig(A);
Evector1 = Evectors(:,1);
Evector2 = Evectors(:,2);
Evector3 = Evectors(:,3);
Evector4 = Evectors(:,4);
Evalue1 = Evalues(1,1);
Evalue2 = Evalues(2,2);
Evalue3 = Evalues(3,3);
Evalue4 = Evalues(4,4);

%% Finding Constant Values
Cvalues = Evectors\(x0-yp);
C1 = Cvalues(1);
C2 = Cvalues(2);
C3 = Cvalues(3);
C4 = Cvalues(4);

%% Plotting
hold on
time = linspace(0,10,1000);
for i=1:4
    plot(time,C1*Evector1(i)*exp(Evalue1*time)+C2*Evector2(i)*exp(Evalue2*time)+C3*Evector3(i)*exp(Evalue3*time)+C4*Evector4(i)*exp(Evalue4*time)+yp(i));
end
hold off

xlabel('Time (min)');
ylabel('Concentration of O2');
legend('YL','Xp','Xa','Xv');
title('Concentration of O2 vs Time');







