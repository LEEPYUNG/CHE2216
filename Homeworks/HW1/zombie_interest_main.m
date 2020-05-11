%This script is to test the zombie_interest function with inputs 
%P = 100, r = 5, and i which ranges from 1 to 10. 

%population is 1x10 array to store the daily population size of zombies.
population = (1:10);
%days is a 1x10 to store the days from n to n final.
days = (1:10);
%For loop created to test the function from 1 to 10 and add the size daily
%to population.
for i = 1:10
    population(i) = zombie_interest(100,5,i);
end

%Ploting days vs population created above. With xlabel, ylabel, and title.
%Included figure(1) to separate this graph and the graph for multiple
%increase rates.
figure(1);
plot(days,population);
xlabel("Days after outbreak");
ylabel("Population");
title("Daily Zombie Population with 5% Increase Rate");


%%
%This part is to test the zombie_interest function with inputs 
%P = 100, r = 3,6,9, and i which ranges from 1 to 28. 

%population3,population6,population9 are 1x28 arrays to store the daily population size of zombies for 3%,6%,9%.
population3 = (1:28);
population6 = (1:28);
population9 = (1:28);
%days28 is a 1x28 to store the days from n to n final.
days28 = (1:28);
%For loop created to test the function from 1 to 28 and add the size daily
%to population.
for i = 1:28
    population3(i) = zombie_interest(100,3,i);
    population6(i) = zombie_interest(100,6,i);
    population9(i) = zombie_interest(100,9,i);
end

%Ploting days vs population created above. With xlabel, ylabel, and title.
%Included figure(12) to separate this graph and the graph for the single
%increase rate.
figure(2);
%Plotted the population with 3% rate with solid green line.
plot(days28,population3, 'g');
%hold on command is used to overlay the three plots.
hold on
ylabel("Population");
%Plotted the population with 6% rate with dotted green line.
plot(days28,population6, ':g');
%Plotted the population with 6% rate with dashed green line.
plot(days28,population9, '--g');
xlabel("Days after outbreak");
title("Daily Zombie Population with Varying Increase Rate");
%hold off command is used to stop overlaying the plots.
hold off


