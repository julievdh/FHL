% load in all fish data
% lowest speed
[L_xT,L_yT,L_zT,L_xL,L_yL,L_zL] = FHL_allFishPos(4);

% medium speed
[M_xT,M_yT,M_zT,M_xL,M_yL,M_zL] = FHL_allFishPos(5);

% highest speed
[H_xT,H_yT,H_zT,H_xL,H_yL,H_zL] = FHL_allFishPos(6);

% break into columns by sample (reshape)
L_xT_r = reshape(L_xT,[540,8]);
L_xL_r = reshape(L_xL,[540,8]);
M_xT_r = reshape(M_xT,[540,8]);
M_xL_r = reshape(M_xL,[540,8]);
H_xT_r = reshape(H_xT,[540,8]);
H_xL_r = reshape(H_xL,[540,8]);

%% 
L_yT_r = reshape(L_yT,[540,8]);
L_yL_r = reshape(L_yL,[540,8]);
M_yT_r = reshape(M_yT,[540,8]);
M_yL_r = reshape(M_yL,[540,8]);
H_yT_r = reshape(H_yT,[540,8]);
H_yL_r = reshape(H_yL,[540,8]);

L_zT_r = reshape(L_zT,[540,8]);
L_zL_r = reshape(L_zL,[540,8]);
M_zT_r = reshape(M_zT,[540,8]);
M_zL_r = reshape(M_zL,[540,8]);
H_zT_r = reshape(H_zT,[540,8]);
H_zL_r = reshape(H_zL,[540,8]);

% calculate CV?
CV_xT = std(horzcat(L_xT_r,M_xT_r,H_xT_r))./mean(horzcat(L_xT_r,M_xT_r,H_xT_r));
CV_xL = std(horzcat(L_xL_r,M_xL_r,H_xL_r))./mean(horzcat(L_xL_r,M_xL_r,H_xL_r));

% bartlett
% pooling all x values
%vartestn(vertcat(L_xT,L_xL),vertcat(repmat(0,4320,1),repmat(1,4320,1)))
%vartestn(vertcat(M_xT,M_xL),vertcat(repmat(0,4320,1),repmat(1,4320,1)))
%vartestn(vertcat(H_xT,H_xL),vertcat(repmat(0,4320,1),repmat(1,4320,1)))
% keeping x values separate
%vartestn(horzcat(L_xT_r,M_xT_r,H_xT_r,L_xL_r,M_xL_r,H_xL_r))

% pooling all y values
%vartestn(vertcat(L_yT,L_yL),vertcat(repmat(0,4320,1),repmat(1,4320,1)))
%vartestn(vertcat(M_yT,M_yL),vertcat(repmat(0,4320,1),repmat(1,4320,1)))
%vartestn(vertcat(H_yT,H_yL),vertcat(repmat(0,4320,1),repmat(1,4320,1)))
% keeping y values separate
%vartestn(horzcat(L_yT_r,M_yT_r,H_yT_r,L_yL_r,M_yL_r,H_yL_r))

% pooling all y values
%vartestn(vertcat(L_yT,L_yL),vertcat(repmat(0,4320,1),repmat(1,4320,1)))
%vartestn(vertcat(M_yT,M_yL),vertcat(repmat(0,4320,1),repmat(1,4320,1)))
%vartestn(vertcat(H_yT,H_yL),vertcat(repmat(0,4320,1),repmat(1,4320,1)))
% keeping y values separate
%vartestn(horzcat(L_zT_r,M_zT_r,H_zT_r,L_zL_r,M_zL_r,H_zL_r))

%% compare STD

% xstd
Xtstd = std(horzcat(L_xT_r,M_xT_r,H_xT_r))';
Xlstd = std(horzcat(L_xL_r,M_xL_r,H_xL_r))';

% ystd
Ytstd = std(horzcat(L_yT_r,M_yT_r,H_yT_r))';
Ylstd = std(horzcat(L_yL_r,M_yL_r,H_yL_r))';

% z std
Ztstd = std(horzcat(L_zT_r,M_zT_r,H_zT_r))';
Zlstd = std(horzcat(L_zL_r,M_zL_r,H_zL_r))';

% plot
figure(8), clf
subplot(311)
plot(Xtstd,'bo'), hold on, plot(Xlstd,'r^')
errorbar(25,mean(Xtstd),std(Xtstd),'bo')
errorbar(25.5,mean(Xlstd),std(Xlstd),'r^')
xlim([0 26]), ylabel('X (m)'), ylim([0 0.04])

subplot(312)
plot(Ytstd,'bo'), hold on, plot(Ylstd,'r^')
errorbar(25,mean(Ytstd),std(Ytstd),'bo')
errorbar(25.5,mean(Ylstd),std(Ylstd),'r^')
xlim([0 26]), ylabel('Y (m)')

subplot(313)
plot(Ztstd,'bo'), hold on, plot(Zlstd,'r^')
errorbar(25,mean(Ztstd),std(Ztstd),'bo')
errorbar(25.5,mean(Zlstd),std(Zlstd),'r^')
xlim([0 26]), ylabel('Z (m)')

cd /Users/julievanderhoop/Documents/MATLAB/FHL

%% 
close all, figure
subplot(331),hold on
plot(ones(8,1),std(L_xT_r),'bo')
plot(zeros(8,1),std(L_xL_r),'r^')
ylabel('Deviation in X'), xlim([-0.25 1.25])
subplot(332),hold on % medium speed
plot(ones(8,1),std(M_xT_r),'bo')
plot(zeros(8,1),std(M_xL_r),'r^')
xlim([-0.25 1.25])
subplot(333),hold on % high speed 
plot(ones(8,1),std(H_xT_r),'bo')
plot(zeros(8,1),std(H_xL_r),'r^')
xlim([-0.25 1.25])

subplot(334)
plot(ones(8,1),std(L_yT_r),'bo')
plot(zeros(8,1),std(L_yL_r),'r^')
ylabel('Deviation in Y (m)'), xlim([-0.25 1.25])
subplot(335),hold on % medium speed
plot(ones(8,1),std(M_yT_r),'bo')
plot(zeros(8,1),std(M_yL_r),'r^')
xlim([-0.25 1.25])
subplot(336),hold on % high speed 
plot(ones(8,1),std(H_yT_r),'bo')
plot(zeros(8,1),std(H_yL_r),'r^')
xlim([-0.25 1.25])

subplot(337)
plot(ones(8,1),std(L_zT_r),'bo')
plot(zeros(8,1),std(L_zL_r),'r^')
ylabel('Deviation in Z (m)'), xlim([-0.25 1.25])
subplot(338),hold on % medium speed
plot(ones(8,1),std(M_zT_r),'bo')
plot(zeros(8,1),std(M_zL_r),'r^')
xlim([-0.25 1.25])
subplot(339),hold on % high speed 
plot(ones(8,1),std(H_zT_r),'bo')
plot(zeros(8,1),std(H_zL_r),'r^')
xlim([-0.25 1.25])
