% Process pec fin beats
clear all

% load in data
cd /Users/julievanderhoop/Documents/MATLAB/FHL/FinBeats
load('June2015_FinData')

% get variable names
a = whos; 

% automate filename generation and pec fin calculation 
for i = 1:48
filename = a(i).name;
% calculate pectoral fin frequency
Hz(i,1) = pecHz(eval(filename));
a(i).Hz = Hz(i,1);
% calculate pectoral and caudal waiting times
[caudwait,pecwait,cauduse] = FinWtime(eval(filename));
% calculate CV of pectoral fin waiting time
CVpec(i,1) = std(pecwait)/mean(pecwait);
CVcaud(i,1) = std(caudwait)/mean(caudwait);
caud_use(i) = cauduse;
figure(1), hold on
cdfplot(pecwait)
end

caud_use = (caud_use'/180)*100; % calculate percentage of time
figure
plot(caud_use,'o')

return 

%% speeds are 1 2 3 repeating low medium high
speed = repmat([1 2 3]',16,1);
% turbulent == 0, laminar == 1 (straightener is IN)
flow = [0 0 0 1 1 1 0 0 0 1 1 1 0 0 0 1 1 1 1 1 1 0 0 0 1 1 1 0 0 0 0 0 0 1 1 1 1 1 1 0 0 0 0 0 0 1 1 1];     
% fish ID
fish = [repmat(10,1,6),repmat(11,1,6),repmat(13,1,6),repmat(15,1,6),...
    repmat(19,1,6),repmat(5,1,6),repmat(6,1,6),repmat(9,1,6),]';

% stats
[p,t,stats] = anovan(Hz,{flow fish speed},'sstype',2,'varnames',{'Flow';'Fish';'Speed'});
[c,m,h,names] = multcompare(stats,'dim',1);

%% plot in some different ways to separate lam/turb/speeds
figure(3); clf; hold on
f0 = find(flow == 0);
f0s1 = find(speed(f0) == 1);
f0s2 = find(speed(f0) == 2);
f0s3 = find(speed(f0) == 3);
plot(1,mean(Hz(f0(f0s1))),'bo',2,mean(Hz(f0(f0s2))),'bo',3,mean(Hz(f0(f0s3))),'bo','MarkerFaceColor','b')

f1 = find(flow == 1);
f1s1 = find(speed(f1) == 1);
f1s2 = find(speed(f1) == 2);
f1s3 = find(speed(f1) == 3);
plot(1,mean(Hz(f1(f1s1))),'r^',2,mean(Hz(f1(f1s2))),'r^',3,mean(Hz(f1(f1s3))),'r^','MarkerFaceColor','r')
xlabel('Speed'); xlim([0.5 3.5]); set(gca,'xtick',[1 2 3],'xticklabel',{'Low','Medium','High'})
ylabel('Pectoral Fin Beat Frequency (Hz)')
adjustfigurefont; box on


figure(2); clf; hold on
plot(0,mean(Hz(f0(f0s1))),'bo','MarkerFaceColor','b')
plot(1,mean(Hz(f1(f1s1))),'r^','MarkerFaceColor','r')
plot(0,mean(Hz(f0(f0s2))),'bo','MarkerFaceColor','b')
plot(1,mean(Hz(f1(f1s2))),'r^','MarkerFaceColor','r')
plot(0,mean(Hz(f0(f0s3))),'bo','MarkerFaceColor','b')
plot(1,mean(Hz(f1(f1s3))),'r^','MarkerFaceColor','r')
xlabel('Flow Condition'); xlim([-0.5 1.5]); set(gca,'xtick',[0 1],'xticklabel',{'Low','High'})
ylabel('Pectoral Fin Beat Frequency (Hz)')
adjustfigurefont

%% How much higher? 
increase = mean([mean(Hz(f1(f1s1)))/mean(Hz(f0(f0s1))),mean(Hz(f1(f1s2)))/mean(Hz(f0(f0s2))),mean(Hz(f1(f1s3)))/mean(Hz(f0(f0s3)))])
