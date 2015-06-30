function [caudwait,pecwait] = FinWtime(data)
pec = find(data(:,2) == 1);
caud = find(data(:,2) == 2);

caudwait = diff(data(caud,1));
pecwait = diff(data(pec,1));

pecwait = pecwait/mean(pecwait); % normalize by average
if length(caudwait) > 1
caudwait = caudwait/mean(caudwait); 
end

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


