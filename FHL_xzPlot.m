
% set fish speeds = 0.5 BL s-1, 1.5 BL s-1, 4.0 BL s-1
speed9 = [0.06 0.18 0.48];

% load mean speeds, all data
load('mean_u')
load('all_data_final')

label={'FG' 'LG'};
rpms={'150' '300' '450' '600' '750' '900' '1050' '1200' '1350'};

% find mean_u speed corresponding to fish's body length speed
lo = find(mean_u > speed9(1)-0.03 & mean_u < speed9(1)+0.03);
med = find(mean_u > speed9(2)-0.03 & mean_u < speed9(2)+0.03);
hi = find(mean_u > speed9(3)-0.03 & mean_u < speed9(3)+0.03);
if isempty(hi) == 1
    hi = [17;18];
end


%% 0.5 BL s-1 

% set j to RPMs at low speed
j = lo(1);
speed = 4;

% import fish data for low speed
FHL_POSload

% plot TKE for both conditions
FHL_TKEplot

% calculate depth from midline (vs above bottom)
zT_mid = zT - 0.05; 
zL_mid = zL - 0.05;

% plot laminar (fine grid)
figure(1)
hold on
plot(xL,zL_mid,'k.','MarkerSize',20)

% plot turbulent positions (large grid)
figure(2)
hold on
plot(xT,zT_mid,'k.','MarkerSize',20)

%% 1.5 BL s-1 

% set j to RPMs at medium speed
j = med;

% plot TKE for both conditions
FHL_TKEplot

% plot laminar (fine grid)
figure(3)
hold on
plot(xL,zL_mid,'k.','MarkerSize',20)

% plot turbulent positions (large grid)
figure(4)
hold on
plot(xT,zT_mid,'k.','MarkerSize',20)


%% 3.0 BL s-1

% plot laminar (fine grid)
figure(10)
hold on
plot(xL,zL_mid,'k.','MarkerSize',20)

figure(19)
hold on
plot(xT,zT_mid,'k.','MarkerSize',20)

