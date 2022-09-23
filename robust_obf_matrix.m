function [z, z_fval] = robust_obf_matrix(x_coord, y_coord, CPR_prior_prob, patient_index)
    % NR_LOC: Number of discrete locations
    
    % x_coord: the vector including the x coordinate of all the discrete locations
    % y_coord: the vector including the y coordinate of all the discrete locations
    % CPR_prior_prob: the prior distribution of workers 
    
    % Represent obfuscation matrix Z by a vector z, where each entry z_{l,k} in Z 
    % is written as z((l-1)*NR_PATIENT + k) in the vector
   
    parameters; 
    
    %% Inequality constraint A, b
    % Geo-indistinguishability constraints: 
    % the number of constraints is NR_LOC*(NR_LOC-1)*NR_LOC
    % the number of decision variables is NR_LOC*NR_LOC
    
    % func_value = obj_function(z, x_coord, y_coord, CPR_prior_prob, patient_index, NR_LOC, NR_PATIENT); 
    % constraint_value = quadconstr(z, DELTA, x_coord, y_coord, NR_LOC, EPSILON); 
    

    A = zeros(NR_LOC*NR_LOC*2, NR_LOC*(NR_LOC+2));
    index = 1;
    for i = 1:1:NR_LOC
        for j = 1:1:NR_LOC
            A(index, (i-1)*(NR_LOC+2)+j) = 1;
            A(index, (i-1)*(NR_LOC+2)+NR_LOC+1) = -1;
            index = index + 1;
            A(index, (i-1)*(NR_LOC+2)+j) = -1;
            A(index, (i-1)*(NR_LOC+2)+NR_LOC+2) = 1;
            index = index + 1;
        end
    end
    b = zeros(NR_LOC*NR_LOC*2, 1); 


    %% Equality constraint Aeq, beq
    % Probablity unit measure
	Aeq = zeros(NR_LOC, NR_LOC*(NR_LOC+2));
    beq = ones(NR_LOC, 1); 
    
    for k = 1:1:NR_LOC
        for l = 1:1:NR_LOC
            Aeq(k, (k-1)*(NR_LOC+2) + l) = 1;
        end
        % z_{k, 1}+z_{k, 2}+...+z_{k, K} = 1
    end
    
    %% Each z is in the range of [0, 1]
	lb = zeros(NR_LOC*(NR_LOC+2), 1);
    ub = ones(NR_LOC*(NR_LOC+2), 1);
    
    fun = @(z)obj_function(z, x_coord, y_coord, CPR_prior_prob, patient_index, NR_LOC, NR_PATIENT);
    nonlconstr = @(z)quadconstr(z, DELTA, x_coord, y_coord, NR_LOC, EPSILON);
    
%     options = optimoptions(@fmincon,'Algorithm','interior-point',...
%     'SpecifyObjectiveGradient',true,'SpecifyConstraintGradient',true,...
%     'HessianFcn',@(x,lambda)quadhess(x,lambda,Q,H));
    
    z0 = zeros(1, NR_LOC*(NR_LOC+2));
    for i = 1:1:NR_LOC
        z0(1, i*(NR_LOC+2)) = 1; 
    end
    z = fmincon(fun, z0, A, b, Aeq, beq, lb, ub, nonlconstr, options); 
    
    
    % Represent obfuscation matrix Z by a vector z, where each z_{i,j} -> z((i-1)*NR_LOC + j)
    z = reshape(z, NR_LOC+2, NR_LOC);                                         % reshape the obfuscation vector to matrix
    z = z'; 
    f_ = reshape(f, NR_LOC, NR_LOC); 
    f_ = f_';
end

