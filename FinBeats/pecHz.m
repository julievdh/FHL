function Hz = pecHz(data);
% calculate pectoral fin beat frequency
% inputs:
%    data = timestamps of pectoral (== 1) and caudal (== 2) fin beats
% outputs:
%    Hz = frequency of pectoral fin beats per second

% find pectoral beats
pec = find(data(:,2) == 1);

% frequency = count/time
Hz = length(pec)/(data(pec(end))-data(pec(1)));
end


