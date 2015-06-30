[MDp2p,SDp2p,MXp2p,p2p] = FHL_amp(yT);
[MDp2p,SDp2p,MXp2p,p2pCOM] = FHL_amp(COMyT);

p2pCOM = p2pCOM(1:length(p2p));

figure(1); clf; hold on
plot(p2p - p2pCOM,'b','LineWidth',2)

figure(2); clf; hold on
plot(p2p,'b-'); plot(p2pCOM,'b--')

[MDp2p,SDp2p,MXp2p,p2p] = FHL_amp(yL);
[MDp2p,SDp2p,MXp2p,p2pCOM] = FHL_amp(COMyL);

% p2pCOM = p2pCOM(1:length(p2p));
% 
% figure(1); hold on
% plot(p2p - p2pCOM,'r','LineWidth',2)

figure(2); hold on
plot(p2p,'r-'); plot(p2pCOM,'r--')

figure(3)
plot(COMy_p2p_med(:,4),Sy_p2p_med(:,4),'.'); hold on
plot([0:0.01:0.1],[0:0.01:0.1])
plot(COMy_p2p_med(:,5),Sy_p2p_med(:,5),'.'); hold on
plot(COMy_p2p_med(:,6),Sy_p2p_med(:,6),'.'); hold on
plot(COMy_p2p_med(:,1),Sy_p2p_med(:,1),'r.'); hold on
plot(COMy_p2p_med(:,2),Sy_p2p_med(:,2),'r.'); hold on
plot(COMy_p2p_med(:,3),Sy_p2p_med(:,3),'r.'); hold on