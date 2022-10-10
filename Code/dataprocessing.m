parameters; 
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

load('.\chenxiresults\running_time_delta_epsilon.mat'); 
load('.\chenxiresults\z_fval_delta_epsilon.mat'); 
load('.\chenxiresults\z_fval_robust_delta_epsilon.mat'); 
load('.\chenxiresults\z_robust_diff_delta_epsilon.mat'); 

z_fval_robust_delta_epsilon_processed = reshape(z_fval_robust(1, :, :, 10), 4, 3); 
z_fval_robust_delta_processed = reshape(z_fval(1, :, :), 4, 3); 

z_fval_compare(:, :, 1) = z_fval_robust_delta_processed; 
z_fval_compare(:, :, 2) = z_fval_robust_delta_epsilon_processed - z_fval_robust_delta_processed; 


plotBarStackGroups(z_fval_compare); 
a = 0; 