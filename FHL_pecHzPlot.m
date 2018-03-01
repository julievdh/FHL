load('FHL_pecHz')

% plot pec frequency (Hz) with speed
figure(1)
plot(Hz(1:3,1)); hold on
plot(Hz(4:6,1),'--')
plot(Hz(7:9,1),'r')
plot(Hz(10:12,1),'r--')
plot(Hz(13:15,1),'k')
plot(Hz(16:18,1),'k--')

% plot caudal freq (Hz) with speed
figure(2)
plot(Hz(4:6,2),'.-'); hold on
clf
plot(Hz(1:3,2)); hold on
plot(Hz(4:6,2),'--')
plot(Hz(7:9,2),'r')
plot(Hz(10:12,2),'r--')
plot(Hz(13:15,2),'k')
plot(Hz(16:18,2),'k--')