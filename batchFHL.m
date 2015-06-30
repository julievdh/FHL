
F19_L_VO2 = VO2;
F19_L_speed = speed;
F19_L_time = time;

keep F19_L_VO2 F19_L_speed F19_L_time

cd /Volumes/DQ-2012-2/FHL_Fish/SwimData/MATLAB/
save('Fish19_L_VO2')

return


files = dir('*.mat');

for i=1:length(files)
eval(['load ' files(i).name]);
end

