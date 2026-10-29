# PVT1 rs13255292 and Tumor Grade: Statistical Analysis and Visualization

## Project Overview

This project explores the distribution of the **PVT1 rs13255292 genotypes** across different breast tumor grades using published aggregate data. It demonstrates a reproducible workflow in R for organizing genotype counts, conducting statistical analysis, and creating scientific visualizations.

The project was developed as a learning and research portfolio project focused on statistical reasoning, data visualization, and reproducible analysis.

## Research Question

Is the distribution of PVT1 rs13255292 genotypes associated with breast tumor grade in the analyzed dataset?

## Dataset

The analysis uses published aggregate genotype counts categorized by tumor grade.

| Tumor Grade | CC | CT | TT | Total |
|---|---:|---:|---:|---:|
| Grade 1 | 1 | 2 | 0 | 3 |
| Grade 2 | 39 | 28 | 7 | 74 |
| Grade 3 | 13 | 9 | 1 | 23 |
| **Total** | **53** | **39** | **8** | **100** |

No individual-level patient data are included in this analysis.

## Statistical Analysis

The project includes:

- Genotype frequency and percentage calculations.
- Fisher's exact test to assess the association between genotype distribution and tumor grade.
- Cramér's V to describe the strength of association.
- Interpretation of statistical significance alongside the limitations of the dataset.

### Results

- **Fisher's exact test:** p = 0.8593
- **Cramér's V:** 0.0924

The analysis did not identify a statistically significant association between genotype distribution and tumor grade in this dataset. The estimated association strength was weak.

**Important limitation:** Grade 1 contains only three observations. This very small subgroup limits the precision and interpretation of comparisons involving Grade 1.

These findings describe the analyzed dataset and should not be interpreted as proof that no association exists in the wider population.

## Data Visualization

The project includes visualizations of genotype distribution across tumor grades, including:

- A stacked bar chart showing genotype percentages by tumor grade.
- A heatmap displaying genotype percentages across tumor grades.

Figures are saved in the `figures/` directory.

## Tools and Packages

- R
- RStudio
- `ggplot2`
- Statistical functions available in base R

## Project Structure

```text
PVT1_Ecadherin_Project/
├── scripts/
│   ├── data_setup_01.R
│   └── statistical_analysis_02.R
├── figures/
├── output/
├── data/
│   ├── raw/
│   └── clean/
└── README.md
```

## Reproducibility

The scripts are organized to prepare the aggregate dataset, perform the statistical analysis, and generate the outputs and visualizations.

Run the scripts from the project root directory in the intended order, starting with data preparation.

## Skills Demonstrated

- Data preparation and organization in R
- Categorical data analysis
- Fisher's exact test
- Effect size interpretation using Cramér's V
- Scientific data visualization with `ggplot2`
- Reproducible research workflows
- Interpretation of results and recognition of data limitations

## Scope and Disclaimer

This is an independent learning and portfolio project based on published aggregate data. It is not a clinical decision-making tool, and the results should be interpreted within the limitations of the analyzed dataset.
