cd /Users/julievanderhoop/Documents/MATLAB/FHL/FinBeats
load('June2015_FinData')

% plot all pectoral TURBULENT
[caudwait,pecwait] = FinWtime(F10_10aug05b);
figure(1); hold on; h = cdfplot(pecwait); set(h,'color',[0.75 0.75 0.75])
[caudwait,pecwait] = FinWtime(F10_10aug15b);
figure(1); h = cdfplot(pecwait); set(h,'color',[0.25 0.25 0.25])
[caudwait,pecwait] = FinWtime(F10_10aug40b);
figure(3); hold on; h = cdfplot(pecwait); set(h,'color','k')

[caudwait,pecwait] = FinWtime(F11_14aug05b);
figure(1); h = cdfplot(pecwait); set(h,'color',[0.75 0.75 0.75])
[caudwait,pecwait] = FinWtime(F11_14aug15b);
figure(1); h = cdfplot(pecwait); set(h,'color',[0.25 0.25 0.25])
[caudwait,pecwait] = FinWtime(F11_14aug40b);
figure(3); h = cdfplot(pecwait); set(h,'color','k')

[caudwait,pecwait] = FinWtime(F13_15aug05c);
figure(1); h = cdfplot(pecwait); set(h,'color',[0.75 0.75 0.75])
figure(2); hold on; h = cdfplot(caudwait); set(h,'color',[0.75 0.75 0.75])
[caudwait,pecwait] = FinWtime(F13_15aug15b);
figure(1); h = cdfplot(pecwait); set(h,'color',[0.25 0.25 0.25])
[caudwait,pecwait] = FinWtime(F13_15aug45b);
figure(3); h = cdfplot(pecwait); set(h,'color','k')
figure(2); h = cdfplot(caudwait); set(h,'color','k')

[caudwait,pecwait] = FinWtime(F15_19aug05b);
figure(1); h = cdfplot(pecwait); set(h,'color',[0.75 0.75 0.75])
[caudwait,pecwait] = FinWtime(F15_19aug15b);
figure(1); h = cdfplot(pecwait); set(h,'color',[0.25 0.25 0.25])
[caudwait,pecwait] = FinWtime(F15_19aug40b);
figure(3); h = cdfplot(pecwait); set(h,'color','k')
figure(2); h = cdfplot(caudwait); set(h,'color','k')

[caudwait,pecwait] = FinWtime(F19_20aug05b);
figure(1); h = cdfplot(pecwait); set(h,'color',[0.75 0.75 0.75])
[caudwait,pecwait] = FinWtime(F19_20aug15b);
figure(1); h = cdfplot(pecwait); set(h,'color',[0.25 0.25 0.25])
[caudwait,pecwait] = FinWtime(F19_20aug35b);
figure(3); h = cdfplot(pecwait); set(h,'color','k')

[caudwait,pecwait] = FinWtime(F5_12aug05b);
figure(1); h = cdfplot(pecwait); set(h,'color',[0.75 0.75 0.75])
figure(2); h = cdfplot(caudwait); set(h,'color',[0.75 0.75 0.75])
[caudwait,pecwait] = FinWtime(F5_12aug15b);
figure(1); h = cdfplot(pecwait); set(h,'color',[0.25 0.25 0.25])
figure(2); h = cdfplot(caudwait); set(h,'color',[0.25 0.25 0.25])
[caudwait,pecwait] = FinWtime(F5_12aug35b);
figure(1); h = cdfplot(pecwait); set(h,'color','k')
figure(3); h = cdfplot(caudwait); set(h,'color','k')

[caudwait,pecwait] = FinWtime(F6_8aug05b);
figure(1); h = cdfplot(pecwait); set(h,'color',[0.75 0.75 0.75])
[caudwait,pecwait] = FinWtime(F6_8aug15b);
figure(1); h = cdfplot(pecwait); set(h,'color',[0.25 0.25 0.25])
[caudwait,pecwait] = FinWtime(F6_8aug35b);
figure(3); h = cdfplot(pecwait); set(h,'color','k')

[caudwait,pecwait] = FinWtime(F9_12aug05b);
figure(1); h = cdfplot(pecwait); set(h,'color',[0.75 0.75 0.75])
[caudwait,pecwait] = FinWtime(F9_12aug15b);
figure(1); h = cdfplot(pecwait); set(h,'color',[0.25 0.25 0.25])
[caudwait,pecwait] = FinWtime(F9_12aug40b);
figure(3); h = cdfplot(pecwait); set(h,'color','k')
figure(2); h = cdfplot(caudwait); set(h,'color','k')

% plot all pectoral LAMINAR
[caudwait,pecwait] = FinWtime(F10_14aug05b);
figure(1); hold on; h = cdfplot(pecwait); set(h,'color',[0.5 0.5 1])
[caudwait,pecwait] = FinWtime(F10_14aug15b);
figure(1); h = cdfplot(pecwait); set(h,'color',[0.25 0.25 1])
[caudwait,pecwait] = FinWtime(F10_14aug40b);
figure(3); h = cdfplot(pecwait); set(h,'color','b')

[caudwait,pecwait] = FinWtime(F11_18aug05b);
figure(1); h = cdfplot(pecwait); set(h,'color',[0.5 0.5 1])
[caudwait,pecwait] = FinWtime(F11_18aug15b);
figure(1); h = cdfplot(pecwait); set(h,'color',[0.25 0.25 1])
[caudwait,pecwait] = FinWtime(F11_18aug40a);
figure(3); h = cdfplot(pecwait); set(h,'color','b')
figure(2); h = cdfplot(caudwait); set(h,'color','b')

[caudwait,pecwait] = FinWtime(F13_18aug05b);
figure(1); h = cdfplot(pecwait); set(h,'color',[0.5 0.5 1])
[caudwait,pecwait] = FinWtime(F13_18aug15b);
figure(1); h = cdfplot(pecwait); set(h,'color',[0.25 0.25 1])
[caudwait,pecwait] = FinWtime(F13_18aug45b);
figure(3); h = cdfplot(pecwait); set(h,'color','b')
figure(2); h = cdfplot(caudwait); set(h,'color','b')

[caudwait,pecwait] = FinWtime(F15_19aug05b);
figure(1); h = cdfplot(pecwait); set(h,'color',[0.5 0.5 1])
[caudwait,pecwait] = FinWtime(F15_19aug15b);
figure(1); h = cdfplot(pecwait); set(h,'color',[0.25 0.25 1])
[caudwait,pecwait] = FinWtime(F15_19aug40b);
figure(3); h = cdfplot(pecwait); set(h,'color','b')
figure(2); h = cdfplot(caudwait); set(h,'color','b')

[caudwait,pecwait] = FinWtime(F19_17aug05b);
figure(1); h = cdfplot(pecwait); set(h,'color',[0.5 0.5 1])
[caudwait,pecwait] = FinWtime(F19_17aug15b);
figure(1); h = cdfplot(pecwait); set(h,'color',[0.25 0.25 1])
[caudwait,pecwait] = FinWtime(F19_17aug35b);
figure(3); h = cdfplot(pecwait); set(h,'color','b')
figure(2); h = cdfplot(caudwait); set(h,'color','b')

[caudwait,pecwait] = FinWtime(F5_7aug05b);
figure(1); h = cdfplot(pecwait); set(h,'color',[0.5 0.5 1])
[caudwait,pecwait] = FinWtime(F5_7aug15c);
figure(1); h = cdfplot(pecwait); set(h,'color',[0.25 0.25 1])
figure(2); h = cdfplot(caudwait); set(h,'color',[0.25 0.25 1])
[caudwait,pecwait] = FinWtime(F5_7aug35b);
figure(3); h = cdfplot(pecwait); set(h,'color','b')
figure(2); h = cdfplot(caudwait); set(h,'color','b')

[caudwait,pecwait] = FinWtime(F6_20aug05b);
figure(1); h = cdfplot(pecwait); set(h,'color',[0.5 0.5 1])
[caudwait,pecwait] = FinWtime(F6_20aug15b);
figure(1); h = cdfplot(pecwait); set(h,'color',[0.25 0.25 1])
[caudwait,pecwait] = FinWtime(F6_20aug35b);
figure(3); h = cdfplot(pecwait); set(h,'color','b')

[caudwait,pecwait] = FinWtime(F9_15aug05b);
figure(1); h = cdfplot(pecwait); set(h,'color',[0.5 0.5 1])
figure(2); h = cdfplot(caudwait); set(h,'color',[0.5 0.5 1])
[caudwait,pecwait] = FinWtime(F9_15aug15b);
figure(1); h = cdfplot(pecwait); set(h,'color',[0.25 0.25 1])
[caudwait,pecwait] = FinWtime(F9_15aug40b);
figure(3); h = cdfplot(pecwait); set(h,'color','b')