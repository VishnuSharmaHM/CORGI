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
    
end

