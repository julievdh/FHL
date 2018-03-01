
function [MD,SD,MX] = FHL_amp(V);
% Calculates amplitude and peak-to-peak amplitude of body position
% INPUTS:  
%   V is the vector of interest (e.g. x position through time)
% OUTPUTS:
%   MD = Median amplitude; SD = Standard deviation of amplitude; MX = 
%   Maximum measured amplitude
%   MDp2p = Median peak-to-peak amplitude; SD = Standard deviation of
%   peak-to-peak amplitude; MXp2p = Maximum measured peak-to-peak amplitude

%   Sept 16 2013, Julie van der Hoop jvanderhoop@whoi.edu

clear MAXTAB MINTAB MD SD MX MDp2p SDp2p MXp2p

% find maxima and minima in signal
[MAXTAB,MINTAB] = peakdet(V,0.001);

% find if lengths are different, and find limiting length
minl = min([length(MINTAB) length(MAXTAB)]);

% make mintab and maxtab same length
MAXTAB = MAXTAB(1:minl,:); MINTAB = MINTAB(1:minl,:);

% calculate median, standard dev and maximum amplitude
MD = median(MAXTAB(:,2) - MINTAB(:,2));
SD = std(MAXTAB(:,2) - MINTAB(:,2));
MX = max(MAXTAB(:,2) - MINTAB(:,2));

% calculate peak-to-peak amplitude
for i = 1:length(MAXTAB)-1
    p2p(:,i) = MAXTAB(i,2) - MINTAB(i,2) + (MAXTAB(i+1,2) - MINTAB(i,2));
end

% WANT STANDARD AMPLITUDE, NOT P2P
% % obtain parameters for peak-to-peak amplitude
% MDp2p = median(p2p);
% SDp2p = std(p2p);
% MXp2p = max(p2p);
     
end
