% load data
cd /Users/julievanderhoop/Documents/MATLAB/FHL

load('FHLSwimParams_2014')

% % set fish ID
% fish = {'9';'9';'15';'15';'19';'19'};
% 
% % set condition, laminar = 1 (straightener), turbulent = 0 (no straightener)
% condition = [1 0 1 0 1 0];

% y period

% fish and condition and speed
fish = {'5';'5';'5';'5';'5';'5';...
    '6';'6';'6';'6';'6';'6';...
    '9';'9';'9';'9';'9';'9';...
    '10';'10';'10';'10';'10';'10';...
    '11';'11';'11';'11';'11';'11';...
    '13';'13';'13';'13';'13';'13';...
    '15';'15';'15';'15';'15';'15';...
    '19';'19';'19';'19';'19';'19'};
speed = repmat((1:3),1,16)';
condition = repmat([1 1 1 0 0 0],1,8)';

%% y period -- n = 8
[p,t,stats] = anovan(y_per(:,1),{condition fish speed},'model','interaction','sstype',2,'varnames',{'Flow';'Fish';'Speed'});
[c,m,h,names] = multcompare(stats,'dim',1);

%% Snout X amplitude median -- n = 8
[p,t,stats] = anovan(Sx_amp_med,{condition fish speed},'model','interaction','sstype',2,'varnames',{'Flow';'Fish';'Speed'});
[c,m,h,names] = multcompare(stats,'dim',1);

%% Snout x amplitude maximum -- n = 8
[p,t,stats] = anovan(Sx_amp_max,{condition fish speed},'model','interaction','sstype',2,'varnames',{'Flow';'Fish';'Speed'});
[c,m,h,names] = multcompare(stats,'dim',1);

%% Snout y amplitude median -- n = 8
[p,t,stats] = anovan(Sy_amp_med,{condition fish speed},'model','interaction','sstype',2,'varnames',{'Flow';'Fish';'Speed'});
[c,m,h,names] = multcompare(stats,'dim',1);

%% Snout y amplitude maximum -- n = 8
[p,t,stats] = anovan(Sy_amp_max,{condition fish speed},'model','interaction','sstype',2,'varnames',{'Flow';'Fish';'Speed'});
[c,m,h,names] = multcompare(stats,'dim',1);

%% CHANGE TO N = 7
fish = {'6';'6';'6';'6';'6';'6';...
    '9';'9';'9';'9';'9';'9';...
    '10';'10';'10';'10';'10';'10';...
    '11';'11';'11';'11';'11';'11';...
    '13';'13';'13';'13';'13';'13';...
    '15';'15';'15';'15';'15';'15';...
    '19';'19';'19';'19';'19';'19'};
speed = repmat((1:3),1,14)';
condition = repmat([1 1 1 0 0 0],1,7)';

%% COTy amp med -- n = 7
[p,t,stats] = anovan(COTy_amp_med,{condition fish speed},'model','interaction','sstype',2,'varnames',{'Flow';'Fish';'Speed'});
[c,m,h,names] = multcompare(stats,'dim',1);

%% COT y amp max -- n = 7
[p,t,stats] = anovan(COTy_amp_max,{condition fish speed},'model','interaction','sstype',2,'varnames',{'Flow';'Fish';'Speed'});
[c,m,h,names] = multcompare(stats,'dim',1);

%% XCORR -- n = 7
[p,t,stats] = anovan(XCORR,{condition fish speed},'model','interaction','sstype',2,'varnames',{'Flow';'Fish';'Speed'});
[c,m,h,names] = multcompare(stats,'dim',1);

