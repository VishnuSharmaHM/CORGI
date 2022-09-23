clc;
clear;
close all;

parameters; 

                                       

%% Initialize the discrete location set

% Read the leaf nodes 
% xy_coord = xlsread('.\data\Tree_Structure.xlsx');
% xy_coord = xlsread('.\data\Cooordinates7.xlsx');
% xy_coord = xlsread('.\data\Coordinates.xls');
% xy_coord = xlsread('.\data\Coordinates_update.xlsx');
xy_coord = xlsread('.\data\Coordinates3layer.xlsx');
x_coord = xy_coord(1:NR_LOC, 1); 
x_coord = x_coord';

y_coord = xy_coord(1:NR_LOC, 2); 
y_coord = y_coord';

target_index = [1,8,15,22,29,35,42]; 

% epsilon_value = 5.5:0.1:8.0; 
epsilon_value = 30:2:50; 

epsilon_value = epsilon_value/10; 


patient_x = x_coord(target_index+1);                            % Patients' locations
patient_y = y_coord(target_index+1);                            
patient_index = target_index+1;                                 

% prior_prob = csvread('.\data\CPR.csv');
% prior_prob = ones(NR_LOC, 1);

% prior_prob = [  0.01692357443138946, 0.011462038733786066, 0.020588552333728576, 0.004455463332255398, 0.04060220617297258, ...
%                 0.0016528331716431318, 0.018540476447127304, 0.0037368402141496893, 0.002048075886601272, ...
%                 0.056950882109877476, 0.001221659300779706, 0.01699543674320003, 0.012216593007797061, ...
%                 0.0010420035212532787, 0.05680715748625633, 0.038625992598181884, 0.008946857820416083, ...
%                 0.06539470374761956, 0.007581473896015235, 0.022564765908519278, 0.04599187955876541, 0.004383601020444828, ...
%                 0.05648377708310876, 0.011102727174733212, 0.01872013222665373, 0.03891344184542417, 0.0016887643275484171, ...
%                 0.06499946103266142, 0.013078940749523912, 0.006611332686572527, 0.0030182170960439797, ...
%                 0.005748984944845676, 0.0403147569257303, 0.009952930185764076, 0.02482842873055226, 0.028062232762027954, ...
%                 0.0011138658330638496, 0.009270238223563652, 0.007401818116488807, 0.028313750853364954, ...
%                 0.006755057310193669, 0.057849161007509614, 0.0033775286550968343, 0.016240882469189033, ...
%                 0.0015809708598325607, 0.05339369767525421, 0.004778843735402968, 0.026696848837627105, ...
%                 0.0009701412094427077];
load('.\data\prior_prob_343.mat'); 
% prior_prob = ones(1, NR_LOC)/NR_LOC; 
% prior_prob = prior_prob'; 


% CPR_prior_prob = prior_prob(1:NR_LOC)/sum(prior_prob(1:NR_LOC));          % CPR's prior locations
CPR_prior_prob = ones(NR_LOC, 1)/NR_LOC; 




% for i = 1:1:7
%     plot(x_coord((i-1)*7+1:(i-1)*7+7), y_coord((i-1)*7+1:(i-1)*7+7), 'k'); 
%     hold on; 
% end

%% Simulation
epsilon = EPSILON_LAST; 
delta = DELTA_LAST; 
for delta = 1:1:3
    for epsilon = EPSILON_FIRST:EPSILON_INCR:EPSILON_LAST
        for times = 1:1:10
        iter = 1;
        z = zeros(NR_LOC, NR_LOC);   % Initialize z by zero matrix
        z_robust = zeros(NR_LOC, NR_LOC);   % Initialize z by zero matrix
        tic
        while iter <= ITER_MAX
            % [epsilon delta times iter]
            [delta times iter]
            z_robust_last = z_robust;
            [z_robust, z_fval_robust(epsilon, delta, times, iter)] = robust_obf_matrix2(x_coord, y_coord, CPR_prior_prob, patient_index, z_robust_last, NR_LOC, NR_TASK, delta, epsilon_value(epsilon), MIN_DISTANCE, PROB_LB);
            z_robust_diff(epsilon, delta, times, iter) = mean(mean(abs(z_robust - z_robust_last))); 
        
            iter = iter+1;
        end
        running_time(epsilon, delta, times) = toc; 
        [z, z_fval(epsilon, delta, times)] = robust_obf_matrix2(x_coord, y_coord, CPR_prior_prob, patient_index, z, NR_LOC, NR_TASK, 0, epsilon_value(epsilon), MIN_DISTANCE, PROB_LB);
%         [z, z_fval(epsilon, delta, times)] = obf_matrix(x_coord, y_coord, CPR_prior_prob, patient_index, NR_LOC, NR_TASK, epsilon, GEOI_RANGE, PROB_LB); 

        nr_violates1(epsilon, delta, times) = testprunedlocation(z, NR_LOC, 1, epsilon, x_coord, y_coord); 
        nr_violates2(epsilon, delta, times) = testprunedlocation(z_robust, NR_LOC, 1, epsilon, x_coord, y_coord);
        
        end
    end
end

save ('.\running_time.mat', 'running_time'); 
save ('.\z_fval.mat', 'z_fval'); 
save ('.\z_fval_robust.mat', 'z_fval_robust'); 
save ('.\z_robust_diff.mat', 'z_robust_diff'); 
save ('.\nr_violates1.mat', 'nr_violates1'); 
save ('.\nr_violates2.mat', 'nr_violates2'); 
