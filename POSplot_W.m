close all; clear all; clc

%%

% load Turbulent data
cd /Volumes/DQ-2012-2/FHL_Fish/Tracker/Fish19/T/SelectSpeeds

dT = dir('*.csv');
for i = (length(dT)/2)+1:length(dT);
vidT(i).name = dT(i).name;
m = csvread(dT(i).name,3,0);
vidT(i).matrix = m;
clear m
end

% load Laminar data
cd /Volumes/DQ-2012-2/FHL_Fish/Tracker/Fish19/L/SelectSpeeds

dL = dir('*.csv');
for i = (length(dL)/2)+1:length(dL);
vidL(i).name = dL(i).name;
m = csvread(dL(i).name,3,0);
vidL(i).matrix = m;
clear m
end

% reset path
cd /Users/julievanderhoop/Documents/MATLAB/FHL

%% 

% select speed = 0.5
i = 6;
display(dT(i).name)

% select data for both T and L conditions
dataT = vidT(1,i).matrix;
dataT = dataT(any(dataT~=0,2),:);
dataT = dataT(1:540,:);
dataL = vidL(1,i).matrix;
dataL = dataL(any(dataL~=0,2),:);
dataL = dataL(1:540,:);

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


return

%% 

% set histogram bins
bins = [0:0.01:0.25];

figure(20)
set(gcf,'Position',[360 240 780 440])

% plot histogram of two treatments
subplot(341)
hold on
hist(xT,bins); hist(xL,bins)
xlabel('X Position (m)'); ylabel('Frequency')
xlim([0 .25]) % CHECK MEASUREMENT
h = findobj(gca,'Type','patch');
set(h(1),'FaceColor','r');
alpha(0.5)

subplot(345)
hold on
binvalues = hist(yT,bins);
barh(binvalues)
binvalues = hist(yL,bins);
barh(binvalues)
% hist(yT,bins); hist(yL,bins)
ylabel('Y Position (cm)'); xlabel('Frequency')
ylim([0 9.5])
h = findobj(gca,'Type','patch');
set(h(1),'FaceColor','r');
% set(gca,'CameraUpVector',[1,0,0]);
alpha(0.5)
% set(gca,'YTickLabel',['0';'0.02';'0.04';'0.06';'0.08';])


subplot(349)
hold on
binvalues = hist(zT,bins);
barh(binvalues)
binvalues = hist(zL,bins);
barh(binvalues)
ylabel('Z Position (cm)'); xlabel('Frequency')
ylim([0 11])
h = findobj(gca,'Type','patch');
set(h(1),'FaceColor','r');
alpha(0.5)
% set(gca,'YTickLabel',['0';'0.05';'0.1';])

% plot time series in each axis
subplot(3,4,2:3)
plot(time,xT,'b',time,xL,'r','LineWidth',1.5)
xlabel('Time (s)'); ylabel('X Position (m)')
% insert title
new_title = strrep(dT(i).name, '_', '-')
title(new_title)

subplot(3,4,6:7)
plot(time,yT,'b',time,yL,'r','LineWidth',1.5)
xlabel('Time (s)'); ylabel('Y Position (m)')
ylim([0 0.09])

subplot(3,4,10:11)
plot(time,zT,'b',time,zL,'r','LineWidth',1.5)
xlabel('Time (s)'); ylabel('Z Position (m)')
ylim([0 0.11])

% plot periods/frequencies
subplot(344); hold on
[~,~,power,freq,idx] = FHL_fft(xL,frameL);
plot((1./freq(idx))/3,power(idx),'r.')
plot((1./freq)/3,power,'r')
[~,~,power,freq,idx] = FHL_fft(xT,frameT);
plot((1./freq(idx))/3,power(idx),'b.')
plot((1./freq)/3,power,'b')
xlim([0 100]);  xlabel('Period (seconds/cycle)'); ylabel('Power')

subplot(348); hold on
[~,~,power,freq,idx] = FHL_fft(yL,frameL);
plot((1./freq(idx))/3,power(idx),'r.')
plot((1./freq)/3,power,'r')
display('y position dominant frequency - laminar')
display((1./freq(idx))/3)
[~,~,power,freq,idx] = FHL_fft(yT,frameT);
plot((1./freq(idx))/3,power(idx),'b.')
plot((1./freq)/3,power,'b')
xlim([0 20]); xlabel('Period (seconds/cycle)'); ylabel('Power')
display('y position dominant frequency - turbulent')
display((1./freq(idx))/3)


subplot(3,4,12); hold on
[~,~,power,freq,idx] = FHL_fft(zL,frameL);
plot((1./freq(idx))/3,power(idx),'r.')
plot((1./freq)/3,power,'r')
[~,~,power,freq,idx] = FHL_fft(zT,frameT);
plot((1./freq(idx))/3,power(idx),'b.')
plot((1./freq)/3,power,'b')
xlim([0 20]);  xlabel('Period (seconds/cycle)'); ylabel('Power')


figure(30)
plot3(flipud(time),flipud(yT),flipud(zT),'b')
hold on
plot3(flipud(time),flipud(yL),flipud(zL),'r')

%%
% get COM from data structure
% FOR LAMINAR
COMxL = -dataL(:,11);
COMyL = dataL(:,10);

% FOR TURBULENT
COMxT = -dataT(:,11);
COMyT = dataT(:,10);
