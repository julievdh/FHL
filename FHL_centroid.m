% compute centroid
% laminar
cxL = mean(xL);
cyL = mean(yL);
czL = mean(zL);
plot3(cxL,cyL,0,'k^','MarkerFaceColor','k','MarkerSize',5)
plot3(cxL,0.09,czL,'k^','MarkerFaceColor','k','MarkerSize',5)


% turbulent
cxT = mean(xT);
cyT = mean(yT);
czT = mean(zT);
plot3(cxT,0.09,czT,'ko','MarkerFaceColor','k','MarkerSize',5)
plot3(cxT,cyT,0,'ko','MarkerFaceColor','k','MarkerSize',5)

% compute distance to centroid for each point, and average
dL = sqrt((xL-cxL).^2+(yL-cyL).^2);
mn_dL = mean(dL);
dT = sqrt((xT-cxT).^2+(yT-cyT).^2);
mn_dT = mean(dT);

% compute SD for each axis
sdxT = std(xT); sdxL = std(xL);
sdyT = std(yT); sdyL = std(yL);
sdzT = std(zT); sdzL = std(zL);

% distance to centroid in each axis
dxL = abs(xL-cxL);
dyL = abs(yL-cyL);
dzL = abs(zL-czL);
dxT = abs(xT-cxT);
dyT = abs(yT-cyT);
dzT = abs(zT-czT);


% standard distance deviation
sddL = sqrt(sum((xL-cxL).^2+(yL-cyL).^2)/length(xL));
sddT = sqrt(sum((xT-cxT).^2+(yT-cyT).^2)/length(xT));

% compute distance between centroids
dLT = sqrt((cxL-cxT).^2 + (cyL-cyT).^2);

% store
% table = [cxL cyL cxT cyT mn_dL mn_dT dLT sddL sddT];
table = [median(dxL) median(dyL) median(dxT) median(dyT)];