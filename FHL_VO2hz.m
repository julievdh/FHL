% Calculate relationship between VO2 and pectoral fin frequency

% load data
cd /Users/julievanderhoop/Documents/MATLAB/FHL/FinBeats
load('FHL_hzVO2.mat')
% same as before: flow == 0 when turbulent, == 1 when laminar

%%
logVO2 = log(VO2);

Pecs = table(Hz,logVO2,fish,flow,speed);
Pecs.flow = nominal(Pecs.flow);

f = fitlm(Pecs,'logVO2~flow*Hz');
figure(2); clf; hold on
h = gscatter(Hz,logVO2,flow,'br','o^');
set(h(1),'MarkerFaceColor','b');
set(h(2),'MarkerFaceColor','r');

w = linspace(min(Hz),max(Hz(flow == 0)));
line(w,feval(f,w,'0'),'Color','b')
w = linspace(min(Hz),max(Hz(flow == 1)));
line(w,feval(f,w,'1'),'Color','r')

anova(f);
legend('High Turbulence','Low Turbulence','Location','NW')
xlabel('Pectoral Fin Beat Frequency (Hz)'); ylabel('logVO_2 (mg O_2 kg^-^1 h^-^1)')
adjustfigurefont; box on

%%

[lamfit,lamgof,lamoutput] = fit(Hz(flow == 1),VO2(flow == 1),'exp1');
[turbfit,turbgof,turboutput] = fit(Hz(flow == 0),VO2(flow == 0),'exp1');
figure(1); clf; hold on
plot(lamfit); 
h = plot(turbfit); set(h,'color','b')
h = gscatter(Hz,VO2,flow,'br','o^');


%%
