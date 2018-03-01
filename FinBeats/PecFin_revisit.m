cd /Users/julievanderhoop/Documents/MATLAB/FHL/FinBeats
load('June2015_FinData')
% % plot for example, instantaneous fin beat frequency with time of beats
% figure(100), clf, hold on
% plot(F10_14aug05b(2:end,1),1./diff(F10_14aug05b(:,1)),'r.-')  % laminar
% plot(F10_10aug05b(2:end,1),1./diff(F10_10aug05b(:,1)),'b.-') % turbulent
% plot(195,1./mean(diff(F10_10aug05b(:,1))),'bo') % average
% plot(195,1./mean(diff(F10_14aug05b(:,1))),'r^') % average
% 
% 
% %%
% figure(195), clf, 
% subplot(211), hold on
% plotFin(F13_15aug05c)
% plotFin(F13_15aug15b);
% plotFin(F13_15aug45b);
% 
% subplot(212), hold on
% plotFin(F13_18aug05b);
% plotFin(F13_18aug15b);
% plotFin(F13_18aug45b);
% 
% 
% 
% %%
% % plot all pectoral TURBULENT
% [caudwait,pecwait,cauduse] = FinWtime(F10_10aug05b);
% figure(3); hold on; h = cdfplot(pecwait); set(h,'color',[0.75 0.75 0.75])
% [caudwait,pecwait,cauduse] = FinWtime(F10_10aug15b);
% figure(3); h = cdfplot(pecwait); set(h,'color',[0.25 0.25 0.25])
% [caudwait,pecwait,cauduse] = FinWtime(F10_10aug40b);
% figure(3); hold on; h = cdfplot(pecwait); set(h,'color','k')
% 
% [caudwait,pecwait] = FinWtime(F11_14aug05b);
% figure(1); h = cdfplot(pecwait); set(h,'color',[0.75 0.75 0.75])
% [caudwait,pecwait] = FinWtime(F11_14aug15b);
% figure(1); h = cdfplot(pecwait); set(h,'color',[0.25 0.25 0.25])
% [caudwait,pecwait] = FinWtime(F11_14aug40b);
% figure(3); h = cdfplot(pecwait); set(h,'color','k')
% 
% [caudwait,pecwait] = FinWtime(F13_15aug05c);
% figure(1); h = cdfplot(pecwait); set(h,'color',[0.75 0.75 0.75])
% figure(2); hold on; h = cdfplot(caudwait); set(h,'color',[0.75 0.75 0.75])
% [caudwait,pecwait] = FinWtime(F13_15aug15b);
% figure(1); h = cdfplot(pecwait); set(h,'color',[0.25 0.25 0.25])
% [caudwait,pecwait] = FinWtime(F13_15aug45b);
% figure(3); h = cdfplot(pecwait); set(h,'color','k')
% figure(2); h = cdfplot(caudwait); set(h,'color','k')
% 
% [caudwait,pecwait] = FinWtime(F15_19aug05b);
% figure(1); h = cdfplot(pecwait); set(h,'color',[0.75 0.75 0.75])
% [caudwait,pecwait] = FinWtime(F15_19aug15b);
% figure(1); h = cdfplot(pecwait); set(h,'color',[0.25 0.25 0.25])
% [caudwait,pecwait] = FinWtime(F15_19aug40b);
% figure(3); h = cdfplot(pecwait); set(h,'color','k')
% figure(2); h = cdfplot(caudwait); set(h,'color','k')
% 
% [caudwait,pecwait] = FinWtime(F19_20aug05b);
% figure(1); h = cdfplot(pecwait); set(h,'color',[0.75 0.75 0.75])
% [caudwait,pecwait] = FinWtime(F19_20aug15b);
% figure(1); h = cdfplot(pecwait); set(h,'color',[0.25 0.25 0.25])
% [caudwait,pecwait] = FinWtime(F19_20aug35b);
% figure(3); h = cdfplot(pecwait); set(h,'color','k')
% 
% [caudwait,pecwait] = FinWtime(F5_12aug05b);
% figure(1); h = cdfplot(pecwait); set(h,'color',[0.75 0.75 0.75])
% figure(2); h = cdfplot(caudwait); set(h,'color',[0.75 0.75 0.75])
% [caudwait,pecwait] = FinWtime(F5_12aug15b);
% figure(1); h = cdfplot(pecwait); set(h,'color',[0.25 0.25 0.25])
% figure(2); h = cdfplot(caudwait); set(h,'color',[0.25 0.25 0.25])
% [caudwait,pecwait] = FinWtime(F5_12aug35b);
% figure(1); h = cdfplot(pecwait); set(h,'color','k')
% figure(3); h = cdfplot(caudwait); set(h,'color','k')
% 
% [caudwait,pecwait] = FinWtime(F6_8aug05b);
% figure(1); h = cdfplot(pecwait); set(h,'color',[0.75 0.75 0.75])
% [caudwait,pecwait] = FinWtime(F6_8aug15b);
% figure(1); h = cdfplot(pecwait); set(h,'color',[0.25 0.25 0.25])
% [caudwait,pecwait] = FinWtime(F6_8aug35b);
% figure(3); h = cdfplot(pecwait); set(h,'color','k')
% 
% [caudwait,pecwait] = FinWtime(F9_12aug05b);
% figure(1); h = cdfplot(pecwait); set(h,'color',[0.75 0.75 0.75])
% [caudwait,pecwait] = FinWtime(F9_12aug15b);
% figure(1); h = cdfplot(pecwait); set(h,'color',[0.25 0.25 0.25])
% [caudwait,pecwait] = FinWtime(F9_12aug40b);
% figure(3); h = cdfplot(pecwait); set(h,'color','k')
% figure(2); h = cdfplot(caudwait); set(h,'color','k')
% 
% % plot all pectoral LAMINAR
% [caudwait,pecwait] = FinWtime(F10_14aug05b);
% figure(1); hold on; h = cdfplot(pecwait); set(h,'color',[0.5 0.5 1])
% [caudwait,pecwait] = FinWtime(F10_14aug15b);
% figure(1); h = cdfplot(pecwait); set(h,'color',[0.25 0.25 1])
% [caudwait,pecwait] = FinWtime(F10_14aug40b);
% figure(3); h = cdfplot(pecwait); set(h,'color','b')
% 
% [caudwait,pecwait] = FinWtime(F11_18aug05b);
% figure(1); h = cdfplot(pecwait); set(h,'color',[0.5 0.5 1])
% [caudwait,pecwait] = FinWtime(F11_18aug15b);
% figure(1); h = cdfplot(pecwait); set(h,'color',[0.25 0.25 1])
% [caudwait,pecwait] = FinWtime(F11_18aug40a);
% figure(3); h = cdfplot(pecwait); set(h,'color','b')
% figure(2); h = cdfplot(caudwait); set(h,'color','b')
% 
% [caudwait,pecwait] = FinWtime(F13_18aug05b);
% figure(1); h = cdfplot(pecwait); set(h,'color',[0.5 0.5 1])
% [caudwait,pecwait] = FinWtime(F13_18aug15b);
% figure(1); h = cdfplot(pecwait); set(h,'color',[0.25 0.25 1])
% [caudwait,pecwait] = FinWtime(F13_18aug45b);
% figure(3); h = cdfplot(pecwait); set(h,'color','b')
% figure(2); h = cdfplot(caudwait); set(h,'color','b')
% 
% [caudwait,pecwait] = FinWtime(F15_19aug05b);
% figure(1); h = cdfplot(pecwait); set(h,'color',[0.5 0.5 1])
% [caudwait,pecwait] = FinWtime(F15_19aug15b);
% figure(1); h = cdfplot(pecwait); set(h,'color',[0.25 0.25 1])
% [caudwait,pecwait] = FinWtime(F15_19aug40b);
% figure(3); h = cdfplot(pecwait); set(h,'color','b')
% figure(2); h = cdfplot(caudwait); set(h,'color','b')
% 
% [caudwait,pecwait] = FinWtime(F19_17aug05b);
% figure(1); h = cdfplot(pecwait); set(h,'color',[0.5 0.5 1])
% [caudwait,pecwait] = FinWtime(F19_17aug15b);
% figure(1); h = cdfplot(pecwait); set(h,'color',[0.25 0.25 1])
% [caudwait,pecwait] = FinWtime(F19_17aug35b);
% figure(3); h = cdfplot(pecwait); set(h,'color','b')
% figure(2); h = cdfplot(caudwait); set(h,'color','b')
% 
% [caudwait,pecwait] = FinWtime(F5_7aug05b);
% figure(1); h = cdfplot(pecwait); set(h,'color',[0.5 0.5 1])
% [caudwait,pecwait] = FinWtime(F5_7aug15c);
% figure(1); h = cdfplot(pecwait); set(h,'color',[0.25 0.25 1])
% figure(2); h = cdfplot(caudwait); set(h,'color',[0.25 0.25 1])
% [caudwait,pecwait] = FinWtime(F5_7aug35b);
% figure(3); h = cdfplot(pecwait); set(h,'color','b')
% figure(2); h = cdfplot(caudwait); set(h,'color','b')
% 
% [caudwait,pecwait] = FinWtime(F6_20aug05b);
% figure(1); h = cdfplot(pecwait); set(h,'color',[0.5 0.5 1])
% [caudwait,pecwait] = FinWtime(F6_20aug15b);
% figure(1); h = cdfplot(pecwait); set(h,'color',[0.25 0.25 1])
% [caudwait,pecwait] = FinWtime(F6_20aug35b);
% figure(3); h = cdfplot(pecwait); set(h,'color','b')
% 
% [caudwait,pecwait] = FinWtime(F9_15aug05b);
% figure(1); h = cdfplot(pecwait); set(h,'color',[0.5 0.5 1])
% figure(2); h = cdfplot(caudwait); set(h,'color',[0.5 0.5 1])
% [caudwait,pecwait] = FinWtime(F9_15aug15b);
% figure(1); h = cdfplot(pecwait); set(h,'color',[0.25 0.25 1])
% [caudwait,pecwait] = FinWtime(F9_15aug40b);
% figure(3); h = cdfplot(pecwait); set(h,'color','b')
% 
% %% 
% 
% [caudwaitL,pecwait] = FinWtime(F5_7aug35b); % laminar
% figure(2); clf; hold on; hL = cdfplot(caudwaitL); set(hL,'color','r')
% [caudwaitT,pecwait] = FinWtime(F5_12aug35b); % turbulent
% figure(2); hT = cdfplot(caudwaitT); set(hT,'color','b')
% 
% figure(3); qqplot(caudwaitL,caudwaitT)
% 
%% for all files, calculate caudal time and add together to long caudal vector

filenames = {'F5_7aug35b','F6_20aug35b','F9_15aug40b','F19_17aug35b','F15_16aug40b','F13_18aug45b','F11_18aug40a','F10_14aug40b'};
caudwaitL = []; pecwaitL = [];
for i = 1:length(filenames)
[caudwait,pecwait] = FinWtime(eval(filenames{i})); % laminar
pecwaitL = vertcat(pecwaitL,1./mean(pecwait));
caudwaitL = vertcat(caudwaitL,1./mean(caudwait)); % append new info
end

figure(2); clf, hold on
cdfplot(caudwaitL)

filenames = {'F5_12aug35b','F6_8aug35b','F9_12aug40b','F19_20aug35b','F15_19aug40b','F13_18aug45b','F11_14aug40b','F10_10aug40b'};
caudwaitT = [];
for i = 1:length(filenames)
[caudwait,pecwait] = FinWtime(eval(filenames{i})); % laminar
caudwaitT = vertcat(caudwaitT,caudwait); % append new info
end

figure(2); hold on
cdfplot(caudwaitT)
xlim([0 5])

figure(3); clf, hold on
qqplot(caudwaitL,caudwaitT)
xlim([0 5]),ylim([0 5])