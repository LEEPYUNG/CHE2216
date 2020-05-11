function [dydt] = dydtMaker2(t,y)
%Creates a dydt system of ODE
%t = time
%y = vector of variables

%Parameters for Model 2
Ka = 2500; %ml air/min
M = 220; %ml O2/min
Qa = 4000; %ml air/min
Qb = 4500; %ml blood/min
Va = 1600; %ml 
Yair = 0.21; %ml O2/ml air
Vp = 25; %ml (All same for vp)
Vv = 45000; %ml
%P = 760; %mmHg
sigma = 0.97; %Fraction of venous blood that goes through the lungs
tao = 1/12; %minutes

%Setting up Vl and Derivatives 
Vl = 2720+260*cos((2*pi())*(t/tao)); %ml
dvldt = (-520*pi()/tao)*sin((2*pi())*(t/tao));

%y(1) = Vl
%y(2) = XP1
%y(3) = XP2
%y(4) = Xp3
%y(5) = Xa
%y(6) = Xv

%Setting up mass transfer relations
Y1 = ((0.0003*y(2))/(0.22-y(2)))+((11.2-y(2))*(0.055*y(2)));
Y2 = ((0.0003*y(3))/(0.22-y(3)))+((11.2-y(3))*(0.055*y(3)));
Y3 = ((0.0003*y(4))/(0.22-y(4)))+((11.2-y(4))*(0.055*y(4)));

dydt=[ ((-Qa-3*Ka)*y(1) + Qa*Yair+Ka*(Y1+Y2+Y3) -dvldt*y(1))/Vl;
       (Ka*y(1)/Vp)         - (Ka*Y1/Vp)              +  (sigma*Qb*y(6)/Vp)     -  (sigma*Qb*y(2)/Vp);
       (Ka*y(1)/Vp)         - (Ka*Y2/Vp)              +  (sigma*Qb*y(2)/Vp)     -  (sigma*Qb*y(3)/Vp);
       (Ka*y(1)/Vp)         - (Ka*Y3/Vp)  +  (sigma*Qb*y(3)/Vp)     -  (sigma*Qb*y(4)/Vp);
       (sigma*Qb*y(4)/Va)   +  ((1-sigma)*Qb*y(6)/Va) - (Qb*y(5)/Va);
       (Qb*y(5)/Vv)         -  (M/Vv)                 -  (Qb*y(6)/Vv)];
 

end


