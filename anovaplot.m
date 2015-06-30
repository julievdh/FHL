% anova plot

% fish 9

y9 = [mean(y_p2p(1:3,1)); mean(y_p2p(4:6,1))];           
e9 = [std(y_p2p(1:3,1)); std(y_p2p(4:6,1))];       
errorbar(y9, e9, 'o-');  

hold all

% Now repeat
y15 = [mean(y_p2p(7:9,1)); mean(y_p2p(10:12,1))];           
e15 = [std(y_p2p(7:9,1)); std(y_p2p(10:12,1))]; 
errorbar(y15, e15, 'o-');

y19 = [mean(y_p2p(13:15,1)); mean(y_p2p(16:18,1))];           
e19 = [std(y_p2p(13:15,1)); std(y_p2p(16:18,1))]; 
errorbar(y19, e19, 'o-');

y6 = [mean(y_p2p(19:21,1)); mean(y_p2p(22:24,1))];           
e6 = [std(y_p2p(19:21,1)); std(y_p2p(22:24,1))]; 
errorbar(y6, e6, 'o-'); 

plotrange = [y19-e19;y6-e6;y9+e9;y6+e6];
yplotmin = min(plotrange)* .5;
yplotmax = max(plotrange) * 1.5;

legend({'Fish 9', 'Fish 15', 'Fish 19', 'Fish 6'})

set(gca,'YLim',[yplotmin yplotmax])
set(gca,'XLim',[.5 2.5])
set(gca,'XTick',1:2)
set(gca,'XTickLabel',{'Low Turbulence', 'High Turbulence'});
