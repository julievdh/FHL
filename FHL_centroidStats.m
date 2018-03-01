%% compare mean dispersion in laminar vs turbulent:
% same three-way repeated measures anova

% load('FHL_CentroidData.mat')
% 
% fish = {'5';'5';'5';...
%     '6';'6';'6';...
%     '9';'9';'9';...
%     '10';'10';'10';...
%     '11';'11';'11';...
%     '13';'13';'13';...
%     '15';'15';'15';...
%     '19';'19';'19';...
%     '5';'5';'5';...
%     '6';'6';'6';...
%     '9';'9';'9';...
%     '10';'10';'10';...
%     '11';'11';'11';...
%     '13';'13';'13';...
%     '15';'15';'15';...
%     '19';'19';'19';};
% speed = repmat((1:3),1,16)';
% condition = vertcat(ones(24,1),zeros(24,1));
% fish = [5;5;5;...
%     6;6;6;...
%     9;9;9;...
%     10;10;10;...
%     11;11;11;...
%     13;13;13;...
%     15;15;15;...
%     19;19;19;...
%    5;5;5;...
%     6;6;6;...
%     9;9;9;...
%     10;10;10;...
%     11;11;11;...
%     13;13;13;...
%     15;15;15;...
%     19;19;19;];

%%
% lowest speed
[L_xT,L_yT,L_zT,L_xL,L_yL,L_zL] = FHL_allFishPos(4);

% medium speed
[M_xT,M_yT,M_zT,M_xL,M_yL,M_zL] = FHL_allFishPos(5);

% highest speed
[H_xT,H_yT,H_zT,H_xL,H_yL,H_zL] = FHL_allFishPos(6);

%% break into columns by sample (reshape)
L_xT_r = reshape(L_xT,[540,8]);
L_xL_r = reshape(L_xL,[540,8]);
M_xT_r = reshape(M_xT,[540,8]);
M_xL_r = reshape(M_xL,[540,8]);
H_xT_r = reshape(H_xT,[540,8]);
H_xL_r = reshape(H_xL,[540,8]);

L_yT_r = reshape(L_yT,[540,8]);
L_yL_r = reshape(L_yL,[540,8]);
M_yT_r = reshape(M_yT,[540,8]);
M_yL_r = reshape(M_yL,[540,8]);
H_yT_r = reshape(H_yT,[540,8]);
H_yL_r = reshape(H_yL,[540,8]);

L_zT_r = reshape(L_zT,[540,8]);
L_zL_r = reshape(L_zL,[540,8]);
M_zT_r = reshape(M_zT,[540,8]);
M_zL_r = reshape(M_zL,[540,8]);
H_zT_r = reshape(H_zT,[540,8]);
H_zL_r = reshape(H_zL,[540,8]);


%% compare x, y, z centroids
all_x = horzcat(L_xT_r,M_xT_r,H_xT_r,L_xL_r,M_xL_r,H_xL_r); 
all_y = horzcat(L_yT_r,M_yT_r,H_yT_r,L_yL_r,M_yL_r,H_yL_r); 
all_z = horzcat(L_zT_r,M_zT_r,H_zT_r,L_zL_r,M_zL_r,H_zL_r); 

mn_cx = vertcat(mean(L_xT_r)',mean(M_xT_r)',mean(H_xT_r)',...
    mean(L_xL_r)',mean(M_xL_r)',mean(H_xL_r)');
condition = vertcat(zeros(24,1),ones(24,1)); % turbulent first, then laminar
speed = vertcat(repmat(1,1,8)',repmat(2,1,8)',repmat(3,1,8)',...
    repmat(1,1,8)',repmat(2,1,8)',repmat(3,1,8)');
fish = {'15';'9';'19';'10';'11';'5';'6';'13';...
    '15';'9';'19';'10';'11';'5';'6';'13';...
    '15';'9';'19';'10';'11';'5';'6';'13';...
    '15';'9';'19';'10';'11';'5';'6';'13';...
    '15';'9';'19';'10';'11';'5';'6';'13';...
    '15';'9';'19';'10';'11';'5';'6';'13'};

[p,t,stats] = anovan(mn_cx,{condition fish speed},'model','interaction','sstype',2,'varnames',{'Flow';'Fish';'Speed'});
[c,m,h,names] = multcompare(stats,'dim',1);

mn_cy = vertcat(mean(L_yT_r)',mean(M_yT_r)',mean(H_yT_r)',...
    mean(L_yL_r)',mean(M_yL_r)',mean(H_yL_r)');

[p,t,stats] = anovan(mn_cy,{condition fish speed},'model','interaction','sstype',2,'varnames',{'Flow';'Fish';'Speed'});
[c,m,h,names] = multcompare(stats,'dim',1);

mn_cz = vertcat(mean(L_zT_r)',mean(M_zT_r)',mean(H_zT_r)',...
    mean(L_zL_r)',mean(M_zL_r)',mean(H_zL_r)');

[p,t,stats] = anovan(mn_cz,{condition fish speed},'model','interaction','sstype',2,'varnames',{'Flow';'Fish';'Speed'});
[c,m,h,names] = multcompare(stats,'dim',1);

%% compare standard deviation distances
% % standard distance deviation
% 
% for i = 1:size(all_x,2)
% sdd(i) = sqrt(sum((all_x(:,i)-mn_cx(i)).^2+(all_y(:,i)-mn_cy(i)).^2+(all_z(:,i)-mn_cz(i)).^2))/length(all_x);
% end
% 
% [p,t,stats] = anovan(sdd,{condition fish speed},'model','interaction','sstype',2,'varnames',{'Flow';'Fish';'Speed'});
% [c,m,h,names] = multcompare(stats,'dim',1);

%% dispersion
for i = 1:size(all_x,2)
    for j = 1:size(all_x,1)
        ds(j,i) = sqrt(sum((all_x(j,i)-mn_cx(i)).^2+(all_y(j,i)-mn_cy(i)).^2+(all_z(j,i)-mn_cz(i)).^2));
        dy(j,i) = abs(all_y(j,i)-mn_cy(i)); % distance to centroid
        dx(j,i) = abs(all_x(j,i)-mn_cx(i)); % distance to centroid
        dz(j,i) = abs(all_z(j,i)-mn_cz(i)); % distance to centroid
    end
end
md_ds = median(ds);

[p,t,stats] = anovan(md_ds,{condition fish speed},'model','interaction','sstype',2,'varnames',{'Flow';'Fish';'Speed'});
[c,m,h,names] = multcompare(stats,'dim',1);

%% anova on STD of each dimension
[p,t,stats] = anovan(std(all_x),{condition fish speed},'model','interaction','varnames',{'Flow';'Fish';'Speed'});
[p,t,stats] = anovan(std(all_z),{condition fish speed},'model','interaction','varnames',{'Flow';'Fish';'Speed'});
[p,t,stats] = anovan(std(all_y),{condition fish speed},'model','interaction','varnames',{'Flow';'Fish';'Speed'});

%% amplitudes etc
for i = 1:size(all_x,2)
    [MDx(i),SDx(i),MXx(i)] = FHL_amp(all_x(:,i));
    [MDy(i),SDy(i),MXy(i)] = FHL_amp(all_y(:,i));
    [MDz(i),SDz(i),MXz(i)] = FHL_amp(all_z(:,i));
end
[p,t,stats] = anovan(MXx,{condition fish speed},'model','interaction','varnames',{'Flow';'Fish';'Speed'});
[p,t,stats] = anovan(MXy,{condition fish speed},'model','interaction','varnames',{'Flow';'Fish';'Speed'});
[p,t,stats] = anovan(MXz,{condition fish speed},'model','interaction','varnames',{'Flow';'Fish';'Speed'});


[p,t,stats] = anovan(SDx,{condition fish speed},'model','interaction','varnames',{'Flow';'Fish';'Speed'});
[p,t,stats] = anovan(SDy,{condition fish speed},'model','interaction','varnames',{'Flow';'Fish';'Speed'});
[p,t,stats] = anovan(SDz,{condition fish speed},'model','interaction','varnames',{'Flow';'Fish';'Speed'});


%% periodicity
for i = 1:48
table(i,:) = FHL_PeriodicityGenerateFun(all_x(:,i),all_y(:,i),all_z(:,i));
end

% table((find(table(:,1) < 0.12)),1) = NaN;
% table((find(table(:,3) < 0.12)),3) = NaN;
% table((find(table(:,5) < 0.12)),5) = NaN;

yfreq = table(:,1); 
xfreq = table(:,3); 
zfreq = table(:,5); 

[p,t,stats] = anovan(yfreq,{condition fish speed},'model','interaction','varnames',{'Flow';'Fish';'Speed'});
[p,t,stats] = anovan(xfreq,{condition fish speed},'model','interaction','varnames',{'Flow';'Fish';'Speed'});
[p,t,stats] = anovan(zfreq,{condition fish speed},'model','interaction','varnames',{'Flow';'Fish';'Speed'});


%% plot this
% replace < 0.1 Fisher with NaN

figure(19)
subplot(131)
boxplot(xfreq,{condition speed}), ylim([0 6])
subplot(132)
boxplot(yfreq,{condition speed})
subplot(133)
boxplot(zfreq,{condition speed})

nanmean([table(:,1) table(:,3) table(:,5)])
nanstd([table(:,1) table(:,3) table(:,5)])

return

%% compare distance between centroids in laminar vs turbulent
% two way anova 

fish = {'5';'5';'5';...
    '6';'6';'6';...
    '9';'9';'9';...
    '10';'10';'10';...
    '11';'11';'11';...
    '13';'13';'13';...
    '15';'15';'15';...
    '19';'19';'19';};
speed = repmat((1:3),1,8)';

dLT = dLT*100;

[p,t,stats] = anovan(dLT,{fish speed},'varnames',{'Fish';'Speed'});
[c,m,h,names] = multcompare(stats,'dim',2);


