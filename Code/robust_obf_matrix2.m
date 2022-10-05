function [z, z_fval, row_indx] = robust_obf_matrix2(x_coord, y_coord, CPR_prior_prob, patient_index, z_last, NR_LOC, NR_TASK, DELTA, EPSILON, MIN_DISTANCE, GEOI_RANGE, PROB_LB)
    % NR_LOC: Number of discrete locations
    
    % x_coord: the vector including the x coordinate of all the discrete locations
    % y_coord: the vector including the y coordinate of all the discrete locations
    % CPR_prior_prob: the prior distribution of workers 
    
    % Represent obfuscation matrix Z by a vector z, where each entry z_{l,k} in Z 
    % is written as z((l-1)*NR_TASK + k) in the vector
   
    % parameters; 
    
    %% Inequality constraint A, b
    % Geo-indistinguishability constraints: 
    % the number of constraints is NR_LOC*(NR_LOC-1)*NR_LOC
    % the number of decision variables is NR_LOC*NR_LOC
     
    A = sparse(1, NR_LOC*NR_LOC); 
    row_indx = 1;

    distance_matrix = zeros(NR_LOC, NR_LOC);
    adjacency_matrix = zeros(NR_LOC, NR_LOC);
    for i = 1:1:NR_LOC
        for j = 1:1:NR_LOC
            if i ~= j
                distance_matrix(i, j) = haversine([x_coord(1, i) y_coord(1, i)], [x_coord(1, j) y_coord(1, j)]);
                if distance_matrix(i, j) <= MIN_DISTANCE*sqrt(3)
                    adjacency_matrix(i, j) = 1;
%                     plot([x_coord(1, i) x_coord(1, j)], [y_coord(1, i) y_coord(1, j)]); 
%                     hold on; 
                end
            else
                distance_matrix(i, j) = inf; 
            end
        end
    end

    DISTANCE_MIN = min(min(distance_matrix)); 

    max_r_flag = 0; 
    for k = 1:1:NR_LOC
        if distance_matrix(i, k) <= GEOI_RANGE
            for i = 1:1:NR_LOC
                if distance_matrix(j, k) <= GEOI_RANGE
                inst = find(adjacency_matrix(i, :) == 1);
                    for j = 1:1:size(inst, 2)
        %                 [i, inst(j), k]
                        distance = distance_matrix(i, inst(j)); % haversine([x_coord(1, i) y_coord(1, i)], [x_coord(1, j) y_coord(1, j)]); % sqrt((x_coord(1, i) - x_coord(1, j))^2 + (y_coord(1, i) - y_coord(1, j))^2); % distance between location i and location j
        %                if ceil(i/7) == ceil(j/7) && ceil(k/7) == ceil(i/7)
                         if distance <= MIN_DISTANCE*sqrt(3)
                            % max_r = maxratio(z_last, DELTA, NR_LOC, i, j); 
                            distance = MIN_DISTANCE;
                            max_r = maxratioapprox(z_last, DELTA, NR_LOC, i, inst(j), distance, EPSILON);
                            max_r = min([max_r exp(EPSILON*distance)]);  
                            A(row_indx, (i-1)*NR_LOC+k) = max_r;               
                            A(row_indx, (inst(j)-1)*NR_LOC+k) = -exp(EPSILON*distance);
                            % z_{i,k} - z_{j,k}*exp(EPSILON*distance) <= 0
                            row_indx = row_indx + 1;
        
                            if max_r > max_r_flag
                                max_r_flag = max_r; 
                            end
                            
                            % max_r = maxratio(z_last, DELTA, NR_LOC, j, i); 
                            distance = MIN_DISTANCE; 
                            max_r = maxratioapprox(z_last, DELTA, NR_LOC, inst(j), i, distance, EPSILON);
                            max_r = min([max_r exp(EPSILON*distance)]); 
                            A(row_indx, (inst(j)-1)*NR_LOC+k) = max_r;
                            A(row_indx, (i-1)*NR_LOC+k) = -exp(EPSILON*distance);
                            % z_{j,k} - z_{i,k}*exp(EPSILON*distance) <= 0
                            row_indx = row_indx + 1;
        
                            if max_r > max_r_flag
                                max_r_flag = max_r; 
                            end
        
                         end
                    end
                end
            end
        end
    end
    max_r_flag
    % b = zeros(NR_LOC*(NR_LOC-1)*NR_LOC, 1); 
    b = zeros(row_indx-1, 1);
%     [ratio_max mar_r_max epsilon_max]
    
    %% Equality constraint Aeq, beq

    % Probablity unit measure
%	Aeq = zeros(NR_LOC, NR_LOC*NR_LOC);
    Aeq = sparse(NR_LOC, NR_LOC*NR_LOC); 


    beq = ones(NR_LOC, 1); 
    
    for k = 1:1:NR_LOC
        for l = 1:1:NR_LOC
            Aeq(k, (k-1)*NR_LOC + l) = 1;
        end
        % z_{k, 1}+z_{k, 2}+...+z_{k, K} = 1
    end
    
    %% Each z is in the range of [0, 1]
	lb = ones(NR_LOC*NR_LOC,1)*PROB_LB;
    ub = ones(NR_LOC*NR_LOC,1);
    
    %% Objective function: 
    % objective: sum_{k,l} sum_n CPR_prior_prob(k, 1)*abs(distance_{obfuscated location l to destination n} - distance__{real location k to destination n}) z_{k,l}
    % => the coefficint for each z_{k,l} is: sum_n CPR_prior_prob(k, 1)*abs(distance_{obfuscated location l to destination n} - distance__{real location k to destination n})
    f = zeros(NR_LOC*NR_LOC, 1);
	for k = 1:1:NR_LOC
        for l = 1:1:NR_LOC
            f((k-1)*NR_LOC + l, 1) = 0;
            for j = 1:1:NR_TASK
                % calculate the distance from the obfuscated location l to the patient
                [distance_l, ~, ~] = haversine([x_coord(l) y_coord(l)], [x_coord(patient_index(j)) y_coord(patient_index(j))]); %sqrt((x_coord(l) - x_coord(patient_index(j)))^2 + (y_coord(l) - y_coord(patient_index(j)))^2);
                % calculate the distance from the real location k to the patient
                [distance_k, ~, ~] = haversine([x_coord(k) y_coord(k)], [x_coord(patient_index(j)) y_coord(patient_index(j))]); % sqrt((x_coord(k) - x_coord(patient_index(j)))^2 + (y_coord(k) - y_coord(patient_index(j)))^2);
                % add the distance error to the coefficient for z_{k, l}
                f((k-1)*NR_LOC + l, 1) = f((k-1)*NR_LOC + l, 1) + abs(distance_l - distance_k); 
            end
            f((k-1)*NR_LOC + l, 1) = f((k-1)*NR_LOC + l, 1)*CPR_prior_prob(k, 1); 
        end     
    end
    options = optimoptions('linprog','Algorithm','dual-simplex');
%     options=optimset('LargeScale','on','TolFun',.001,'MaxIter',100000,'MaxFunEvals',100000, 'Algorithm','dual-simplex');

%     options.Preprocess = 'none';



%    [z, z_fval] = linprog(f, [], [], Aeq, beq, lb, ub, options);                       % Represent obfuscation matrix Z by a vector z, where each z_{i,j} -> z((i-1)*NR_LOC + j)
     [z, z_fval] = linprog(f, A, b, Aeq, beq, lb, ub, options);                       % Represent obfuscation matrix Z by a vector z, where each z_{i,j} -> z((i-1)*NR_LOC + j)

    z = reshape(z, NR_LOC, NR_LOC);                                         % reshape the obfuscation vector to matrix
    z = z'; 
    f_ = reshape(f, NR_LOC, NR_LOC); 
    f_ = f_';
end

