# Longitudinal Data Analysis Exercises

Completed exercises for the Longitudinal Data Analysis course at Technical University Eindhoven (TU/e), following the 2022 Q1 curriculum. Implemented in SAS.

## The Problem

- Longitudinal data analysis covers techniques for modelling repeated measurements over time — a topic not covered in standard statistics curricula.
- Course exercises required working with mixed models, variance components, and repeated-measures ANOVA in SAS.
- Sharing completed exercises with documentation helps others learning the same material.

## The Approach

**Inputs:** Course datasets in `data/raw/`, covering longitudinal study scenarios with repeated measurements.

**Processing:** SAS programs in `src/` implement the required analyses. Where exercises ask for a minimum, additional SAS exploration is included with comments explaining both the SAS-specific syntax and the underlying statistical reasoning.

**Outputs:** SAS output files; processed results in `data/processed/`; documentation and images in `docs/`.

## Value Delivered

- Fully worked exercises with explanatory comments for each statistical technique covered.
- Practical SAS code for mixed models, variance component analysis, and repeated-measures ANOVA.
- Useful reference for students taking the same or similar courses.

## Scope & Status

- **Project type:** Academic learning exercises
- **Current state:** Archived (2022 Q1 curriculum complete)
- **Known limitations:**
  - SAS-specific; not portable to R or Python without rewriting.
  - Exercises follow the 2022 Q1 offering; later versions of the course may differ.
  - Requires a SAS licence to run.

## Tech Stack

- **Language:** SAS
- **Platform:** SAS OnDemand for Academics (free student licence)

## Who This Is For

Students taking Longitudinal Data Analysis at TU/e or similar courses, and anyone learning applied SAS for repeated-measures analysis.

## Getting Started

1. Clone the repository.
2. Set up a free [SAS OnDemand for Academics](https://www.sas.com/en_us/software/on-demand-for-academics.html) account.
3. In SAS Studio, create the directory structure shown below and upload files from `data/raw/` and `src/`.
4. Run the programs in SAS Studio.

```
project/
  ├── data/
  │   ├── raw/
  │   └── processed/
  ├── docs/
  └── src/
```

## License

MIT.

## Author

Adam Broniewski — [GitHub](https://github.com/abroniewski) | [LinkedIn](https://www.linkedin.com/in/abroniewski/)
