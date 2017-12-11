close all; clear all

F = 9; % fish

% load Turbulent data
cd(strcat('/Volumes/DQ-2012-2/FHL_Fish/Tracker/Fish',num2str(F),'/T/SelectSpeeds'))

dT = dir('*.csv');
for i = (length(dT)/2)+1:length(dT);
    vidT(i).name = dT(i).name;
    m = csvread(dT(i).name,3,0);
    vidT(i).matrix = m;
    clear m
end

% load Laminar data
cd(strcat('/Volumes/DQ-2012-2/FHL_Fish/Tracker/Fish',num2str(F),'/L/SelectSpeeds'))

dL = dir('*.csv');
for i = (length(dL)/2)+1:length(dL);
    vidL(i).name = dL(i).name;
    m = csvread(dL(i).name,3,0);
    vidL(i).matrix = m;
    clear m
end
%% select speed = 1.5 BLs
i = 4;
display(dT(i).name)

% select data for both T and L conditions
dataT = vidT(1,i).matrix;
dataT = dataT(any(dataT~=0,2),:);
dataL = vidL(1,i).matrix;
dataL = dataL(any(dataL~=0,2),:);

% convert coordinates from digitized to real
frameT = dataT(:,4);
frameL = dataL(:,4);
time = dataT(1:540,1); % instead of frame, use time in seconds

% x coordinate from aerial = y coordinate real
yT = dataT(1:540,2);
yL = dataL(1:540,2);

% y coordinate from aerial = x coordinate real
xT = -dataT(1:540,3);
xL = -dataL(1:540,3);

% x coordinate from lateral = z coordinate real
zT = dataT(1:540,6);
zL = dataL(1:540,6);

% centre of mass 
comxT = -dataT(1:540,11);
comyT = dataT(1:540,10);
comxL = -dataL(1:540,11);
comyL = dataL(1:540,10);


%% SNOUT AND COM THROUGH TIME
figure(12), clf, 
subplot(131), hold on
n = 540;
plot(xT(1:n),yT(1:n),'o-')
plot(comxT(1:n),comyT(1:n),'o-')
for i = 1:n
h = patchline([xT(i) comxT(i)],[yT(i) comyT(i)],'edgealpha',0.25);
end
ylim([0 0.09]);


figure(13), clf, 
subplot(131), hold on
plot(xL(1:n),yL(1:n),'o-')
plot(comxL(1:n),comyL(1:n),'o-')
for i = 1:n
h = patchline([xL(i) comxL(i)],[yL(i) comyL(i)],'edgealpha',0.25);
end
ylim([0 0.09]);


figure(14), clf, 
subplot(131), hold on
for i = 1:n
h = patchline([xL(i) comxL(i)],[yL(i)+i/10000 comyL(i)+i/10000],'edgealpha',0.25,'edgecolor','r');
h = patchline([xT(i)+0.06 comxT(i)+0.06],[yT(i)+i/10000 comyT(i)+i/10000],'edgealpha',0.25, 'edgecolor','b');
end


%% select speed = 1.5 BLs
i = 5;
display(dT(i).name)

% select data for both T and L conditions
dataT = vidT(1,i).matrix;
dataT = dataT(any(dataT~=0,2),:);
dataL = vidL(1,i).matrix;
dataL = dataL(any(dataL~=0,2),:);

% convert coordinates from digitized to real
frameT = dataT(:,4);
frameL = dataL(:,4);
time = dataT(1:540,1); % instead of frame, use time in seconds

% x coordinate from aerial = y coordinate real
yT = dataT(1:540,2);
yL = dataL(1:540,2);

% y coordinate from aerial = x coordinate real
xT = -dataT(1:540,3);
xL = -dataL(1:540,3);

% x coordinate from lateral = z coordinate real
zT = dataT(1:540,6);
zL = dataL(1:540,6);

% centre of mass 
comxT = -dataT(1:540,11);
comyT = dataT(1:540,10);
comxL = -dataL(1:540,11);
comyL = dataL(1:540,10);


%% SNOUT AND COM THROUGH TIME
figure(12), 
subplot(132), hold on
n = 540;
plot(xT(1:n),yT(1:n),'o-')
plot(comxT(1:n),comyT(1:n),'o-')
for i = 1:n
h = patchline([xT(i) comxT(i)],[yT(i) comyT(i)],'edgealpha',0.25);
end
ylim([0 0.09]);


figure(13), 
subplot(132), hold on
plot(xL(1:n),yL(1:n),'o-')
plot(comxL(1:n),comyL(1:n),'o-')
for i = 1:n
h = patchline([xL(i) comxL(i)],[yL(i) comyL(i)],'edgealpha',0.25);
end
ylim([0 0.09]);


figure(14),  
subplot(132), hold on
for i = 1:n
h = patchline([xL(i) comxL(i)],[yL(i)+i/10000 comyL(i)+i/10000],'edgealpha',0.25,'edgecolor','r');
h = patchline([xT(i)+0.06 comxT(i)+0.06],[yT(i)+i/10000 comyT(i)+i/10000],'edgealpha',0.25,'edgecolor','b');
end


%%
figure(10); clf
set(gcf,'Position',[360 240 780 440])
subplot('Position',[0.06 0.55 0.3 0.4]); hold on
sT = scatter3(xT,yT,zT,'bo','markerfacecolor','blue','markeredgealpha',0.75);
sL = scatter3(xL,yL,zL,'r^','markerfacecolor','red','markeredgealpha',0.75);
alpha(sT,0.5), alpha(sL,0.5)
ylabel('Y Position (m)'), zlabel('Z Position (m)'), xlabel('X Position (m)')
view(-37, 38);
box on
axis([0 0.26 0 0.09 0 0.11])
%plot([0 0.26],[0 0],'linewidth',2,'color','k') % wall
%plot([0 0.26],[0.09 0.09],'linewidth',2,'color','k') % wall
%plot([0 0],[0 0.09],'linewidth',2,'color','k') % wall
%plot([0.26 0.26],[0 0.09],'linewidth',2,'color','k') % wall
text(0.01, 0.083,0.1,'A','Fontsize',12,'FontWeight','Bold')

%% plot centroid
FHL_centroid
plot3([cxL cxL],[cyL-median(dyL) cyL+median(dyL)],[0 0],'color','k')
plot3([cxL-sdxL cxL+sdxL],[cyL cyL],[0 0],'color','k')
plot3([cxL cxL],[0.09 0.09],[czL-sdzL czL+sdzL],'color','k')
plot3([cxL-sdxL cxL+sdxL],[0.09 0.09],[czL czL],'color','k')

plot3([cxT cxT],[cyT-sdyT cyT+sdyT],[0 0],'color','k')
plot3([cxT-sdxT cxT+sdxT],[cyT cyT],[0 0],'color','k')
plot3([cxT cxT],[0.09 0.09],[czT-sdzT czT+sdzT],'color','k')
plot3([cxT-sdxT cxT+sdxT],[0.09 0.09],[czT czT],'color','k')

%% 
subplot('Position',[0.45 0.83 0.52 0.13]); hold on
plot(time,xT,'b',time,xL,'r--')
ylabel('X (m)')
xlim([0 180]); ylim([0 0.06]); box on; set(gca,'xticklabel','')
plot([0 180],[0 0],'linewidth',2,'color','k') % wall
% plot([180 180],[0 0.06],'linewidth',2,'color','k') % wall
text(4,0.051,'B','FontSize',12,'FontWeight','Bold')

subplot('Position',[0.45 0.69 0.52 0.13]); hold on
plot(time,yT,'b',time,yL,'r--')
ylabel('Y (m)')
xlim([0 180]); ylim([0 0.09]); box on; set(gca,'xticklabel','')
plot([0 180],[0 0],'linewidth',2,'color','k') % wall
plot([0 180],[0.09 0.09],'linewidth',2,'color','k') % wall
text(4,0.075,'C','FontSize',12,'FontWeight','Bold')

subplot('Position',[0.45 0.55 0.52 0.13]); hold on
plot(time,zT,'b',time,zL,'r--')
ylabel('Z (m)')
xlim([0 180]); ylim([0 0.11]); box on
plot([0 180],[0 0],'linewidth',2,'color','k') % wall
plot([0 180],[0.11 0.11],'linewidth',2,'color','k') % wall
text(4,0.09,'D','FontSize',12,'FontWeight','Bold')

%% Same fish, different speeds

% load Turbulent data
cd(strcat('/Volumes/DQ-2012-2/FHL_Fish/Tracker/Fish',num2str(F),'/T/SelectSpeeds'))

dT = dir('*.csv');
for i = (length(dT)/2)+1:length(dT);
    vidT(i).name = dT(i).name;
    m = csvread(dT(i).name,3,0);
    vidT(i).matrix = m;
    clear m
end

% load Laminar data
cd(strcat('/Volumes/DQ-2012-2/FHL_Fish/Tracker/Fish',num2str(F),'/L/SelectSpeeds'))

dL = dir('*.csv');
for i = (length(dL)/2)+1:length(dL);
    vidL(i).name = dL(i).name;
    m = csvread(dL(i).name,3,0);
    vidL(i).matrix = m;
    clear m
end


% select speed = 1.5 BLs
i = 6;
display(dT(i).name)

% select data for both T and L conditions
dataT = vidT(1,i).matrix;
dataT = dataT(any(dataT~=0,2),:);
dataL = vidL(1,i).matrix;
dataL = dataL(any(dataL~=0,2),:);

% convert coordinates from digitized to real
frameT = dataT(:,4);
frameL = dataL(:,4);
time = dataT(1:540,1); % instead of frame, use time in seconds


% x coordinate from aerial = y coordinate real
yT = dataT(1:540,2);
yL = dataL(1:540,2);

% y coordinate from aerial = x coordinate real
xT = -dataT(1:540,3);
xL = -dataL(1:540,3);

% x coordinate from lateral = z coordinate real
zT = dataT(1:540,6);
zL = dataL(1:540,6);

% centre of mass 
comxT = -dataT(1:540,11);
comyT = dataT(1:540,10);
comxL = -dataL(1:540,11);
comyL = dataL(1:540,10);

%% plot

subplot('Position',[0.06 0.08 0.3 0.4]); hold on
sT = scatter3(xT,yT,zT,'bo','markerfacecolor','blue','markeredgealpha',0.75);
sL = scatter3(xL,yL,zL,'r^','markerfacecolor','red','markeredgealpha',0.75);
alpha(sT,0.5), alpha(sL,0.5) % set transparency
ylabel('Y Position (m)'), zlabel('Z Position (m)'), xlabel('X Position (m)')
view(-37, 38);
box on
axis([0 0.26 0 0.09 0 0.11])

text(0.01, 0.083,0.10,'E','Fontsize',12,'FontWeight','Bold')
% plot([0 0.26],[0 0],'linewidth',2,'color','k') % wall
% plot([0 0.26],[0.09 0.09],'linewidth',2,'color','k') % wall
% plot([0 0],[0 0.09],'linewidth',2,'color','k') % wall
% plot([0.26 0.26],[0 0.09],'linewidth',2,'color','k') % wall

%% plot centroid
FHL_centroid
plot3([cxL cxL],[cyL-median(dyL) cyL+median(dyL)],[0 0],'color','k')
plot3([cxL-sdxL cxL+sdxL],[cyL cyL],[0 0],'color','k')
plot3([cxL cxL],[0.09 0.09],[czL-sdzL czL+sdzL],'color','k')
plot3([cxL-sdxL cxL+sdxL],[0.09 0.09],[czL czL],'color','k')

plot3([cxT cxT],[cyT-sdyT cyT+sdyT],[0 0],'color','k')
plot3([cxT-sdxT cxT+sdxT],[cyT cyT],[0 0],'color','k')
plot3([cxT cxT],[0.09 0.09],[czT-sdzT czT+sdzT],'color','k')
plot3([cxT-sdxT cxT+sdxT],[0.09 0.09],[czT czT],'color','k')


subplot('Position',[0.45 0.36 0.52 0.13]); hold on
plot(time,xT,'b',time,xL,'r--')
ylabel('X (m)')
xlim([0 180]); ylim([0 0.06]); box on; set(gca,'xticklabel','')
plot([0 180],[0 0],'linewidth',2,'color','k') % wall
text(4,0.051,'F','FontSize',12,'FontWeight','Bold')

subplot('Position',[0.45 0.22 0.52 0.13]); hold on
plot(time,yT,'b',time,yL,'r--')
ylabel('Y (m)')
xlim([0 180]); ylim([0 0.09]); box on; set(gca,'xticklabel','')
plot([0 180],[0 0],'linewidth',2,'color','k') % wall
plot([0 180],[0.09 0.09],'linewidth',2,'color','k') % wall
text(4,0.075,'G','FontSize',12,'FontWeight','Bold')

subplot('Position',[0.45 0.08 0.52 0.13]); hold on
plot(time,zT,'b',time,zL,'r--')
xlabel('Time (s)'); ylabel('Z (m)')
xlim([0 180]); ylim([0 0.11]); box on
plot([0 180],[0 0],'linewidth',2,'color','k') % wall
plot([0 180],[0.11 0.11],'linewidth',2,'color','k') % wall
text(4,0.09,'H','FontSize',12,'FontWeight','Bold')

adjustfigurefont
%%
set(gcf,'PaperPositionMode','auto')

cd /Users/julievanderhoop/Documents/MATLAB/FHL
print('-dpng',strcat('PositionFigure','_',vidT(i).name(1:6)),'-r300')

%% SNOUT VS COM THROUGH TIME

figure(10), clf, hold on
for i = 1:540
plot([vidL(6).matrix(i,3) vidL(6).matrix(i,11)]+i/100,[vidL(6).matrix(i,2) vidL(6).matrix(i,10)],'color','r')
plot([vidT(6).matrix(i,3) vidT(6).matrix(i,11)]+i/100,[vidT(6).matrix(i,2) vidT(6).matrix(i,10)],'color','b')

end
plot(vidL(6).matrix(:,3)+((1:540)/100)',vidL(6).matrix(:,2),'o-')
plot(vidL(6).matrix(:,11)+((1:540)/100)',vidL(6).matrix(:,10),'o-')
plot(vidT(6).matrix(:,3)+((1:540)/100)',vidT(6).matrix(:,2),'o-')
plot(vidT(6).matrix(:,11)+((1:540)/100)',vidT(6).matrix(:,10),'o-')
ylim([0 0.09]);

figure(11), clf, hold on
plot3(xT,yT,zT)
plot3(1:540,comxL,comyL)
for i = 1:540
plot3([i i],[xL(i) comxL(i)],[yL(i) comyL(i)])
end

%%
figure(12),
subplot(133), hold on
n = 540;
plot(xT(1:n),yT(1:n),'o-')
plot(comxT(1:n),comyT(1:n),'o-')
for i = 1:n
h = patchline([xT(i) comxT(i)],[yT(i) comyT(i)],'edgealpha',0.25);
end
ylim([0 0.09]);


figure(13), 
subplot(133), hold on
plot(xL(1:n),yL(1:n),'o-')
plot(comxL(1:n),comyL(1:n),'o-')
for i = 1:n
h = patchline([xL(i) comxL(i)],[yL(i) comyL(i)],'edgealpha',0.25);
end
ylim([0 0.09]);


figure(14), 
subplot(133), hold on
for i = 1:n
h = patchline([xL(i) comxL(i)],[yL(i)+i/10000 comyL(i)+i/10000],'edgealpha',0.25,'edgecolor','r');
h = patchline([xT(i)+0.06 comxT(i)+0.06],[yT(i)+i/10000 comyT(i)+i/10000],'edgealpha',0.25,'edgecolor','b');
end

% what is the angle between snout and COM? 
% rise over run
thL = (yL - comyL)./(xL - comxL);
thT = (yT - comyT)./(xT - comxT);