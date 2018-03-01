% FHL Position Heatmap
function [xT,yT,zT,xL,yL,zL] = FHL_allFishPos(speed)
%% Fish 15
fish = 1;
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

%% select speed 
display(dT(speed).name)

% select data for both T and L conditions
dataT = vidT(1,speed).matrix; dataT = dataT(any(dataT~=0,2),:);
dataL = vidL(1,speed).matrix; dataL = dataL(any(dataL~=0,2),:);

% x coordinate from aerial = y coordinate real
yT = dataT(:,2); yL = dataL(:,2);
% y coordinate from aerial = x coordinate real
xT = -dataT(:,3); xL = -dataL(:,3);
% z coordinate 
zT = dataT(:,6); zL = dataL(:,6);

figure(10); 
subplot(121); hold on; histogram(xL); title('LTF') % x direction use LTF
subplot(122); hold on; histogram(xT); title('HTF') % x direction use HTF
[ax4,h3]=suplabel('X dimension'  ,'t');
figure(11); 
subplot(121); hold on; histogram(yL); title('LTF') % y direction use LTF
subplot(122); hold on; histogram(yT); title('HTF') % y direction use HTF 
[ax4,h3]=suplabel('Y dimension'  ,'t');
figure(12)
subplot(121); hold on; histogram(zL); title('LTF') % y direction use LTF
subplot(122); hold on; histogram(zT); title('HTF') % y direction use HTF 
[ax4,h3]=suplabel('Z dimension'  ,'t');

%% Fish 9
fish = fish+1;
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

% select speed = 4.0 BLs
display(dT(speed).name)

% select data for both T and L conditions
dataT = vidT(1,speed).matrix; dataT = dataT(any(dataT~=0,2),:);
dataL = vidL(1,speed).matrix; dataL = dataL(any(dataL~=0,2),:);

% x coordinate from aerial = y coordinate real
yT = vertcat(yT,dataT(1:540,2)); yL = vertcat(yL,dataL(1:540,2));
% y coordinate from aerial = x coordinate real
xT = vertcat(xT,-dataT(1:540,3)); xL = vertcat(xL,-dataL(1:540,3));
% z coordinate 
zT = vertcat(zT,dataT(1:540,6)); zL = vertcat(zL,dataL(1:540,6));

figure(10); 
subplot(121); hold on; histogram(-dataT(:,3))
subplot(122); hold on; histogram(-dataL(:,3))
figure(11); 
subplot(121); hold on; histogram(dataT(:,2))
subplot(122); hold on; histogram(dataL(:,2))
figure(12)
subplot(121); hold on; histogram(zL); title('LTF') % y direction use LTF
subplot(122); hold on; histogram(zT); title('HTF') % y direction use HTF 

%% Fish 19
fish = fish+1;
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

% select speed 
display(dT(speed).name)

% select data for both T and L conditions
dataT = vidT(1,speed).matrix; dataT = dataT(any(dataT~=0,2),:);
dataL = vidL(1,speed).matrix; dataL = dataL(any(dataL~=0,2),:);

% x coordinate from aerial = y coordinate real
yT = vertcat(yT,dataT(1:540,2)); yL = vertcat(yL,dataL(1:540,2));
% y coordinate from aerial = x coordinate real
xT = vertcat(xT,-dataT(1:540,3)); xL = vertcat(xL,-dataL(1:540,3));
% z coordinate 
zT = vertcat(zT,dataT(1:540,6)); zL = vertcat(zL,dataL(1:540,6));


figure(10); 
subplot(121); hold on; histogram(-dataT(:,3))
subplot(122); hold on; histogram(-dataL(:,3))
figure(11); 
subplot(121); hold on; histogram(dataT(:,2))
subplot(122); hold on; histogram(dataL(:,2))
figure(12)
subplot(121); hold on; histogram(zL); title('LTF') % y direction use LTF
subplot(122); hold on; histogram(zT); title('HTF') % y direction use HTF 

%% Fish 10
fish = fish+1;
% load Turbulent data
cd /Volumes/DQ-2012-2/FHL_Fish/Tracker/Fish10/T/SelectSpeeds
dT = dir('*.csv');
for i = (length(dT)/2)+1:length(dT);
    vidT(i).name = dT(i).name;
    m = csvread(dT(i).name,3,0);
    vidT(i).matrix = m;
    clear m
end

% load Laminar data
cd /Volumes/DQ-2012-2/FHL_Fish/Tracker/Fish10/L/SelectSpeeds
dL = dir('*.csv');
for i = (length(dL)/2)+1:length(dL);
    vidL(i).name = dL(i).name;
    m = csvread(dL(i).name,3,0);
    vidL(i).matrix = m;
    clear m
end

% select speed
display(dT(speed).name)

% select data for both T and L conditions
dataT = vidT(1,speed).matrix; dataT = dataT(any(dataT~=0,2),:);
dataL = vidL(1,speed).matrix; dataL = dataL(any(dataL~=0,2),:);


% x coordinate from aerial = y coordinate real
yT = vertcat(yT,dataT(1:540,2)); yL = vertcat(yL,dataL(1:540,2));
% y coordinate from aerial = x coordinate real
xT = vertcat(xT,-dataT(1:540,3)); xL = vertcat(xL,-dataL(1:540,3));
% z coordinate 
zT = vertcat(zT,dataT(1:540,6)); zL = vertcat(zL,dataL(1:540,6));


figure(10); 
subplot(121); hold on; histogram(-dataT(:,3))
subplot(122); hold on; histogram(-dataL(:,3))
figure(11); 
subplot(121); hold on; histogram(dataT(:,2))
subplot(122); hold on; histogram(dataL(:,2))
figure(12)
subplot(121); hold on; histogram(zL); title('LTF') % y direction use LTF
subplot(122); hold on; histogram(zT); title('HTF') % y direction use HTF 

%% Fish 11
fish = fish+1;
% load Turbulent data
cd /Volumes/DQ-2012-2/FHL_Fish/Tracker/Fish11/T/SelectSpeeds
dT = dir('*.csv');
for i = (length(dT)/2)+1:length(dT);
    vidT(i).name = dT(i).name;
    m = csvread(dT(i).name,3,0);
    vidT(i).matrix = m;
    clear m
end

% load Laminar data
cd /Volumes/DQ-2012-2/FHL_Fish/Tracker/Fish11/L/SelectSpeeds
dL = dir('*.csv');
for i = (length(dL)/2)+1:length(dL);
    vidL(i).name = dL(i).name;
    m = csvread(dL(i).name,3,0);
    vidL(i).matrix = m;
    clear m
end

% select speed
display(dT(speed).name)

% select data for both T and L conditions
dataT = vidT(1,speed).matrix; dataT = dataT(any(dataT~=0,2),:);
dataL = vidL(1,speed).matrix; dataL = dataL(any(dataL~=0,2),:);

% x coordinate from aerial = y coordinate real
yT = vertcat(yT,dataT(1:540,2)); yL = vertcat(yL,dataL(1:540,2));
% y coordinate from aerial = x coordinate real
xT = vertcat(xT,-dataT(1:540,3)); xL = vertcat(xL,-dataL(1:540,3));
% z coordinate 
zT = vertcat(zT,dataT(1:540,6)); zL = vertcat(zL,dataL(1:540,6));


figure(10); 
subplot(121); hold on; histogram(-dataT(:,3))
subplot(122); hold on; histogram(-dataL(:,3))
figure(11); 
subplot(121); hold on; histogram(dataT(:,2))
subplot(122); hold on; histogram(dataL(:,2))
figure(12)
subplot(121); hold on; histogram(zL); title('LTF') % y direction use LTF
subplot(122); hold on; histogram(zT); title('HTF') % y direction use HTF 

%% Fish 5
fish = fish+1;
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

% select speed
display(dT(speed).name)

% select data for both T and L conditions
dataT = vidT(1,speed).matrix; dataT = dataT(any(dataT~=0,2),:);
dataL = vidL(1,speed).matrix; dataL = dataL(any(dataL~=0,2),:);

% x coordinate from aerial = y coordinate real
yT = vertcat(yT,dataT(1:540,2)); yL = vertcat(yL,dataL(1:540,2));
% y coordinate from aerial = x coordinate real
xT = vertcat(xT,-dataT(1:540,3)); xL = vertcat(xL,-dataL(1:540,3));
% z coordinate 
zT = vertcat(zT,dataT(1:540,6)); zL = vertcat(zL,dataL(1:540,6));


figure(10); 
subplot(121); hold on; histogram(-dataT(:,3))
subplot(122); hold on; histogram(-dataL(:,3))
figure(11); 
subplot(121); hold on; histogram(dataT(:,2))
subplot(122); hold on; histogram(dataL(:,2))
figure(12)
subplot(121); hold on; histogram(zL); title('LTF') % y direction use LTF
subplot(122); hold on; histogram(zT); title('HTF') % y direction use HTF 


%% Fish 6
fish = fish+1;
% load Turbulent data
cd /Volumes/DQ-2012-2/FHL_Fish/Tracker/Fish6/T/SelectSpeeds
dT = dir('*.csv');
for i = (length(dT)/2)+1:length(dT);
    vidT(i).name = dT(i).name;
    m = csvread(dT(i).name,3,0);
    vidT(i).matrix = m;
    clear m
end

% load Laminar data
cd /Volumes/DQ-2012-2/FHL_Fish/Tracker/Fish6/L/SelectSpeeds
dL = dir('*.csv');
for i = (length(dL)/2)+1:length(dL);
    vidL(i).name = dL(i).name;
    m = csvread(dL(i).name,3,0);
    vidL(i).matrix = m;
    clear m
end

% select speed
display(dT(speed).name)

% select data for both T and L conditions
dataT = vidT(1,speed).matrix; dataT = dataT(any(dataT~=0,2),:);
dataL = vidL(1,speed).matrix; dataL = dataL(any(dataL~=0,2),:);

% x coordinate from aerial = y coordinate real
yT = vertcat(yT,dataT(1:540,2)); yL = vertcat(yL,dataL(1:540,2));
% y coordinate from aerial = x coordinate real
xT = vertcat(xT,-dataT(1:540,3)); xL = vertcat(xL,-dataL(1:540,3));
% z coordinate 
zT = vertcat(zT,dataT(1:540,6)); zL = vertcat(zL,dataL(1:540,6));


figure(10); 
subplot(121); hold on; histogram(-dataT(:,3))
subplot(122); hold on; histogram(-dataL(:,3))
figure(11); 
subplot(121); hold on; histogram(dataT(:,2))
subplot(122); hold on; histogram(dataL(:,2))
figure(12)
subplot(121); hold on; histogram(zL); title('LTF') % y direction use LTF
subplot(122); hold on; histogram(zT); title('HTF') % y direction use HTF 


%% Fish 13
fish = fish+1;
% load Turbulent data
cd /Volumes/DQ-2012-2/FHL_Fish/Tracker/Fish13/T/SelectSpeeds
dT = dir('*.csv');
for i = (length(dT)/2)+1:length(dT);
    vidT(i).name = dT(i).name;
    m = csvread(dT(i).name,3,0);
    vidT(i).matrix = m;
    clear m
end

% load Laminar data
cd /Volumes/DQ-2012-2/FHL_Fish/Tracker/Fish13/L/SelectSpeeds
dL = dir('*.csv');
for i = (length(dL)/2)+1:length(dL);
    vidL(i).name = dL(i).name;
    m = csvread(dL(i).name,3,0);
    vidL(i).matrix = m;
    clear m
end

% select speed
display(dT(speed).name)

% select data for both T and L conditions
dataT = vidT(1,speed).matrix; dataT = dataT(any(dataT~=0,2),:);
dataL = vidL(1,speed).matrix; dataL = dataL(any(dataL~=0,2),:);

% x coordinate from aerial = y coordinate real
yT = vertcat(yT,dataT(1:540,2)); yL = vertcat(yL,dataL(1:540,2));
% y coordinate from aerial = x coordinate real
xT = vertcat(xT,-dataT(1:540,3)); xL = vertcat(xL,-dataL(1:540,3));
% z coordinate 
zT = vertcat(zT,dataT(1:540,6)); zL = vertcat(zL,dataL(1:540,6));


figure(10); 
subplot(121); hold on; histogram(-dataT(:,3))
subplot(122); hold on; histogram(-dataL(:,3))
figure(11); 
subplot(121); hold on; histogram(dataT(:,2))
subplot(122); hold on; histogram(dataL(:,2))
figure(12)
subplot(121); hold on; histogram(zL); title('LTF') % y direction use LTF
subplot(122); hold on; histogram(zT); title('HTF') % y direction use HTF 


end