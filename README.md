
# CORGI #

Main repository for "CORGI: User Customizable and Robust Geo-Indistinguishability for Location Privacy"

## Brief Intro ##
CORGI ( Cust Omizable Robust Geo Indistinguishability), a framework for generating location obfuscation with strong privacy guarantees (based on Geo-Ind) that effectively allows users to balance the trade-off between privacy, utility, and customization. CORGI utilizes an untrusted server for performing the computationally heavy task of generating the obfuscation function while ensuring the privacy of the user.

<br />

![](Results/CORGI.png)

## Repository Structure ##

```bash
├── Code
│   ├── CPR_location.m
│   ├── dataprocessing.asv
│   ├── dataprocessing.m
│   ├── figures.m
│   ├── haversine.m
│   ├── main.asv
│   ├── main.m
│   ├── maxratio.asv
│   ├── maxratio.m
│   ├── maxratioapprox.m
│   ├── newfigures.m
│   ├── obf_laplace.m
│   ├── obf_matrix.m
│   ├── parameters.m
│   ├── robust_obf_matrix.m
│   ├──robust_obf_matrix2.m
│   ├──testprunedlocation.asv
│   └── testprunedlocation.m
├── Results
│   ├── CPR.csv
│   ├── Cooordinates7.xlsx
│   ├── Coordinates.csv
│   ├── Coordinates.xls
│   ├── Coordinates3layer.xlsx
│   ├── Coordinates_update.xlsx
│   ├── Tree_Structure.xlsx
│   ├── prior_prob_343.mat
│   └── tree.txt
├── Data
│   ├── CORGI.png
│   ├── z_fval_delta2.mat
│   ├── z_fval_delta3.mat
│   ├── z_fval_delta4.mat
│   ├── z_fval_delta5.mat
│   ├── z_fval_delta5_1.mat
│   ├── z_fval_delta_diff.mat
│   ├── z_fval_delta_diff_70.mat
│   ├── z_fval_robust_delta2.mat
│   ├── z_fval_robust_delta3.mat
│   ├── z_fval_robust_delta4.mat
│   ├── z_fval_robust_delta5.mat
│   ├── z_fval_robust_delta5_1.mat
│   ├── z_fval_robust_delta_diff.mat
│   ├── z_fval_robust_delta_diff_70.mat
│   ├── z_robust_diff_delta2.mat
│   ├── z_robust_diff_delta4.mat
│   ├── z_robust_diff_delta5.mat
│   ├── z_robust_diff_delta5_1.mat
│   ├── z_robust_diff_delta_diff.mat
│   └── z_robust_diff_delta_diff_70.mat
└── README.md
```
## Code Guide ##
1. Install the MATLAB if it is not installed in your system.
2. Update the address of the data directory and the address of the ouput file to the approriate address in main.m (In Code directory).
    > xy_coord = xlsread('.\data\Coordinates3layer.xlsx')  <br />
    > load('.\data\prior_prob_343.mat')  <br />
    > save ('.\running_time.mat', 'running_time')  <br />
    > save ('.\z_fval.mat', 'z_fval')  <br />
    > save ('.\z_fval_robust.mat', 'z_fval_robust')  <br />
    > save ('.\z_robust_diff.mat', 'z_robust_diff')  <br />
    > save ('.\nr_violates1.mat', 'nr_violates1')  <br />
    > save ('.\nr_violates2.mat', 'nr_violates2')  <br />
3. Update the values of the parameter.m (In Code directory) file.
    a. NR_TASK - Number of Target location. <br />
    b. NR_LOC  - Total number of coordinates in the tree. <br />
    c. EPSILON - Privacy budget. <br />
    d. EPSILON_FIRST - Intial value of EPSILON. <br />
    e. EPSILON_LAST - End value of EPSILON. <br />
    f. EPSILON_INCR - Increment value for loop. <br />
    g. DELTA - Number of locations to be pruned. <br />
    h. ITER_MAX - Number of interations for each delta value. <br />
4. Execute the main.m in MATLAB (In Code directory).
5. After execution is completed, 6 .mat file will be stored in data directory. <br />
    a. running_time.mat <br />
    b. z_fval.mat <br />
    c. z_fval_robust.mat <br />
    d. z_robust_diff.mat <br />
    e. nr_violates1.mat <br />
    f. nr_violates2.mat <br />

## Correspondence ##

📬 Primal Pappachan [📜](mailto:primal@psu.edu) [Homepage](https://primalpappachan.com/)<br />
📬 Chenxi Qiu [📜](mailto:chenxi.qiu@unt.edu) [Homepage](https://computerscience.engineering.unt.edu/people/faculty/chenxi-qiu)<br />
📬 Anna Squicciarini [📜](mailto:acs20@psu.edu) [Homepage](https://faculty.ist.psu.edu/acs20/)<br />
📬 Vishnu Sharma Hunsur Manjunath [📜](mailto:vxh5104@psu.edu) [Homepage](mailto:vxh5104@psu.edu)<br />

## License

[BSD-3-Clause License](https://choosealicense.com/licenses/bsd-3-clause/)
