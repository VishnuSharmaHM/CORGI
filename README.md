[![arXiv](https://img.shields.io/badge/arXiv-2206.08396-b31b1b.svg)](https://arxiv.org/abs/2206.08396) [![conference](https://img.shields.io/badge/EDBT/ICDT--2023-Review-Review)](https://www.edbt.org/)

# CORGI #

Main repository for ["CORGI: User Customizable and Robust Geo-Indistinguishability for Location Privacy" (EDBT/ICDT 2023)](https://arxiv.org/abs/2206.08396?context=cs) 
 [[bibtex](#citation)]
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
├── README.md
```

## Correspondence ##

📬 Primal Pappachan [📜](mailto:primal@psu.edu) [Homepage](https://primalpappachan.com/)<br />
📬 Chenxi Qiu [📜](mailto:chenxi.qiu@unt.edu) [Homepage](https://computerscience.engineering.unt.edu/people/faculty/chenxi-qiu)<br />
📬 Anna Squicciarini [📜](mailto:acs20@psu.edu) [Homepage](https://faculty.ist.psu.edu/acs20/)<br />
📬 Vishnu Sharma Hunsur Manjunath [📜](mailto:vxh5104@psu.edu) [Homepage](mailto:vxh5104@psu.edu)<br />

## License

[BSD-3-Clause License](https://choosealicense.com/licenses/bsd-3-clause/)
