function [dydt] = dydtMaker(t,y)
%Creates a dydt system of ODE
%t = time
%y = vector of variables

%Parameters for Model 1
Ka = 7500; %ml air/min
M = 220; %ml O2/min
Qa = 4000; %ml air/min
Qb = 4500; %ml blood/min
Va = 1600; %ml 
Yair = 0.21; %ml O2/ml air
Vp = 75; %ml
Vv = 45000; %ml
%P = 760; %mmHg
sigma = 0.97; %Fraction of venous blood that goes through the lungs
Keq = 0.65; %Equilbirum between Yl , Xp
Vl = 2720; %ml
%tao = 5; %seconds


dydt=[((-Qa-Ka)*y(1))/Vl+(Keq*Ka*y(2))/Vl + Qa*Yair/Vl;
(Ka*y(1))/Vp-(Ka*Keq*y(2))/Vp-(sigma*Qb*y(2))/Vp+(sigma*Qb*y(4))/Vp;
(sigma*Qb*y(2))/Va-(Qb*y(3))/Va+((1-sigma)*Qb*y(4))/Va;
(Qb*y(3))/Vv-(Qb*y(4))/Vv-M/Vv];


end

