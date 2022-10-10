%% New results
load('.\new results\nr_violates1_epsilon_delta.mat'); 
load('.\new results\nr_violates2_epsilon_delta.mat'); 

nr_violates_delta0 = [nr_violates1(:, 1), nr_violates2(:, 1)]; 
nr_violates_delta1 = [nr_violates1(:, 2), nr_violates2(:, 2)]; 
nr_violates_delta2 = [nr_violates1(:, 3), nr_violates2(:, 3)]; 

tiledlayout(1,3);
nexttile
bar(nr_violates_delta0);
nexttile
bar(nr_violates_delta1);
nexttile
bar(nr_violates_delta2);