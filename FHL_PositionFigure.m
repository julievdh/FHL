close all; clear all

% load Turbulent data
cd /Volumes/DQ-2012-2/FHL_Fish/Tracker/Fish15/T/SelectSpeeds

dT = dir('*.csv');
for i = (length(dT)/2)+1:length(dT);
vidT(i).name = dT(i).name;
m = csvread(dT(i).name,3,0);
vidT(i).matrix = m;
clear m
end

% load Laminar data
cd /Volumes/DQ-2012-2/FHL_Fish/Tracker/Fish15/L/SelectSpeeds

dL = dir('*.csv');
for i = (length(dL)/2)+1:length(dL);
vidL(i).name = dL(i).name;
m = csvread(dL(i).name,3,0);
vidL(i).matrix = m;
clear m
end


% select speed = 1.5 BLs
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
time = dataT(:,1); % instead of frame, use time in seconds


% x coordinate from aerial = y coordinate real
yT = dataT(:,2);
yL = dataL(:,2);

% y coordinate from aerial = x coordinate real
xT = -dataT(:,3);
xL = -dataL(:,3);

% x coordinate from lateral = z coordinate real
zT = dataT(:,6);
zL = dataL(:,6);
 
%%
figure(10)
set(gcf,'Position',[360 240 780 440])
subplot(4,3,[1 4]); hold on
plot(xT,yT,'b.',xL,yL,'r.','MarkerSize',10)
ylabel('Y Position (m)') 
box on
axis([0 0.06 0 0.1])
text(0.004, 0.092,'a','Fontsize',12)


% plot centroid
FHL_centroid
line([cxL cxL],[cyL-median(dyL) cyL+median(dyL)],'color','k')
line([cxL-median(dxL) cxL+median(dxL)],[cyL cyL],'color','k')

line([cxT cxT],[cyT-median(dyT) cyT+median(dyT)],'color','k')
line([cxT-median(dxT) cxT+median(dxT)],[cyT cyT],'color','k')

subplot(4,3,2:3)
plot(time,xT,'b',time,xL,'r')
ylabel('X Position (m)')
xlim([0 180]); ylim([0 0.06])
text(4,0.051,'b','FontSize',12)


subplot(4,3,5:6)
plot(time,yT,'b',time,yL,'r')
ylabel('Y Position (m)')
xlim([0 180]); ylim([0 0.08])
text(4,0.069,'c','FontSize',12)

%% Load another fish


% load Turbulent data
cd /Volumes/DQ-2012-2/FHL_Fish/Tracker/Fish15/T/SelectSpeeds

dT = dir('*.csv');
for i = (length(dT)/2)+1:length(dT);
vidT(i).name = dT(i).name;
m = csvread(dT(i).name,3,0);
vidT(i).matrix = m;
clear m
end

% load Laminar data
cd /Volumes/DQ-2012-2/FHL_Fish/Tracker/Fish15/L/SelectSpeeds

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
time = dataT(:,1); % instead of frame, use time in seconds


% x coordinate from aerial = y coordinate real
yT = dataT(:,2);
yL = dataL(:,2);

% y coordinate from aerial = x coordinate real
xT = -dataT(:,3);
xL = -dataL(:,3);

% x coordinate from lateral = z coordinate real
zT = dataT(:,6);
zL = dataL(:,6);

%% plot

subplot(4,3,[7 10]); hold on
plot(xT,yT,'b.',xL,yL,'r.','MarkerSize',10)
xlabel('X Position (m)'); ylabel('Y Position (m)')
box on
axis([0 0.06 0 0.1])
text(0.004, 0.09,'d','Fontsize',12)

% plot centroid
FHL_centroid
line([cxL cxL],[cyL-median(dyL) cyL+median(dyL)],'color','k')
line([cxL-median(dxL) cxL+median(dxL)],[cyL cyL],'color','k')

line([cxT cxT],[cyT-median(dyT) cyT+median(dyT)],'color','k')
line([cxT-median(dxT) cxT+median(dxT)],[cyT cyT],'color','k')



subplot(4,3,8:9)
plot(time,xT,'b',time,xL,'r')
ylabel('X Position (m)')
xlim([0 180]); ylim([0 0.06])
text(4,0.051,'e','FontSize',12)

subplot(4,3,11:12)
plot(time,yT,'b',time,yL,'r')
xlabel('Time (s)'); ylabel('Y Position (m)')
xlim([0 180]); ylim([0 0.08])
text(4,0.069,'f','FontSize',12)

%%

cd /Users/julievanderhoop/Documents/MATLAB/FHL
print('-depsc','PositionFigure')
