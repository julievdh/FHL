% load data
load('FHL_beatsDec2017')
% these are data from the excel file from Karlina: 
% FinBeats_allVideos(Edited)



figure(1)
bar(use,'stacked')
ylim([0 100])

% sort percentage use based on VO2minBac
[B,I] = sort(VO2minBac); % sort by VO2 
figure(5)
subplot(3,1,1:2)
bar(use(I,:),'stacked')
subplot(313)
h = gscatter(1:length(VO2minBac),VO2minBac(I)',flow(I),'br','o^');


% group by each speed and flow
% calculate mean of speed 1 
smeans(1,:) = mean(use(spd == 0.5,:));
smeans(2,:) = mean(use(spd == 1.5,:));
smeans(3,:) = mean(use(spd >= 3,:));

figure(2)
bar(smeans,'stacked')
set(gca,'xticklabel',[0.5 1.5 3.5])
ylim([0 100])
ylabel('Percent Use')

% group by speed and flow
fsmeans(1,:) = mean(use(spd == 1 & flow == 1,:)); % laminar
fsmeans(2,:) = mean(use(spd == 1 & flow == 0,:)); % turbulent

fsmeans(3,:) = mean(use(spd == 2 & flow == 1,:)); % laminar
fsmeans(4,:) = mean(use(spd == 2 & flow == 0,:)); % turbulent

fsmeans(5,:) = mean(use(spd == 3 & flow == 1,:)); % laminar
fsmeans(6,:) = mean(use(spd == 3 & flow == 0,:)); % turbulent

figure(3)
bar(fsmeans,'stacked')
set(gca,'xticklabel',[0.5 0.5 1.5 1.5 3.5 3.5])
ylim([0 100])
ylabel('Percent Use')

%% now for Hz
% group by each speed and flow
% calculate mean of speed 1 
Hz_smeans(1,:) = mean(Hz(spd == 0.5,:));
Hz_smeans(2,:) = mean(Hz(spd == 1.5,:));
Hz_smeans(3,:) = mean(Hz(spd >= 3,:));

figure(12)
bar(Hz_smeans,'stacked')
set(gca,'xticklabel',[0.5 1.5 3.5])
ylabel('Frequency (Hz)')

% group by speed and flow
Hz_fsmeans(1,:) = mean(Hz(spd == 1 & flow == 1,:)); % laminar
Hz_fsmeans(2,:) = mean(Hz(spd == 1 & flow == 0,:)); % turbulent

Hz_fsmeans(3,:) = mean(Hz(spd == 2 & flow == 1,:)); % laminar
Hz_fsmeans(4,:) = mean(Hz(spd == 2 & flow == 0,:)); % turbulent

Hz_fsmeans(5,:) = mean(Hz(spd == 3 & flow == 1,:)); % laminar
Hz_fsmeans(6,:) = mean(Hz(spd == 3 & flow == 0,:)); % turbulent

figure(13)
bar(Hz_fsmeans,'stacked')
set(gca,'xticklabel',[0.5 0.5 1.5 1.5 3.5 3.5])
ylabel('Percent Use')
