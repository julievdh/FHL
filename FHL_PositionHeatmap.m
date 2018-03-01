% FHL Position Heatmap

% lowest speed
[L_xT,L_yT,L_zT,L_xL,L_yL,L_zL] = FHL_allFishPos(4);

% medium speed
[M_xT,M_yT,M_zT,M_xL,M_yL,M_zL] = FHL_allFishPos(5);

% highest speed
[H_xT,H_yT,H_zT,H_xL,H_yL,H_zL] = FHL_allFishPos(6);

%% TRY TO MAKE A HEATMAP WITH THESE DATA

figure(1); clf
set(gcf,'position',[282     5   661   668]);
subplot('position',[0.08 0.85 0.38 0.1]) % LOW TURBULENCE FLOW; LOWEST SPEED 
[values, centers] = hist3([L_xL L_yL],[51 51]);
imagesc(centers{:}, values)
axis equal; axis xy; xlim([0 0.26]); ylim([0 0.09])
title('LTF'); ylabel('Y (m)')

subplot('position',[0.5 0.85 0.38 0.1]) % HIGH TURBULENCE FLOW; LOWEST SPEED 
[values, centers] = hist3([L_xT L_yT],[51 51]);
imagesc(centers{:}, values)
axis equal; axis xy; xlim([0 0.26]); ylim([0 0.09])
title('HTF');

subplot('position',[0.08 0.7 0.38 0.1]) % LOW TURBULENCE FLOW; MED SPEED 
[values, centers] = hist3([M_xL M_yL],[51 51]);
imagesc(centers{:}, values)
axis equal; axis xy; xlim([0 0.26]); ylim([0 0.09])
ylabel('Y (m)')

subplot('position',[0.5 0.7 0.38 0.1]) % HIGH TURBULENCE FLOW; MED SPEED 
[values, centers] = hist3([M_xT M_yT],[51 51]);
imagesc(centers{:}, values)
axis equal; axis xy; xlim([0 0.26]); ylim([0 0.09])

subplot('position',[0.08 0.55 0.38 0.1]) % LOW TURBULENCE FLOW; HIGH SPEED 
[values, centers] = hist3([H_xL H_yL],[51 51]);
imagesc(centers{:}, values)
axis equal; axis xy; xlim([0 0.26]); ylim([0 0.09])
ylabel('Y (m)'); % xlabel('X (m)')

hp4 = [0.5 0.55 0.38 0.1];
subplot('position',hp4) % HIGH TURBULENCE FLOW; HIGH SPEED 
[values, centers] = hist3([H_xT H_yT],[51 51]);
imagesc(centers{:}, values)
axis equal; axis xy; xlim([0 0.26]); ylim([0 0.09])
% xlabel('X (m)')

% c = colorbar('Position', [hp4(1)+hp4(3)+0.01  hp4(2)  0.05  hp4(2)+hp4(3)*1.3]);
% ylabel(c,'N observations')

adjustfigurefont

% set(gcf,'paperpositionmode','auto')
% cd /Users/julievanderhoop/Documents/MATLAB/FHL
% print -dsvg AllFishSpeedCond_Heatmap

%% heatmap in z too? 

% figure(2); clf
% set(gcf,'position',[427   291   661   382]);
subplot('position',[0.055 0.4 0.38 0.1]) % LOW TURBULENCE FLOW; LOWEST SPEED
[values, centers] = hist3([L_xL L_zL],[51 51]);
imagesc(centers{:}, values)
axis equal; axis xy; xlim([0 0.26]); ylim([0 0.11])
ylabel('Z (m)') % title('LTF'); 

subplot('position',[0.475 0.4 0.38 0.1]) % HIGH TURBULENCE FLOW; LOWEST SPEED 
[values, centers] = hist3([L_xT L_zT],[51 51]);
imagesc(centers{:}, values)
axis equal; axis xy; xlim([0 0.26]); ylim([0 0.11])
% title('HTF');

subplot('position',[0.055 0.25 0.38 0.1]) % LOW TURBULENCE FLOW; MED SPEED 
[values, centers] = hist3([M_xL M_zL],[51 51]);
imagesc(centers{:}, values)
axis equal; axis xy; xlim([0 0.26]); ylim([0 0.11])
ylabel('Z (m)')

subplot('position',[0.475 0.25 0.38 0.1]) % HIGH TURBULENCE FLOW; MED SPEED 
[values, centers] = hist3([M_xT M_zT],[51 51]);
imagesc(centers{:}, values)
axis equal; axis xy; xlim([0 0.26]); ylim([0 0.11])

subplot('position',[0.055 0.1 0.38 0.1]) % LOW TURBULENCE FLOW; HIGH SPEED 
[values, centers] = hist3([H_xL H_zL],[51 51]);
imagesc(centers{:}, values)
axis equal; axis xy; xlim([0 0.26]); ylim([0 0.11])
ylabel('Z (m)'); xlabel('X (m)')

hp4 = [0.475 0.1 0.38 0.1];
subplot('position',hp4) % HIGH TURBULENCE FLOW; HIGH SPEED 
[values, centers] = hist3([H_xT H_zT],[51 51]);
imagesc(centers{:}, values)
axis equal; axis xy; xlim([0 0.26]); ylim([0 0.11])
xlabel('X (m)')

c = colorbar('Position', [hp4(1)+hp4(3)+0.01  hp4(2)  0.05  hp4(2)+hp4(3)*0.8]);
ylabel(c,'N observations')

adjustfigurefont

set(gcf,'paperpositionmode','auto')
cd /Users/julievanderhoop/Documents/MATLAB/FHL
print -dsvg AllFishSpeedCond_HeatmapZ


%% y vs z 
figure(2), clf
subplot('position',[0.08 0.4 0.38 0.1]) % LOW TURBULENCE FLOW; LOWEST SPEED
[values, centers] = hist3([L_zL L_yL],[51 51]);
imagesc(centers{:}, values)
axis equal; axis xy; xlim([0 0.09]); ylim([0 0.11])
% ylabel('Z (m)') % title('LTF'); 

subplot('position',[0.5 0.4 0.38 0.1]) % HIGH TURBULENCE FLOW; LOWEST SPEED 
[values, centers] = hist3([L_zT L_yT],[51 51]);
imagesc(centers{:}, values)
axis equal; axis xy; xlim([0 0.09]); ylim([0 0.11])
% title('HTF');

subplot('position',[0.08 0.25 0.38 0.1]) % LOW TURBULENCE FLOW; MED SPEED 
[values, centers] = hist3([M_zL M_yL],[51 51]);
imagesc(centers{:}, values)
axis equal; axis xy; xlim([0 0.09]); ylim([0 0.11])
ylabel('Z (m)')

subplot('position',[0.5 0.25 0.38 0.1]) % HIGH TURBULENCE FLOW; MED SPEED 
[values, centers] = hist3([M_zT M_yT],[51 51]);
imagesc(centers{:}, values)
axis equal; axis xy; xlim([0 0.09]); ylim([0 0.11])

subplot('position',[0.08 0.1 0.38 0.1]) % LOW TURBULENCE FLOW; HIGH SPEED 
[values, centers] = hist3([H_zL H_yL],[51 51]);
imagesc(centers{:}, values)
axis equal; axis xy; xlim([0 0.09]); ylim([0 0.11])
ylabel('Z (m)'); xlabel('Y (m)')

hp4 = [0.5 0.1 0.38 0.1];
subplot('position',hp4) % HIGH TURBULENCE FLOW; HIGH SPEED 
[values, centers] = hist3([H_zT H_yT],[51 51]);
imagesc(centers{:}, values)
axis equal; axis xy; xlim([0 0.09]); ylim([0 0.11])
xlabel('Y (m)')

adjustfigurefont

set(gcf,'paperpositionmode','auto')
cd /Users/julievanderhoop/Documents/MATLAB/FHL
print -dsvg AllFishSpeedCond_HeatmapYZ
