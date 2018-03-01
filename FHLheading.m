% Heading

% ii was because only portion of frames digitized for COM as a test

COMx = -data(1:ii(end),11);
COMy = data(1:ii(end),10);

for i = 1:length(ii)
theta(i) = atan2(x(i)*COMy(i)-y(i)*COMx(i),x(i)*COMx(i)+y(i)*COMy(i));
end