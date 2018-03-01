function [caudwait,pecwait,cauduse,pec,caud] = FinWtime(data)
pec = find(data(:,2) == 1);
caud = find(data(:,2) == 2);

% figure(100); hold on; xlim([0 180]); ylim([0.8 2.2])
% plot(data(:,1),data(:,2));

if size(caud,1) > 1
    % cauduse = (caud(end)-caud(1))/180; % assuming only use caudal fin once, though... 
    for i = 1:length(caud)
test(i) = sum(diff(data(caud(i,1)-1:caud(i,1)+1)));
    end
cauduse = sum(test);
else
    cauduse = NaN;
end

caudwait = diff(data(caud,1));
pecwait = diff(data(pec,1));
 
% pecwait = pecwait/mean(pecwait); % normalize by average
%if length(caudwait) > 1
%caudwait = caudwait/mean(caudwait); 
%end

% figure(1); hold on
% histogram(pecwait,'binwidth',0.2)
% %legend('Pectoral Waiting Time')
% if caudwait > 2 
% histogram(caudwait,'binwidth',0.2)
% %legend('Pectoral Waiting Time','Caudal Waiting Time')
% end
% 
% 
% figure(2); hold on
% cdfplot(pecwait)
% %legend('Pectoral Waiting Time')
% if length(caudwait) > 2
% cdfplot(caudwait)
% %legend('Pectoral Waiting Time','Caudal Waiting Time')
end


