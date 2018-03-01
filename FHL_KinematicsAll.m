%   Calculate kinematic parameters for analysis for each fish file, lam and
%   turbulent. 
%
%   6 Feb 2014


% Load data in with POSplot_W or FHL_POSload

% Then run this...

% Make vectors of Centre of Mass in X, Y for Laminar and Turbulent
COMxL = -dataL(:,11);
COMyL = dataL(:,10);
COMxT = -dataT(:,11);
COMyT = dataT(:,10);
COMzT
COMzL


% Calculate Amplitude statistics for snout
% Matrices are Laminar x, y; Turbulent x,y
[MD_s(1,1),SD_s(1,1),MX_s(1,1)] = FHL_amp(xL);
[MD_s(1,2),SD_s(1,2),MX_s(1,2)] = FHL_amp(yL);
[MD_s(2,1),SD_s(2,1),MX_s(2,1)] = FHL_amp(xT);
[MD_s(2,2),SD_s(2,2),MX_s(2,2)] = FHL_amp(yT)

% Calculate Amplitude statistics for COM
% Matrices are Laminar x, y; Turbulent x,y
[MD_COM(1,1),SD_COM(1,1),MX_COM(1,1)] = FHL_amp(COMxL);
[MD_COM(1,2),SD_COM(1,2),MX_COM(1,2)] = FHL_amp(COMyL);
[MD_COM(2,1),SD_COM(2,1),MX_COM(2,1)] = FHL_amp(COMxT);
[MD_COM(2,2),SD_COM(2,2),MX_COM(2,2)] = FHL_amp(COMyT)


% Calculate Dominant Y Period
% PERs is Laminar; Turbulent
[PERdf,PERs(1),power,freq,index] = FHL_fft(yL,frameL);
[PERdf,PERs(2),power,freq,index] = FHL_fft(yT,frameT);
PERs

% Calculate cross correlation
% Matrix is Laminar [lag, coeff]; Turbulent [lag, coeff]
[XCF,lags,bounds] = crosscorr(yL,COMyL);
[valT,idxL] = max(XCF);
    % put in matrix
XCORR(1,:) = [lags(idxL) max(XCF)];
[XCF,lags,bounds] = crosscorr(yT,COMyT);
[valT,idxL] = max(XCF);
    % put in matrix
XCORR(2,:) = [lags(idxL) max(XCF)]