clear all

% load in data
load('June2015_FinData')

% get variable names
a = whos;

% automate filename generation
for i = 1:48
    filename = a(i).name;
    % is caudal fin used? find == 2
    used = find(eval(strcat(filename,'(:,2)')) == 2);
    if length(used) > 1;
        caud(i) = 1;
        %% find previous use of pectoral 
        prevP = eval(strcat(filename,'(used-1,1)'));
        if used(end) == length(eval(strcat(filename)))
        nextP = eval(strcat(filename,'(used(1:end-1)+1,1)'));
        else 
            nextP = eval(strcat(filename,'(used+1,1)'));
        end
        c = eval(strcat(filename,'(used,1)'));
        Ctime(i) = sum(nextP-c(1:length(nextP))); % total use of caudal fin in seconds
        PerCtime(i) = 100*(Ctime(i)/(eval(strcat(filename,'(end,1)')) - eval(strcat(filename,'(1,1)'))));
    end
end

%% other factors
speed = repmat([1 2 3]',16,1);
% turbulent == 0, laminar == 1 (straightener is IN)
flow = [0 0 0 1 1 1 0 0 0 1 1 1 0 0 0 1 1 1 1 1 1 0 0 0 1 1 1 0 0 0 0 0 0 1 1 1 1 1 1 0 0 0 0 0 0 1 1 1];     
% fish ID
fish = [repmat(10,1,6),repmat(11,1,6),repmat(13,1,6),repmat(15,1,6),...
    repmat(19,1,6),repmat(5,1,6),repmat(6,1,6),repmat(9,1,6),]';

%% plot in some different ways to separate lam/turb/speeds
figure(5); clf; hold on
f0 = find(flow == 0);
f0s1 = find(speed(f0) == 1);
f0s2 = find(speed(f0) == 2);
f0s3 = find(speed(f0) == 3);
plot(1,mean(PerCtime(f0(f0s1))),'bo',2,mean(PerCtime(f0(f0s2))),'bo',3,mean(PerCtime(f0(f0s3))),'bo')

f1 = find(flow == 1);
f1s1 = find(speed(f1) == 1);
f1s2 = find(speed(f1) == 2);
f1s3 = find(speed(f1) == 3);
plot(1,mean(PerCtime(f1(f1s1))),'ro',2,mean(PerCtime(f1(f1s2))),'ro',3,mean(PerCtime(f1(f1s3))),'ro')
xlabel('Speed'); xlim([0.5 3.5]); set(gca,'xtick',[1 2 3],'xticklabel',{'Low','Medium','High'})
ylabel('Caudal Fin Use (% Time)')
adjustfigurefont


figure(6); clf; hold on % change all of these to have error bars
plot(0,mean(PerCtime(f0(f0s1))),'bo')
plot(1,mean(PerCtime(f1(f1s1))),'ro')
plot(0,mean(PerCtime(f0(f0s2))),'bo')
plot(1,mean(PerCtime(f1(f1s2))),'ro')
plot(0,mean(PerCtime(f0(f0s3))),'bo')
plot(1,mean(PerCtime(f1(f1s3))),'ro')
xlabel('Flow Condition'); xlim([-0.5 1.5]); set(gca,'xtick',[0 1],'xticklabel',{'Low','High'})
ylabel('Caudal Fin Use (% Time)')
