function [] = plotFin(data)

pec = find(data(:,2) == 1);
caud = find(data(:,2) == 2);

for i = 1:length(caud)
plot([data(caud(i),1) data(caud(i),1)],[0 1.5],'-','color',[0.5 0.5 0.5])
end
plot(data(pec(2:end),1),diff(data(pec,1)));
plot(data(caud(2:end),1),diff(data(caud,1)))

plot(195,mean(diff(data(pec,1))),'ko') % average 

