% FinBeatFigure
% show how pectoral and caudal fin frequencies are calculate

% load in data
load('June2015_FinData')

% get variable names
a = whos;

% automate filename generation
i = 12;
filename = a(i).name;
% is caudal fin used? find == 2
used = find(eval(strcat(filename,'(:,2)')) == 2);
if length(used) > 1;
    caud(i) = 1;
    % find previous use of pectoral
    prevP = eval(strcat(filename,'(used-1,1)'));
    if used(end) == length(eval(strcat(filename)))
        nextP = eval(strcat(filename,'(used(1:end-1)+1,1)'));
    else
        nextP = eval(strcat(filename,'(used+1,1)'));
    end
    c = eval(strcat(filename,'(used,1)'));
    Ctime(i) = sum(nextP-prevP(1:length(nextP))); % total use of caudal fin in seconds
    PerCtime(i) = 100*(Ctime(i)/(eval(strcat(filename,'(end,1)')) - eval(strcat(filename,'(1,1)'))));
end

figure(14); clf
set(gcf,'position',[299   240   896   384],'paperpositionmode','auto')
subplot('position',[0.1,0.1,0.6,0.85]); hold on
for i = 1:length(F11_18aug40a)
h = patchline([F11_18aug40a(i,1) F11_18aug40a(i,1)],[F11_18aug40a(i,2)-0.1 F11_18aug40a(i,2)+0.1],...
    'linestyle','-','edgecolor','k','edgealpha',0.5);
end
[caudwait,pecwait] = FinWtime(F11_18aug40a); % get caudal and pectoral waiting times
pec = find(F11_18aug40a(:,2) == 1);
caud = find(F11_18aug40a(:,2) == 2);

plot(F11_18aug40a(pec(2:end),1),diff(F11_18aug40a(pec,1)))
plot(190,mean(diff(F11_18aug40a(pec,1))),'o')


ylim([0 2.5]); xlim([0 200]); xlabel('Time (sec)')
set(gca,'ytick',[0 0.25 0.5 1 2],'yticklabel',{'0','0.25','0.5','Pectoral Beat','Caudal Beat'})
ylabel('Time since last beat (sec)')
text(120,0.75,'Pectoral Fin Beat Frequency = ','FontSize',14)
text(140,0.65,'1/mean(diff(beat times)) = ','FontSize',14)
text(140,0.45,'1/0.3161 = 3.16 Hz','FontSize',14)


text(2,2.4,'A','FontSize',14,'FontWeight','Bold')
box on

subplot('position',[0.75,0.1,0.22,0.85]); hold on
for i = 607:643
plot([F11_18aug40a(i,1) F11_18aug40a(i,1)],[F11_18aug40a(i,2)-0.1 F11_18aug40a(i,2)+0.1],'k')
end
ylim([0 2.5]); xlim([175 177]); xlabel('Time (sec)')
for i = 68:71
hold on; plot([prevP(i) nextP(i)],[2 2],'k--')
end
set(gca,'ytick',[])
text(175.25,1.75,'Caudal Fin Use = 0.73 s','FontSize',14)
text(175.05,2.4,'B','FontSize',16,'FontWeight','Bold')
box on

adjustfigurefont

print('FinBeatFig.tif','-dtiff','-r300')