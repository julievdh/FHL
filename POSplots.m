close all; clear all

% load Turbulent data
cd /Volumes/DQ-2012-2/FHL_Fish/Tracker/Fish9/T/SelectSpeeds

dT = dir('*.csv');
for i = (length(dT)/2)+1:length(dT);
vidT(i).name = dT(i).name;
m = csvread(dT(i).name,3,0);
vidT(i).matrix = m;
clear m
end

% load Laminar data
cd /Volumes/DQ-2012-2/FHL_Fish/Tracker/Fish9/L/SelectSpeeds

dL = dir('*.csv');
for i = (length(dL)/2)+1:length(dL);
vidL(i).name = dL(i).name;
m = csvread(dL(i).name,3,0);
vidL(i).matrix = m;
clear m
end


% select speed = 0.5
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

% set histogram bins
bins = [0:0.01:0.25];

figure(10)
set(gcf,'Position',[360 240 780 440])
subplot(331)
hold on
hist(xT,bins); hist(xL,bins)
xlabel('X Position (m)'); ylabel('Frequency')
xlim([0 .25]) % CHECK MEASUREMENT
h = findobj(gca,'Type','patch');
set(h(1),'FaceColor','r');
alpha(0.5)


subplot(334)
hold on
hist(yT,bins); hist(yL,bins)
xlabel('Y Position (m)'); ylabel('Frequency')
xlim([0 .09])
h = findobj(gca,'Type','patch');
set(h(1),'FaceColor','r');
set(gca,'CameraUpVector',[1,0,0]);
alpha(0.5)


subplot(337)
hold on
hist(zT,bins); hist(zL,bins)
xlabel('Z Position (m)'); ylabel('Frequency')
xlim([0 .11])
h = findobj(gca,'Type','patch');
set(h(1),'FaceColor','r');
set(gca,'CameraUpVector',[-1,0,0]);
alpha(0.5)


subplot(3,3,2:3)
plot(time,xT,'b.',time,xL,'r.')
xlabel('Time (s)'); ylabel('X Position (m)')

subplot(3,3,5:6)
plot(time,yT,'b.',time,yL,'r.')
xlabel('Time (s)'); ylabel('Y Position (m)')
ylim([0 0.09])

subplot(3,3,8:9)
plot(time,zT,'b.',time,zL,'r.')
xlabel('Time (s)'); ylabel('Z Position (m)')
ylim([0 0.11])

figure(20)
plot3(flipud(time),flipud(yT),flipud(zT),'r')
hold on
plot3(flipud(time),flipud(yL),flipud(zL),'b')

