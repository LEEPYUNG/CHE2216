
function [val] = fourier(n,t)

L = 4;
val = 0; %initial sum

for i = 1:n %go to number of terms  
val = val + (((-L^2)./(i.*pi)).*(cos(i.*pi)).*(sin(i*pi.*t/L)));
end

end



