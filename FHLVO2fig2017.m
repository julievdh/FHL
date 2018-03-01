% FHLVO2Figure2017

% load data
cd '/Users/julievanderhoop/Documents/Courses/Biol533_FishSwimming_FHL'
B = xlsread('VO2.xlsx', 6); % 6th sheet
% headers are Speed (BL/s), MeanVO2, Bac, MeanVO2minBac, size, truespeed

Fish =  [10 10 10 10 10 10 10 10 10 10 10 10 10 10 10 10 10 11 11 11 ...
11 11 11 11 11 11 11 11 11 11 11 11 11 13 13 13 13 13 13 ...
13 13 13 13 13 13 13 13 13 13 13 13 15 15 15 15 15 15 15 ...
15 15 15 15 15 15 15 15 15 15 19 19 19 19 19 19 19 19 19 19 ...
19 19 19 19 19 19 5 5 5 5 5 5 5 5 5 5 5 5 5 5 6 6 6 6 6 6 6 6 6 6 6 ...
6 6 6 6 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9];
Cond = [1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,...
    1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,...
    1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,1,1,1,1,1,1,1,0,0,0,0,0,0,0,1,1,1,1,1,1,1,...
    0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0]';



% plot VO2 minus bac vs speed 
figure(1), clf, hold on
h = scatter(B(Cond == 1,1),B(Cond == 1,4),'r^','Markerfacecolor','r'); alpha(h,0.5)
h2 = scatter(B(Cond == 0,1),B(Cond == 0,4),'bo','Markerfacecolor','b'); alpha(h2,0.5)

xlabel('Speed (BL s^-^1)'), ylabel('Mean Oxygen Consumption (mg kg^{-1}*.h^{-1})')
adjustfigurefont

print('FHLVO2fig2017','-dpng')
%% plot equations
% fitted data from R -- this is fitted for each fish. 
% err = [124.353930000000,137.382740000000,158.182230000000,187.454840000000,...
%     220.763650000000,266.857240000000,317.497420000000,382.093900000000,...
%     446.118730000000,130.853520000000,137.905510000000,150.760460000000,...
%     169.097010000000,190.511940000000,218.998520000000,250.040280000000,...
%     287.220760000000,176.626280000000,188.843700000000,209.911870000000,...
%     241.657220000000,276.492700000000,318.431280000000,371.974730000000,...
%     432.587530000000,153.173270000000,160.622000000000,173.447510000000,...
%     190.950030000000,212.734010000000,241.385950000000,271.965360000000,...
%     312.262680000000,166.420950000000,177.635120000000,198.054470000000,...
%     225.868120000000,263.117560000000,308.840300000000,359.635890000000,...
%     417.515490000000,488.578760000000,116.876810000000,124.491880000000,...
%     136.951300000000,153.563860000000,176.868360000000,204.989730000000,...
%     236.231110000000,272.619540000000,314.645350000000,160.174430000000,...
%     172.227850000000,192.485710000000,222.735840000000,257.117920000000,...
%     302.461760000000,352.028840000000,415.648520000000,484.784800000000,...
%     143.908170000000,151.621140000000,164.883940000000,181.087670000000,...
%     204.828790000000,230.529810000000,263.360370000000,302.928920000000,...
%     136.207170000000,149.414970000000,169.497760000000,196.980740000000,...
%     234.124970000000,277.690620000000,332.367540000000,395.739260000000,...
%     459.046670000000,169.471580000000,176.985800000000,190.245190000000,...
%     207.846590000000,229.230100000000,256.687510000000,291.015190000000,...
%     223.841150000000,236.060180000000,256.156360000000,284.614720000000,...
%     320.950240000000,366.294080000000,417.737790000000,199.174950000000,...
%     206.990760000000,219.549060000000,236.256550000000,258.505510000000,...
%     286.094660000000,318.529260000000,175.563880000000,188.218780000000,...
%     206.916570000000,235.692730000000,270.266140000000,319.965420000000,...
%     370.590770000000,188.521920000000,195.037630000000,205.567650000000,...
%     220.449010000000,239.735980000000,261.495850000000,288.102620000000,...
%     320.802700000000,97.3039200000000,109.016500000000,128.951370000000,...
%     159.524480000000,194.715270000000,240.223100000000,288.443230000000,...
%     348.573700000000,416.743000000000,110.725210000000,118.086900000000,...
%     130.546320000000,147.949950000000,170.297800000000,196.403250000000,...
%     229.826130000000,267.006620000000];

% mdl2.effects 
Speed = [0.48667 0.935185 1.3837 1.83222 2.2807 2.729259 3.17778 3.626296 4.07481 4.52333];
L = [157.1053          167.3584        184.0803         207.2707         236.9298         273.0576 315.6540        364.7191         420.2528         482.2551];
T = [151.3911          157.6972        167.9818         182.2449         200.4864         222.7065 248.9051        279.0821         313.2376         351.3717];
LL = [126.7066	137.3235	154.57	178.3403	208.4759	244.763	286.946	334.7659	388.0168	446.5894];
LU = [187.504	197.3934	213.5905	236.2011	265.3838	301.3522	344.362	394.6723	452.4888	517.9209];
TL = [120.7304	127.4842	138.4011	153.3278	172.033	194.2084	219.5034	247.6043	278.3187	311.6025];
TU = [182.0517	187.9102	197.5625	211.162	228.9399	251.2047	278.3068	310.56	348.1566	391.1408];

plot(Speed,L,'r','linewidth',2),plot(Speed,LU,'r--',Speed,LL,'r--')
plot(Speed,T,'b','linewidth',2),plot(Speed,TU,'b--',Speed,TL,'b--')

print('FHLVO2fig2017','-dpng')

%% 
figure(2), clf, hold on
h = scatter(B(Cond == 1,8),B(Cond == 1,4),'r^','Markerfacecolor','r'); alpha(h,0.5)
h2 = scatter(B(Cond == 0,8),B(Cond == 0,4),'bo','Markerfacecolor','b'); alpha(h2,0.5)

xlabel('Speed (m s^-^1)'), ylabel('Mean Oxygen Consumption (mg kg^{-1}*.h^{-1})')
adjustfigurefont
