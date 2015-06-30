function [Freq,pval,Pxx] = FHL_Periodicity(x);

% calculates dominant frequency and significance of periodic component for
% movement data

% inputs: 
%       x = signal
% outputs: 
%       Freq = dominant frequency
%       pval = p-value for significance of periodic component


% obtain periodogram

Fs = 30; %Hz

[Pxx,F] = periodogram(x,rectwin(length(x)),length(x),Fs);
Pxx = Pxx(2:length(x)/2);

% find max value of periodogram
[maxval,index] = max(Pxx);
fisher_g = Pxx(index)/sum(Pxx);

% find max frequency
F = F(2:end-1);
Freq = F(index);

% is it significant?
N = length(Pxx);
    upper  = floor(1/fisher_g);
    for nn = 1:3
        I(nn) = ...
            (-1)^(nn-1)*nchoosek(N,nn)*(1-nn*fisher_g)^(N-1);
    end
pval = sum(I);

end