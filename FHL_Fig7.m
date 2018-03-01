% Plot figure 7: 
% Panel A = Relationship between VO2 and pectoral fin frequency
% Panel B = Pec fin frequency with speed

% load data
cd /Users/julievanderhoop/Documents/MATLAB/FHL/FinBeats
load('FHL_hzVO2.mat')
% same as before: flow == 0 when turbulent, == 1 when laminar

%%
logVO2 = log(VO2);

Pecs = table(Hz,logVO2,fish,flow,speed);
Pecs.flow = nominal(Pecs.flow);

f = fitlm(Pecs,'logVO2~flow*Hz');
figure(2); 
subplot('Position',[0.1 0.1 0.4 0.85])
h = gscatter(Hz,logVO2,flow,'br','o^');
set(h(1),'MarkerFaceColor','b');
set(h(2),'MarkerFaceColor','r');

w = linspace(min(Hz),max(Hz(flow == 0)));
line(w,feval(f,w,'0'),'Color','b')
w = linspace(min(Hz),max(Hz(flow == 1)));
line(w,feval(f,w,'1'),'Color','r')

legend off
xlabel('Pectoral Fin Beat Frequency (Hz)'); ylabel('logMO_2 (mg O_2 kg^-^1 h^-^1)')
adjustfigurefont; box on

%% plot  pectoral fin beat frequency with speed
subplot('position',[0.595 0.1 0.4 0.85]); hold on
f0 = find(flow == 0);
f0s1 = find(speed(f0) == 1);
f0s2 = find(speed(f0) == 2);
f0s3 = find(speed(f0) == 3);
errorbar(1,mean(Hz(f0(f0s1))),std(Hz(f0(f0s1))),'bo','markerfacecolor','b')
errorbar(2,mean(Hz(f0(f0s2))),std(Hz(f0(f0s2))),'bo','markerfacecolor','b')
errorbar(3,mean(Hz(f0(f0s3))),std(Hz(f0(f0s3))),'bo','markerfacecolor','b')

f1 = find(flow == 1);
f1s1 = find(speed(f1) == 1);
f1s2 = find(speed(f1) == 2);
f1s3 = find(speed(f1) == 3);
errorbar(1,mean(Hz(f1(f1s1))),std(Hz(f1(f1s1))),'r^','markerfacecolor','r')
errorbar(2,mean(Hz(f1(f1s2))),std(Hz(f1(f1s2))),'r^','markerfacecolor','r')
errorbar(3,mean(Hz(f1(f1s3))),std(Hz(f1(f1s3))),'r^','markerfacecolor','r')
xlabel('Speed'); xlim([0.5 3.5]); set(gca,'xtick',[1 2 3],'xticklabel',{'Low','Medium','High'})
ylabel('Pectoral Fin Beat Frequency (Hz)')
adjustfigurefont; box on

print('FHL_Fig7_HzVO2speed.eps','-depsc','-r300') 
