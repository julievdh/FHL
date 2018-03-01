[XCF,lags,bounds] = crosscorr(yL,COMyL);
[valT,idxL] = max(XCF);

% Plot Coefficients
plot([lags(1) lags(end)],[bounds(1) bounds(1)],'r')
hold on
plot([lags(1) lags(end)],[bounds(2) bounds(2)],'r')
stem(lags,XCF)

% Plot maxima
plot(lags(idxL),max(XCF),'r.')
display('laminar')
display('[lag, in analyzed frames;  corr coeff]')
display([lags(idxL) max(XCF)])


[XCF,lags,bounds] = crosscorr(yT,COMyT);
[valT,idxT] = max(XCF);

% Plot Coefficients
figure(4)
plot([lags(1) lags(end)],[bounds(1) bounds(1)],'r')
hold on
plot([lags(1) lags(end)],[bounds(2) bounds(2)],'r')
stem(lags,XCF)

% Plot maxima
plot(lags(idxT),max(XCF),'r.')
display('turbulent')
display('[lag, in analyzed frames;  corr coeff]')
display([lags(idxT) max(XCF)])

