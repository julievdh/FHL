

% find points used (from last three 0.5 BL s-1 to second-last)
ii = find(F8_L_speed < 0.95);
pre = diff(ii) == 1;
pre = pre(find(pre > 0));

% select points to be used in calculation of VO2 curve
select = length(pre)-1:length(F8_L_speed)-1;

% plot
plot(F8_L_speed(select),log(F8_L_VO2(select)),'r.','MarkerSize',10)
hold on


% find points used (from last three 0.5 BL s-1 to second-last)
ii = find(F8_T_speed < 0.95);
pre = diff(ii) == 1;
pre = pre(find(pre > 0));

% select points to be used in calculation of VO2 curve
select = length(pre)-1:length(F8_T_speed)-1;

% plot
plot(F8_T_speed(select),log(F8_T_VO2(select)),'b.','MarkerSize',10)
legend('L','T','Location','Best')

