# Research-on-Causal-Inference
## Causal Inference Research on the NSW Job Training Program

This repository contains the research analysis on the National Supported Work (NSW) Demonstration job-training program, focusing on evaluating its impact on earnings in 1978. Key aspects of the research are outlined below:

- **Objective**:
  - Assess whether participation in the NSW Job Training Program had a significant effect on earnings in 1978.
  - Perform causal analysis using propensity score matching to evaluate the program's effectiveness.

- **Dataset**:
  - **`nsw_mixtape`**: Data from the NSW job-training program.
  - Contains 445 rows and 11 variables, including treatment status and earnings information.

- **Research Question**:
  - Did joining the NSW Job Training Program improve earnings in 1978?

- **Methodology**:
  - **Response Model**:
    - Analyzes earnings as a function of treatment participation and various confounders.
    - Model: \( Y = \alpha_0 + \alpha_1 T + \alpha_2 Z_1 + \alpha_3 Z_2 + \alpha_4 Z_3 + \alpha_5 Z_4 + E \)
  - **Propensity Score Model**:
    - Estimates the probability of receiving treatment given covariates using logistic regression.
    - Model: \( \log \left( \frac{\pi}{1 - \pi} \right) = \beta_0 + \beta_1 Z_1 + \beta_2 Z_2 + \beta_3 Z_3 + \beta_4 Z_4 \)

- **Matching Techniques**:
  - **1:1 Nearest Neighbor Matching**:
    - Each treated unit is matched with the closest control unit based on the propensity score.
  - **Full Matching**:
    - Ensures every treated unit is matched with at least one control and vice versa, utilizing all units.

- **Balance Assessment**:
  - Standardized Mean Differences (SMD) were used to check covariate balance post-matching.
  - Goal: Achieve SMD values below 0.1 for good balance between treated and control groups.

- **Results**:
  - Estimated Average Treatment Effect (ATE) on earnings in 1978 was \$1977 (SE = 704, p = 0.00501).
  - Indicates a significant positive impact of the NSW program on earnings.

- **Conclusion**:
  - The analysis suggests that the NSW job-training program had a positive and statistically significant effect on earnings.
  - Further research could enhance understanding of the program’s long-term impact.

- **Future Work**:
  - Address potential unobserved confounders.
  - Explore advanced causal methods (e.g., instrumental variables, difference-in-differences).
  - Conduct long-term impact analysis.

For detailed code and data analysis, please refer to the provided scripts and documentation in this repository.
