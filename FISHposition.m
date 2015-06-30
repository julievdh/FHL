% load data
cd /Users/julievanderhoop/Documents/MATLAB/FHL
fileToRead = 'Fish5_7Aug2013_3.0b.csv';
importFISH(fileToRead);

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
plot(frame,x,'r')
subplot(312)
hold on
plot(frame,y,'r')
subplot(313)
hold on
plot(frame,z,'r')

% plot z,y through time
figure(2)
plot3(flipud(frame),flipud(y),flipud(z))
% CHECK DIMENSIONS OF WORKING AREA %
ylim([0 0.11]); zlim([0 0.09])
zlabel('depth (m)'); xlabel('frame number')

% plot points in all three axes and histograms
figure(3)
plot3(x,y,z,'.')
ylim([0 0.11]); zlim([0 0.09]); xlim([0 0.26])
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


