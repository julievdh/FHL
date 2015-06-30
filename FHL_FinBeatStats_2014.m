% load data
cd /Users/julievanderhoop/Documents/MATLAB/FHL
load('FinBeatData_2014.mat')

% condition = 1 = laminar; 0 = turbulent
% fish = fish ID number
% speed = m/s


% hz = fin beat frequency over 300s sampling period [pectoral, caudal, pec w/
%      caudal, caudal w/ pec]
% use = percent use [pectoral, caudal, both];

%% hz pectoral
[p,t,stats] = anovan(hz(:,1),{condition fish speed},'model','interaction','sstype',2,'varnames',{'Flow';'Fish';'Speed'});
[c,m,h,names] = multcompare(stats,'dim',1);

%% hz caudal
[p,t,stats] = anovan(hz(:,2),{condition fish speed},'model','interaction','sstype',2,'varnames',{'Flow';'Fish';'Speed'});
[c,m,h,names] = multcompare(stats,'dim',1);

%% hz pec w/ caudal
[p,t,stats] = anovan(hz(:,3),{condition fish speed},'model','interaction','sstype',2,'varnames',{'Flow';'Fish';'Speed'});
[c,m,h,names] = multcompare(stats,'dim',1);

%% hz caudal w/ pec
[p,t,stats] = anovan(hz(:,4),{condition fish speed},'model','interaction','sstype',2,'varnames',{'Flow';'Fish';'Speed'});
[c,m,h,names] = multcompare(stats,'dim',1);

%%
%%
%% use pectoral
[p,t,stats] = anovan(use(:,1),{condition fish speed},'model','interaction','sstype',2,'varnames',{'Flow';'Fish';'Speed'});
[c,m,h,names] = multcompare(stats,'dim',1);

%% use caudal
[p,t,stats] = anovan(use(:,2),{condition fish speed},'model','interaction','sstype',2,'varnames',{'Flow';'Fish';'Speed'});
[c,m,h,names] = multcompare(stats,'dim',1);

%% use both
[p,t,stats] = anovan(use(:,3),{condition fish speed},'model','interaction','sstype',2,'varnames',{'Flow';'Fish';'Speed'});
[c,m,h,names] = multcompare(stats,'dim',1);

