figure(20)

subplot(411)
plot(time,xT,'b',time,xL,'r','LineWidth',1.5)
ylabel('X Position (m)','FontSize',12)
xlim([0 180]); ylim([0 0.25])


subplot(413)
plot(time,yT,'b',time,yL,'r','LineWidth',1.5)
ylabel('Y Position (m)','FontSize',12)
xlim([0 180]); ylim([0 0.09])


%%

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

% reset path
cd /Volumes/DQ-2012-2/FHL_Fish/MATLAB/

%% 

% select speed = 0.5
i = 5;
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


%% 

subplot(412)
plot(time,xT,'b',time,xL,'r','LineWidth',1.5)
ylabel('X Position (m)','FontSize',12)
xlim([0 180]); ylim([0 0.25])

subplot(414)
plot(time,yT,'b',time,yL,'r','LineWidth',1.5)
xlabel('Time (s)','FontSize',12); ylabel('Y Position (m)','FontSize',12)
xlim([0 180]); ylim([0 0.09])

% labels etc
text(-24.25,0.5878,'a)','FontSize',12);
text(-24.25,0.4172,'b)','FontSize',12);
text(-24.25,0.2428,'c)','FontSize',12);
text(-24.25,0.0703,'d)','FontSize',12);
