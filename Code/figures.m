load('.\results\z_fval_delta5.mat');
load('.\results\z_fval_robust_delta5.mat');
load('.\results\z_robust_diff_delta5.mat');
% area(z_fval_robust(:,20));
% hold on;
% area(z_fval(:,20));

% boxplot(z_robust_diff); 
% hold on;
% plot(mean(z_robust_diff)); 


load('.\results\z_fval_delta3.mat');
load('.\results\z_fval_robust_delta3.mat');
load('.\results\z_robust_diff_delta3.mat');
% area(z_fval_robust(:,20));
% hold on;
% area(z_fval(:,20));

% boxplot(z_robust_diff); 
% hold on;
% plot(mean(z_robust_diff)); 


load('.\results\z_fval_delta_diff.mat');
load('.\results\z_fval_robust_delta_diff.mat');
load('.\results\z_robust_diff_delta_diff.mat');
% bar(mean(z_fval_robust'));
% hold on;
% bar(mean(z_fval'));


% boxplot(z_robust_diff); 
% hold on;
% plot(mean(z_robust_diff)); 

load('.\results\z_fval_delta_diff.mat'); 
load('.\results\z_fval_robust_delta_diff.mat'); 
load('.\results\z_robust_diff_delta_diff.mat'); 


load('.\results\z_fval_delta_diff_70.mat'); 
load('.\results\z_fval_robust_delta_diff_70.mat'); 
load('.\results\z_robust_diff_delta_diff_70.mat'); 
% bar(z_fval_robust(:, 3)); 
% hold on;
% bar(z_fval(:, 3)); 


% 
nr_violates = [5362	5362	5362	5362	5362]; 
nr_violates_robust = [544	432	301	130	2]; 
% bar(nr_violates); 
% hold on;
% bar(nr_violates_robust); 


% 
nr_violates = [7702	7702	7702	7702	7702]; 
nr_violates_robust = [1544	1176	687	301	2]; 
% bar(nr_violates); 
% hold on;
% bar(nr_violates_robust); 
