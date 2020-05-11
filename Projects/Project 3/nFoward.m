function [n] = nFoward(n0,c,dt)
%Forward finite difference for the calculation of n.

k2 = 0.63;
tau = 3;

dn = (1-((c^2)/((k2^2)+(c^2)))-n0)/tau;
n = dn*dt+n0;
end

