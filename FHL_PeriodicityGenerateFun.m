function [table] = FHL_PeriodicityGenerateFun(x,y,z)

% Analyze periodicity

figure(1); hold on
subplot(131)
plot(y), xlim([0 540])
title('y')
subplot(132)
plot(x), xlim([0 540])
title('x')
subplot(133)
plot(z), xlim([0 540])
title('z')

[yFreq,ypval,yPxx] = FHL_Periodicity(y);
[xFreq,xpval,xPxx] = FHL_Periodicity(x);
[zFreq,zpval,zPxx] = FHL_Periodicity(z);

table = [yFreq ypval xFreq xpval zFreq zpval];
