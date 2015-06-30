% load data
cd /Users/julievanderhoop/Documents/MATLAB/FHL

load('FHLSwimParams')

% % set fish ID
% fish = {'9';'9';'15';'15';'19';'19'};
% 
% % set condition, laminar = 1 (straightener), turbulent = 0 (no straightener)
% condition = [1 0 1 0 1 0];

% y period
y_per = [7.48610;6.6543;8.98330;7.48610;5.98890;3.82270;12.83330;...
    22.45830;179.66670;89.8333000000000;4.72810000000000;3.90580000000000;9.45610000000000;17.9667000000000;3.82270000000000;7.18670000000000;5.28430000000000;179.666700000000];

% fish and condition and speed
fish = {'9';'9';'9';'9';'9';'9';'15';'15';'15';'15';'15';'15';'19';'19';...
    '19';'19';'19';'19';'6';'6';'6';'6';'6';'6';};
speed = [1,2,3,1,2,3,1,2,3,1,2,3,1,2,3,1,2,3,1,2,3,1,2,3];
condition = [1 1 1 0 0 0 1 1 1 0 0 0 1 1 1 0 0 0 1 1 1 0 0 0];


p = anovan(y_per,{condition fish speed},'sstype',2)

 