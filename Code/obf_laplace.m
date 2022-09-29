%% Location obfuscation via Laplace distribution
% This function is used to generate Laplacian noise to a given real
% location 
function z = obf_laplace(x_coord, y_coord, NR_LOC, EPSILON)
    distance = zeros(NR_LOC, NR_LOC);
    
    for k = 1:1:NR_LOC
        for l = 1:1:NR_LOC
            distance(k, l) = sqrt((x_coord(k) - x_coord(l))^2 + (y_coord(k) - y_coord(l))^2);
        end
    end
    
    
    z = exp(-EPSILON.*distance); 
    for k = 1:1:NR_LOC
        z(k, :) = z(k, :)/sum(z(k, :)); 
    end
    
    z = reshape(z, NR_LOC*NR_LOC, 1); 
    
%% Show the cloaking area of the obfuscated location    
%     discrete_points_x = nonzeros(intersGPS(:, 2).*mark_index);
%     discrete_points_y = nonzeros(intersGPS(:, 3).*mark_index);
%     plot(intersGPS(:, 2), intersGPS(:, 3), 's');
%     hold on;
%     plot(discrete_points_x, discrete_points_y, 'o');
    
end

