%% Data Processing from Vishnu results
parameters; 


% load('.\Vishnuresults\nr_violates1.mat'); 
% load('.\Vishnuresults\nr_violates2.mat'); 
% for i = 1:1:3
%     for j = 1:1:10
%         nr_violates1_processed(i, j) = nr_violates1(1, i, j);
%         nr_violates2_processed(i, j) = nr_violates2(1, i, j);
%     end
% end

% load('.\Vishnuresults\z_fval_robust.mat'); 
% for nr_loc_ratio = 1:1:1
%     for epsilon = EPSILON_FIRST:EPSILON_INCR:EPSILON_LAST
%         for delta = 1:1:3
%             for times = 1:1:1
%                 z_fval_robust_prcessed(epsilon, :) = reshape(z_fval_robust(nr_loc_ratio, epsilon, delta, times, :), 1, ITER_MAX); 
%             end
%             
%         end
%     end
%     
% end

% load('.\Vishnuresults\running_time.mat'); 

%% Number of violations
% load('.\chenxiresults\nr_violates1_delta_49.mat'); 
% load('.\chenxiresults\nr_violates2_delta_49.mat'); 
% 
% nr_violates_49 = [nr_violates1; nr_violates2]; 
% bar(nr_violates_49');


load('.\chenxiresults\nr_violates1_delta_70.mat'); 
load('.\chenxiresults\nr_violates2_delta_70.mat'); 

nr_violates_70 = [nr_violates1; nr_violates2]; 
bar(nr_violates_70');

% load('.\chenxiresults\nr_violates1_prune_3.mat'); 
% load('.\chenxiresults\nr_violates2_prune_3.mat'); 


% load('.\chenxiresults\nr_violates1_prune_5.mat'); 
% load('.\chenxiresults\nr_violates2_prune_5.mat'); 
% 
% nr_violates_3 = [nr_violates1; nr_violates2]; 
% bar(nr_violates_3');


%% Running time
% load('.\chenxiresults\running_time.mat')
% boxplot(running_time); 

%% Convergence 
% load('.\chenxiresults\z_fval_robust.mat'); 
% z_fval_robust_processed = reshape(z_fval_robust(:, 3, 1, :), 6, 10); 

% plot(mean(z_fval_robust_processed)); 
% hold on; 
% boxplot(z_fval_robust_processed); 

% z_fval_robust_processed_diff = diff(z_fval_robust_processed, 1, 2); 
% 
% plot(mean(z_fval_robust_processed_diff)); 
% hold on; 
% boxplot(z_fval_robust_processed_diff); 


%% Cost with different epsilon
% load('.\chenxiresults\z_fval.mat'); 
% 
% load('.\chenxiresults\z_fval_robust.mat'); 
% z_fval_robust_processed = z_fval_robust(:, :, :, 10); 
% z_fval_robust_processed_3 = z_fval_robust_processed(:, 1); 
% load('.\chenxiresults\z_fval_robust_nongraph.mat'); 
% z_fval_robust_processed_nongraph = z_fval_robust(:, :, :, 10); 
% z_fval_robust_processed_nongraph_3 = z_fval_robust_processed_nongraph(:, 1); 
% bar([z_fval(:,1), z_fval_robust_processed_3, z_fval_robust_processed_nongraph_3]); 

%% Cost with different epsilon

% load('.\chenxiresults\z_fval.mat'); 
% 
% load('.\chenxiresults\z_fval_robust.mat');  
% z_fval_robust_processed = z_fval_robust(:, :, :, 10); 
% z_fval_robust_processed_2 = z_fval_robust_processed(2, :); 
% load('.\chenxiresults\z_fval_robust_nongraph.mat'); 
% z_fval_robust_processed_nongraph = z_fval_robust(:, :, :, 10); 
% z_fval_robust_processed_nongraph_2 = z_fval_robust_processed_nongraph(2, :); 
% bar([z_fval(1,:)', z_fval_robust_processed_2', z_fval_robust_processed_nongraph_2']); 

%% Running time

% running_time_nograph = [471 451 476 421  393  345 352]; 
% running_time_graph = mean(running_time); 
% bar([running_time_nograph; running_time_graph]'); 

%% Number of constraints
% nr_constraints_graph = [609	2701	6425	13109	20305	31477	44401];
% nr_loc = 7:7:49; 
% nr_constraints_nograph = nr_loc.*nr_loc.*(nr_loc-1); 
% 
% bar([nr_constraints_nograph; nr_constraints_graph]'); 



