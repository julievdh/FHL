% Calculate relationship between VO2 and pectoral fin frequency



% load data
cd /Users/julievanderhoop/Documents/MATLAB/FHL
load('FHL_hzVO2.mat')


% fish and condition and speed
fish = {'5';'5';'5';'5';'5';'5';...
    '6';'6';'6';'6';'6';'6';...
    '9';'9';'9';'9';'9';'9';...
    '10';'10';'10';'10';'10';'10';...
    '11';'11';'11';'11';'11';'11';...
    '13';'13';'13';'13';'13';'13';...
    '15';'15';'15';'15';'15';'15';...
    '19';'19';'19';'19';'19';'19'};
speed = repmat((1:3),1,16)';
condition = repmat([1 1 1 0 0 0],1,8)';


x = 0.5:0.1:3;

[s i stats] = myregr(hzVO2(condition == 0,3),hzVO2(condition == 0,2),0);
turbfit = s.value*x + i.value;

[s i stats] = myregr(hzVO2(condition == 1,3),hzVO2(condition == 1,2),0);
lamfit = s.value*x + i.value;

[s i stats] = myregr(hzVO2(:,3),hzVO2(:,2),0);
allfit = s.value*x + i.value;


% plot
figure(1); clf; hold on; box on
set(gca,'FontSize',12)
plot(hzVO2(condition == 0,3),hzVO2(condition == 0,2),'bo','MarkerFaceColor','b')
plot(hzVO2(condition == 1,3),hzVO2(condition == 1,2),'ro','MarkerFaceColor','r')
% plot(x,turbfit,'b',x,lamfit,'r',x,allfit,'k')
plot(x,allfit,'k')
xlabel('Pectoral Fin Beat Frequency (Hz)','FontSize',12); ylabel('Oxygen Consumption Rate (VO_2 ; mg O_2 kg^-^1 h^-^1)','FontSize',12)

% cd /Users/julievanderhoop/Documents/MATLAB/FHL
% savename = 'VO2Hz'
% print('-depsc',savename)

% regstats(hzVO2(:,3),hzVO2(:,2),'linear')
stepwise(hzVO2(:,3:7),hzVO2(:,2))

figure(2); clf; hold on; box on
set(gca,'FontSize',12)
plot(hzVO2(condition == 0,3).*hzVO2(condition == 0,5)/100,hzVO2(condition == 0,2),'bo','MarkerFaceColor','b')
plot(hzVO2(condition == 1,3).*hzVO2(condition == 1,5)/100,hzVO2(condition == 1,2),'ro','MarkerFaceColor','r')
% plot(x,turbfit,'b',x,lamfit,'r',x,allfit,'k')
plot(x,allfit,'k')
xlabel('Pectoral Fin Beat Frequency (Hz)','FontSize',12); ylabel('Oxygen Consumption Rate (VO_2 ; mg O_2 kg^-^1 h^-^1)','FontSize',12)

