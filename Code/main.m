clc;
clear;
close all;

parameters;                               

%% Initialize the discrete location set
% Read the leaf nodes 

xy_coord = xlsread('./Data/Coordinates3layer.xlsx');

for nr_loc_ratio = 1:1:NR_LOC_Mul
    NR_TASK = NR_LOC; 
    x_coord = xy_coord(1:NR_LOC, 1); 
    x_coord = x_coord';
    
    y_coord = xy_coord(1:NR_LOC, 2); 
    y_coord = y_coord';
    target_index = 0:1:NR_LOC-1; 
    patient_x = x_coord(target_index+1);                            % Patients' locations
    patient_y = y_coord(target_index+1);                            
    patient_index = target_index+1;                                 
    prior_prob = ones(1, NR_LOC)/NR_LOC; 
    prior_prob = prior_prob'; 
    CPR_prior_prob = prior_prob(1:NR_LOC)/sum(prior_prob(1:NR_LOC));          % CPR's prior locations
    
    %% Simulation
    
    for epsilon = EPSILON_FIRST:EPSILON_INCR:EPSILON_LAST
        for delta = DELTA_FIRST:1:DELTA_LAST
                iter = 1;
                z = zeros(NR_LOC, NR_LOC);   % Initialize z by zero matrix
                z_robust = zeros(NR_LOC, NR_LOC);   % Initialize z by zero matrix
                tic
                while iter <= ITER_MAX
                    [nr_loc_ratio, epsilon, delta, iter]
                    z_robust_last = z_robust;
                   [z_robust, z_fval_robust(nr_loc_ratio, epsilon, delta, iter), nr_constraints(nr_loc_ratio)] ... 
                       = robust_obf_matrix2(x_coord, y_coord, CPR_prior_prob, patient_index, z_robust_last, NR_LOC, ...
                       NR_TASK, delta, epsilon, MIN_DISTANCE, GEOI_RANGE, PROB_LB);
                    z_robust_diff(nr_loc_ratio, epsilon, delta, iter) = mean(mean(abs(z_robust - z_robust_last))); 

                    iter = iter+1;
                end
                running_time_matrix(nr_loc_ratio, epsilon, delta) = toc; 
                [z, z_fval(nr_loc_ratio, epsilon, delta)] = robust_obf_matrix2(x_coord, y_coord, CPR_prior_prob, patient_index, z, NR_LOC, NR_TASK, 0,epsilon, MIN_DISTANCE, MIN_DISTANCE, PROB_LB);

                running_time_matrix_red(nr_loc_ratio, epsilon, delta) = 0; 
                for times = 1:1:10
                    tic
                    z_robust_red = precision_reduction(z_robust, CPR_prior_prob); 
                    inst_time = toc; 
                    running_time_matrix_red(nr_loc_ratio, epsilon, delta) = running_time_matrix_red(nr_loc_ratio, epsilon, delta) + inst_time; 
                end
                running_time_matrix_red(nr_loc_ratio, epsilon, delta) = running_time_matrix_red(nr_loc_ratio, epsilon, delta)/100;
                for prunedlocations = 1:1:10
                    nr_violates1(prunedlocations) = 0;
                    nr_violates2(prunedlocations) = 0;
                    for i = 1:1:100
                        nr_violates1(prunedlocations) = nr_violates1(prunedlocations) + testprunedlocation(z, NR_LOC, prunedlocations, epsilon, x_coord, y_coord, MIN_DISTANCE); 
                        nr_violates2(prunedlocations) = nr_violates2(prunedlocations) + testprunedlocation(z_robust, NR_LOC, prunedlocations, epsilon, x_coord, y_coord, MIN_DISTANCE);
                    end
                
                nr_violates1 = nr_violates1/100*100;
                nr_violates2 = nr_violates2/100*100;
        end
    end

    end
end

save ('./Results/z_fval.mat', 'z_fval'); 
save ('./Results/z_fval_robust.mat', 'z_fval_robust'); 
save ('./Results/z_robust_diff.mat', 'z_robust_diff'); 
save ('./Results/nr_violates1.mat', 'nr_violates1'); 
save ('./Results/nr_violates2.mat', 'nr_violates2'); 