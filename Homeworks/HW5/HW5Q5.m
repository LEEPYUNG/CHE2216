tKnown = 30.2;
values = [30 28 32 26 33 25 28 31];
sampleMean = mean(values);
n = 8;
standardDeviation = std(values);

tcalc = (abs(tKnown - sampleMean)/standardDeviation) * sqrt(n);
disp(tcalc);

%Thermometer does work well.
%With interpolation with the calculated
%t value, this gives a confidence value of about 62%.
%Since tcalc (1.066)< ttable (2.365), the data agrees with standards 95% of the time.
%I would do more testings to create a better sample size, to see if the
%confidence interval gets bigger or smaller.