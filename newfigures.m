%% New results
load('.\new results\nr_violates1_epsilon_delta.mat'); 
load('.\new results\nr_violates2_epsilon_delta.mat'); 

nr_violates_delta0 = [nr_violates1(:, 1), nr_violates2(:, 1)]; 
nr_violates_delta1 = [nr_violates1(:, 2), nr_violates2(:, 2)]; 
nr_violates_delta2 = [nr_violates1(:, 3), nr_violates2(:, 3)]; 

tiledlayout(1,3);
nexttile
bar(nr_violates_delta0);
nexttile
bar(nr_violates_delta1);
nexttile
bar(nr_violates_delta2);

% load('.\new results\running_time_epsilon_delta.mat'); 
% plot(running_time); 

% load('.\new results\z_fval_robust.mat'); 
% plot(mean(z_fval_robust)); 
% hold on; 
% boxplot(z_fval_robust); 

% load('.\new results\z_robust_diff.mat'); 
% plot(mean(z_robust_diff)); 
% hold on; 
% boxplot(z_robust_diff); 

% load('.\new results\z_fval_robust_epsilon_delta.mat'); 
% z_fval_robust_delta_epsilon = z_fval_robust(:, :, 10); 
% plot(z_fval_robust_delta_epsilon); 