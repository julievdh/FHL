% compute centroid
% laminar
cxL = mean(xL);
cyL = mean(yL);
plot(cxL,cyL,'k.','MarkerSize',15)

% turbulent
cxT = mean(xT);
cyT = mean(yT);
plot(cxT,cyT,'k.','MarkerSize',15)

% compute distance to centroid for each point, and average
dL = sqrt((xL-cxL).^2+(yL-cyL).^2);
mn_dL = mean(dL);
dT = sqrt((xT-cxT).^2+(yT-cyT).^2);
mn_dT = mean(dT);

% distance to centroid in each axis
dxL = abs(xL-cxL);
dyL = abs(yL-cyL);
dxT = abs(xT-cxT);
dyT = abs(yT-cyT);


% standard distance deviation
sddL = sqrt(sum((xL-cxL).^2+(yL-cyL).^2)/length(xL));
sddT = sqrt(sum((xT-cxT).^2+(yT-cyT).^2)/length(xT));

% compute distance between centroids
dLT = sqrt((cxL-cxT).^2 + (cyL-cyT).^2);

% store
% table = [cxL cyL cxT cyT mn_dL mn_dT dLT sddL sddT];
table = [median(dxL) median(dyL) median(dxT) median(dyT)];