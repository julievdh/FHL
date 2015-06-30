cd /Volumes/DQ-2012-2/FHL_Fish/Tracker/Fish9/L

d = dir('*.csv');
for i = (length(d)/2)+1:length(d);
vid(i).name = d(i).name;
m = csvread(d(i).name,3,0);
vid(i).matrix = m;
clear m
end

cd /Volumes/DQ-2012-2/FHL_Fish/MATLAB/

% set up color matrix
col=hsv(length(d));

for i = (length(d)/2)+1:length(d);
data = vid(1,i).matrix;
data = data(any(data~=0,2),:);
% convert coordinates from digitized to real
frame = data(:,4);
% x coordinate from aerial = y coordinate real
y = data(:,2);
% y coordinate from aerial = x coordinate real
x = -data(:,3);
% x coordinate from lateral = z coordinate real
z = data(:,6);

% plot x, y, z and frame
figure(1)
subplot(311)
hold on; 
c = i;
plot(frame,x,'color',col(c,:))
subplot(312)
hold on
plot(frame,y,'color',col(c,:))
subplot(313)
hold on
plot(frame,z,'color',col(c,:))
end
% add legend
legend('0.5','1.0','1.5','2.0','2.5','3.0','3.5')


for i = (length(d)/2)+1:length(d)
data = vid(1,i).matrix;
y = data(:,2);
frame = data(:,4);
[PERdf,PERs] = FHL_fft(y,frame);
PERIODdf(i) = PERdf;
PERIODs(i) = PERs;
end

return


%% 

% check frame alignment
if (data(:,4) - data(:,8)) > 0
    sprintf('Frames not aligned')
end

% convert coordinates from digitized to real
frame = data(:,4);
% x coordinate from aerial = y coordinate real
y = data(:,2);
% y coordinate from aerial = x coordinate real
x = -data(:,3);
% x coordinate from lateral = z coordinate real
z = data(:,6);

% plot x, y, z and frame
figure(1)
subplot(311)
hold on
plot(frame,x,'c')
subplot(312)
hold on
plot(frame,y,'c')
subplot(313)
hold on
plot(frame,z,'c')

%%

return

% plot z,y through time
figure(2)
hold on
plot3(flipud(frame),flipud(y),flipud(z),'r')
% CHECK DIMENSIONS OF WORKING AREA %
ylim([0 0.9]); zlim([0 0.11])
zlabel('depth (m)'); xlabel('frame number')

% plot points in all three axes and histograms
figure(3)
plot3(x,y,z,'r.')
ylim([0 0.09]); zlim([0 0.11]); xlim([0 0.26])
grid on
% CAN WE PLOT HISTOGRAMS IN THESE 3 AXES?

% separate histograms in 3 dimensions
figure(5)
subplot(311)
hold on
hist(x)
xlim([0 0.26])
subplot(312)
hold on
hist(y)
xlim([0 0.11])
subplot(313)
hold on
hist(z)
xlim([0 0.09])


