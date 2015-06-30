% cd /Volumes/DQ-2012-2/FHL_Fish/SwimData/MATLAB
load('medianVO2')

% calculate difference between VO2 in L and T at each speed
% not calculated for Fish 6 because of non-standard speed increments
DIFF = nan(9,7);
DIFF(1:min(length(F5_T),length(F5_L)),1) = F5_L(:,2) - F5_T(:,2);
DIFF(1:min(length(F9_T),length(F9_L)),2) = F9_L(1:end-1,2) - F9_T(:,2);
DIFF(1:min(length(F10_T),length(F10_L)),3) = F10_L(1:end-1,2) - F10_T(:,2);
DIFF(1:min(length(F11_T),length(F11_L)),4) = F11_L(:,2) - F11_T(:,2);
DIFF(1:min(length(F13_T),length(F13_L)),5) = F13_L(:,2) - F13_T(:,2);
DIFF(1:min(length(F15_T),length(F15_L)),6) = F15_L(1:end-1,2) - F15_T(:,2);
DIFF(1:min(length(F19_T),length(F19_L)),7) = F19_L(1:end-2,2) - F19_T(:,2);

QUOT = nan(9,7);
QUOT(1:min(length(F5_T),length(F5_L)),1) = F5_L(:,2)./F5_T(:,2);
QUOT(1:min(length(F9_T),length(F9_L)),2) = F9_L(1:end-1,2)./F9_T(:,2);
QUOT(1:min(length(F10_T),length(F10_L)),3) = F10_L(1:end-1,2)./F10_T(:,2);
QUOT(1:min(length(F11_T),length(F11_L)),4) = F11_L(:,2)./F11_T(:,2);
QUOT(1:min(length(F13_T),length(F13_L)),5) = F13_L(:,2)./F13_T(:,2);
QUOT(1:min(length(F15_T),length(F15_L)),6) = F15_L(1:end-1,2)./F15_T(:,2);
QUOT(1:min(length(F19_T),length(F19_L)),7) = F19_L(1:end-2,2)./F19_T(:,2);

% PERCENT INCREASE
PERCINC = nan(9,7);
PERCINC(1:min(length(F5_T),length(F5_L)),1) = 100*(F5_L(:,2)-F5_T(:,2))./F5_L(:,2);
PERCINC(1:min(length(F9_T),length(F9_L)),2) = 100*(F9_L(1:8,2)-F9_T(:,2))./F9_L(1:8,2);
PERCINC(1:min(length(F10_T),length(F10_L)),3) = 100*(F10_L(1:8,2)-F10_T(:,2))./F10_L(1:8,2);
PERCINC(1:min(length(F11_T),length(F11_L)),4) = 100*(F11_L(:,2)-F11_T(:,2))./F11_L(:,2);
PERCINC(1:min(length(F13_T),length(F13_L)),5) = 100*(F13_L(:,2)-F13_T(:,2))./F13_L(:,2);
PERCINC(1:min(length(F15_T),length(F15_L)),6) = 100*(F15_L(1:8,2)-F15_T(:,2))./F15_L(1:8,2);
PERCINC(1:min(length(F19_T),length(F19_L)),7) = 100*(F19_L(1:7,2)-F19_T(:,2))./F19_L(1:7,2);


% plot average difference
figure(1)
plot(F10_L(:,1),nanmean(DIFF')); hold on

% calculate CI
ulimit = nanmean(DIFF')+1.66*nanstd(DIFF');
llimit = nanmean(DIFF')-1.66*nanstd(DIFF');

plot(F10_L(:,1),ulimit,'b--')
plot(F10_L(:,1),llimit,'b--')

% boxplot
figure(2)

mn = nanmean(PERCINC(1:8,:)');
se = nanstd(PERCINC(1:8,:)')/sqrt(7);

figure(2)

h = bar(mn); hold on
set(h,'facecolor',[1,1,1]*0.5)    

for i = 1:8
    plot([i,i],[mn(i)-se(i),mn(i)+se(i)],'k-')
end

set(gcf,'PaperPositionMode','auto')
set(gca,'FontSize',12,'XTick',[1:8])
set(gca,'XTickLabel',['0.5';'1.0';'1.5';'2.0';'2.5';'3.0';'3.5';'4.0'])
xlabel('Speed (BL s^-^1)','FontSize',12)
ylabel('Percent Increase in VO_2','FontSize',12)
ylim([0 35])

cd /Users/julievanderhoop/Documents/MATLAB/FHL
savename = 'PercIncVO2'
print('-depsc',savename)


figure(4)
plot(F11_L(:,1),F11_L(:,2),'ro','MarkerFaceColor','r')
hold on
plot(F11_T(:,1),F11_T(:,2),'bo','MarkerFaceColor','b')
xlabel('Speed (BL s^-^1)','FontSize',12)
ylabel('Oxygen Consumption Rate (VO_2; mg O_2 kg^-^1 h^-^1)','FontSize',12)
speed = [0.5:0.1:4.3];
yfitL = 149.33*exp(0.2632*speed);
yfitT = 148.77*exp(0.1591*speed);
plot(speed,yfitL,'r',speed,yfitT,'b')
set(gcf,'PaperPositionMode','auto','color','white')

cd /Users/julievanderhoop/Documents/MATLAB/FHL
savename = 'Fish11_VO2'
print('-depsc',savename)

return

% figure(5)
% boxplot(QUOT(1:8,:)')
% set(gcf,'PaperPositionMode','auto')
% set(gca,'FontSize',12,'XTick',[1:9])
% set(gca,'XTickLabel',['0.5';'1.0';'1.5';'2.0';'2.5';'3.0';'3.5';'4.0';'4.5'])
% xlabel('Speed (BL s^-^1)','FontSize',12)
% ylabel('Fold increase in VO2','FontSize',12)



% COT: mg O2 kg-1 BL-1
% Laminar
[COTminL(1,1),I] = min(F5_L(:,3));
COTminL(1,2) = F5_L(I);
[COTminL(2,1),I] = min(F6_L(:,3));
COTminL(2,2) = F6_L(I);
[COTminL(3,1),I] = min(F9_L(:,3));
COTminL(3,2) = F9_L(I);
[COTminL(4,1),I] = min(F10_L(:,3));
COTminL(4,2) = F10_L(I);
[COTminL(5,1),I] = min(F11_L(:,3));
COTminL(5,2) = F11_L(I);
[COTminL(6,1),I] = min(F13_L(:,3));
COTminL(6,2) = F13_L(I);
[COTminL(7,1),I] = min(F15_L(:,3));
COTminL(7,2) = F15_L(I);
[COTminL(8,1),I] = min(F19_L(:,3));
COTminL(8,2) = F19_L(I);


% Turbulent
[COTminT(1,1),I] = min(F5_T(:,3));
COTminT(1,2) = F5_T(I);
[COTminT(2,1),I] = min(F6_T(:,3));
COTminT(2,2) = F6_T(I);
[COTminT(3,1),I] = min(F9_T(:,3));
COTminT(3,2) = F9_T(I);
[COTminT(4,1),I] = min(F10_T(:,3));
COTminT(4,2) = F10_T(I);
[COTminT(5,1),I] = min(F11_T(:,3));
COTminT(5,2) = F11_T(I);
[COTminT(6,1),I] = min(F13_T(:,3));
COTminT(6,2) = F13_T(I);
[COTminT(7,1),I] = min(F15_T(:,3));
COTminT(7,2) = F15_T(I);
[COTminT(8,1),I] = min(F19_T(:,3));
COTminT(8,2) = F19_T(I);