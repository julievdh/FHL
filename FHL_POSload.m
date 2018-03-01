% FHL_POSload
clear all; clc

% load Turbulent data
cd /Volumes/DQ-2012-2/FHL_Fish/Tracker/Fish5/T/SelectSpeeds

dT = dir('*.csv');
for i = (length(dT)/2)+1:length(dT);
vidT(i).name = dT(i).name;
m = csvread(dT(i).name,3,0);
vidT(i).matrix = m;
clear m
end

% load Laminar data
cd /Volumes/DQ-2012-2/FHL_Fish/Tracker/Fish5/L/SelectSpeeds

dL = dir('*.csv');
for i = (length(dL)/2)+1:length(dL);
vidL(i).name = dL(i).name;
m = csvread(dL(i).name,3,0);
vidL(i).matrix = m;
clear m
end

% reset path
cd /Volumes/DQ-2012-2/FHL_Fish/MATLAB/

%% 

% select speed: 4 = 0.5, 5 = 1.5, 6 = max (3.5, 4.0 or 4.5)
speed = 4;
display(dT(speed).name)
% display(speed)

% select data for both T and L conditions
dataT = vidT(1,speed).matrix;
dataT = dataT(any(dataT~=0,2),:);
dataT = dataT(1:540,:);
dataL = vidL(1,speed).matrix;
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

figure(speed); hold on
plot(xT,yT,'.')
plot(xL,yL,'r.')
