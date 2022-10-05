function z_robust_red = precision_reduction(z_robust, CPR_prior_prob)
    [size_matrix_row, size_matrix_col] = size(z_robust); 
    z_robust_red = zeros(size_matrix_row/7, size_matrix_col/7); 
    for i = 1:1:size_matrix_row/7
        p_i = sum(CPR_prior_prob((i-1)*7 + 1: i*7));
        for j = 1:1:size_matrix_col/7
            z_robust_red(i,j) = p_i*sum(sum(z_robust((i-1)*7 + 1: i*7), (j-1)*7 + 1: j*7)); 
        end
    end
end