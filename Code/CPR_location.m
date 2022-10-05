function [CPR_x, CPR_y, CPR_loc_index] = CPR_location(prior_prob, x_coord, y_coord, NR_CPR, NR_LOC)
    prior_prob_cumsum = cumsum(prior_prob); 
    for i = 1:1:NR_CPR        
        seed = rand();
        for k = 1:1:NR_LOC-1
            if seed < prior_prob_cumsum(1)
                CPR_x(i) = x_coord(1);
                CPR_y(i) = y_coord(1);
                CPR_loc_index(i) = 1; 
            end
            if prior_prob_cumsum(k) <= seed && seed < prior_prob_cumsum(k+1)
                CPR_x(i) = x_coord(k+1);
                CPR_y(i) = y_coord(k+1);
                CPR_loc_index(i) = k+1;
            end
        end
    end
end

