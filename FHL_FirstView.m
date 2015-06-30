cd /Volumes/TOW/FHL_Fish/SwimData/17Aug2013/

clear all; close all

% import data
filename = 'Fish19_17Aug2013.txt';
imp = importdata(filename, ';', 11);

% extract date information
for i = 12:length(imp.textdata)
imp.textdata{i,1};
hr(i-11) = str2num(ans(1:2));
min(i-11) = str2num(ans(4:5));
sec(i-11) = str2num(ans(7:8));
end

yr = ones(1,length(imp.textdata)-11)*2013;
mo = ones(1,length(imp.textdata)-11)*08;
dy = ones(1,length(imp.textdata)-11)*17;

% create datenum of measurement times
for i = 1:length(yr)
time(:,i) = datenum([yr(i) mo(i) dy(i) hr(i) min(i) sec(i)]);
end

clear yr mo dy hr min sec

% rename columns for clarity
VO2 = imp.data(:,1);
speed = imp.data(:,9);

% plot
figure(1)
plot(time,VO2,'.')
xlabel('Date number');ylabel('VO_2')

figure(2)
plot(speed,VO2,'.')
xlim([0 max(speed)+0.25])
xlabel('Swimming speed (BL s^-^1'); ylabel('VO_2')
