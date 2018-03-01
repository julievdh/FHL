% Analyze periodicity

figure(1); hold on
subplot(231)
plot(yT), xlim([0 540])
title('yT')
subplot(232)
plot(xT), xlim([0 540])
title('xT')
subplot(233)
plot(zT), xlim([0 540])
title('zT')
subplot(234)
plot(yL), xlim([0 540])
title('yL')
subplot(235)
plot(xL), xlim([0 540])
title('xL')
subplot(236)
plot(zL), xlim([0 540])
title('zL')


% laminar
[yFreq,ypval,yPxx] = FHL_Periodicity(yL);
[xFreq,xpval,xPxx] = FHL_Periodicity(xL);
[zFreq,zpval,zPxx] = FHL_Periodicity(zL);


tableL = [yFreq ypval xFreq xpval zFreq zpval];

% turbulent
[yFreq,ypval,yPxx] = FHL_Periodicity(yT);
[xFreq,xpval,xPxx] = FHL_Periodicity(xT);
[zFreq,zpval,ZPxx] = FHL_Periodicity(zT);


tableT = [yFreq ypval xFreq xpval zFreq zpval];

return

%% STATS

% load data
load('FHL_PeriodicityData')

% fish and condition and speed
fish = {'5';'5';'5';'5';'5';'5';...
    '6';'6';'6';'6';'6';'6';...
    '9';'9';'9';'9';'9';'9';...
    '10';'10';'10';'10';'10';'10';...
    '11';'11';'11';'11';'11';'11';...
    '13';'13';'13';'13';'13';'13';...
    '15';'15';'15';'15';'15';'15';...
    '19';'19';'19';'19';'19';'19'};
speed = repmat((1:3),1,16)';
condition = repmat([1 1 1 0 0 0],1,8)';

%% y period -- n = 8
[p,t,stats] = anovan(yFreq,{condition fish speed},'model','interaction','sstype',2,'varnames',{'Flow';'Fish';'Speed'});
[c,m,h,names] = multcompare(stats,'dim',1);

%% x period -- n = 8
[p,t,stats] = anovan(xFreq,{condition fish speed},'model','interaction','sstype',2,'varnames',{'Flow';'Fish';'Speed'});
[c,m,h,names] = multcompare(stats,'dim',1);


%% figure
figure(10); clf; hold on
plot(xT,yT,'.','Markersize',10)
line([cxT-mn_dT cxT+mn_dT],[cyT cyT],'color','k')
line([cxT cxT],[cyT-mn_dT cyT+mn_dT],'color','k')
plot(cxT,cyT,'k.','MarkerSize',30)

plot(xL,yL,'r.','Markersize',10)
line([cxL-mn_dL cxL+mn_dL],[cyL cyL],'color','k')
line([cxL cxL],[cyL-mn_dL cyL+mn_dL],'color','k')
plot(cxL,cyL,'k.','MarkerSize',30)

xlabel('x'); ylabel('y')