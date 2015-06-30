cd /Volumes/DQ-2012-2/FHL_Fish/SwimData/MATLAB
load('slopes')

speeds = [0:0.1:4.0];


for i = 1:length(slopes)
curveT(:,i) = exp(slopes(i,2)*speeds)';
curveL(:,i) = exp(slopes(i,3)*speeds)';
end

figure(2)
plot(speeds,curveT,'b')
hold on
plot(speeds,curveL,'r')