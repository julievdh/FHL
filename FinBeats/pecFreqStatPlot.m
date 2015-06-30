% Process pec fin beats
clear all

% load in data
load('June2015_FinData')

% get variable names
a = whos; 

% automate filename generation and pec fin calculation 
for i = 1:48
filename = a(i).name;
% calculate pectoral fin frequency
Hz(i,1) = pecHz(eval(filename));
end

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
figure(1); clf; hold on
f0 = find(flow == 0);
f0s1 = find(speed(f0) == 1);
f0s2 = find(speed(f0) == 2);
f0s3 = find(speed(f0) == 3);
plot(1,mean(Hz(f0(f0s1))),'bo',2,mean(Hz(f0(f0s2))),'bo',3,mean(Hz(f0(f0s3))),'bo')

f1 = find(flow == 1);
f1s1 = find(speed(f1) == 1);
f1s2 = find(speed(f1) == 2);
f1s3 = find(speed(f1) == 3);
plot(1,mean(Hz(f1(f1s1))),'ro',2,mean(Hz(f1(f1s2))),'ro',3,mean(Hz(f1(f1s3))),'ro')
xlabel('Speed'); xlim([0.5 3.5]); set(gca,'xtick',[1 2 3],'xticklabel',{'Low','Medium','High'})
ylabel('Pectoral Fin Beat Frequency (Hz)')
adjustfigurefont


figure(2); clf; hold on
plot(0,mean(Hz(f0(f0s1))),'bo')
plot(1,mean(Hz(f1(f1s1))),'ro')
plot(0,mean(Hz(f0(f0s2))),'bo')
plot(1,mean(Hz(f1(f1s2))),'ro')
plot(0,mean(Hz(f0(f0s3))),'bo')
plot(1,mean(Hz(f1(f1s3))),'ro')
xlabel('Flow Condition'); xlim([-0.5 1.5]); set(gca,'xtick',[0 1],'xticklabel',{'Low','High'})
ylabel('Pectoral Fin Beat Frequency (Hz)')
adjustfigurefont