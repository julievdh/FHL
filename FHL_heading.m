% Heading

% FOR LAMINAR
COMxL = -dataL(:,11);
COMyL = dataL(:,10);

% calculate side lengths
lengthyL = yL - COMyL;
lengthxL = xL - COMxL;

% calculate angle 
theta_rL = atan(lengthyL./lengthxL);
theta_dL = rad2deg(theta_rL);

% FOR TURBULENT
COMxT = -dataT(:,11);
COMyT = dataT(:,10);

% calculate side lengths
lengthyT = yT - COMyT;
lengthxT = xT - COMxT;

% calculate angle 
theta_rT = atan(lengthyT./lengthxT);
theta_dT = rad2deg(theta_rT);

figure(21)
subplot(211)
plot(frameL,yL,'r'); hold on
plot(frameL,COMyL,'r--')
xlabel('Frame Number'); ylabel('Y position (m)')
subplot(212)
plot(frameT,yT,'b'); hold on
plot(frameT,COMyT,'b--')
xlabel('Frame Number'); ylabel('Y position (m)')

figure(2)
hist(theta_dT)
hold on
hist(theta_dL)
h = findobj(gca,'Type','patch');
set(h(1),'FaceColor','r');
alpha(0.5)


% figure(3)
% r = ones(length(theta_rT),1)*4;
% theta = theta_rL - deg2rad(180);
% [u,v] = pol2cart(theta,r);
% myfeather(u,v);