function max_r = maxratioapprox(z, DELTA, NR_LOC, i, j, distance, EPSILON)
    z_inst = z(i, :); 
    z_inst(i) = 0.0;
    topk = maxk(z_inst, DELTA); 
    max_r = (1 - sum(topk)/exp(distance*EPSILON))/(1 - sum(topk)); 
end