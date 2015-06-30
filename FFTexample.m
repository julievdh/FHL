function [PER] = FHL_fft(y);


% Sunspot activity is cyclical, reaching a maximum about every 11 years. 
% Let's confirm that. Here is a plot of a quantity called the Zurich 
% sunspot relative number, which measures both number and size of sunspots. 
% Astronomers have tabulated this number for almost 300 years.

% load sunspot.dat
% year=sunspot(:,1);
% relNums=sunspot(:,2);
% plot(year,relNums)
% title('Sunspot Data')

% take FFT
Y = fft(y);

% first data point is a sum, so delete
Y(1)=[];

% A graph of the distribution of the Fourier coefficients (given by Y) 
% in the complex plane is pretty, but difficult to interpret. 
% We need a more useful way of examining the data in Y.

plot(Y,'ro')
title('Fourier Coefficients in the Complex Plane');
xlabel('Real Axis');
ylabel('Imaginary Axis');


% The complex magnitude squared of Y is called the power
% plot of power versus frequency is a "periodogram".
figure(1)
hold on
n=length(Y);
power = abs(Y(1:floor(n/2))).^2;
nyquist = 1/2;
freq = (1:n/2)/(n/2)*nyquist;
plot(freq,power,'r')
xlabel('cycles/digitized frame')
title('Periodogram')

% Calculate period
period=1./freq;
figure(2)
hold on
plot(period,power,'r');
ylabel('Power');
xlabel('Period (Digitized frames/Cycle)');

% Find dominant period

hold on;
index=find(power==max(power));
mainPeriodStr=num2str(period(index));
plot(period(index),power(index),'r.', 'MarkerSize',25);
text(period(index)+2,power(index),['Period = ',mainPeriodStr]);

PER = period(index)/3;

end
