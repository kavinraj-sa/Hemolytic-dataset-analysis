Here is a clean, GitHub‑ready `README.md` based on your description:

***

# Hemolytic Peptide Activity Prediction

Machine learning pipeline to predict the hemolytic activity of peptides using physicochemical and compositional features extracted from amino acid sequences. The models are trained on data derived from Hemolytik 2.0, an updated, manually curated database of experimentally validated hemolytic and non‑hemolytic peptides. [webs.iiitd.edu](https://webs.iiitd.edu.in/raghava/hemolytik2/)

## Publication

If you use this repository, please cite the associated paper:

> **Hemolytik 2: An Updated Database of Hemolytic Peptides and Proteins**  
> Ayushi Singh, Kavin Raj S A, Anand Singh Rathore, Gajendra P. S. Raghava  
> *Chemical Research in Toxicology*, 2026, 39, 208–215  
> DOI: 10.1021/acs.chemrestox.5c00322 [pubmed.ncbi.nlm.nih](https://pubmed.ncbi.nlm.nih.gov/41525503/)

## Dataset

The dataset used in this project is sourced from **Hemolytik 2.0**, a manually curated database containing 13,215 experimentally validated hemolytic and non‑hemolytic peptide entries. [sciety-labs.elifesciences](https://sciety-labs.elifesciences.org/articles/by?article_doi=10.1101%2F2025.05.12.653624)

Each peptide is annotated with its amino acid sequence and hemolytic activity, which is used to derive binary labels for model training.

- Label `1`: Hemolytic  
- Label `0`: Non‑hemolytic or low‑hemolytic  

For more details on Hemolytik 2.0 and data access, see:  
https://webs.iiitd.edu.in/raghava/hemolytik2/ [webs.iiitd.edu](https://webs.iiitd.edu.in/raghava/hemolytik2/)

## Project Overview

The goal of this project is to train binary classifiers that distinguish **hemolytic** (label = 1) from **non‑hemolytic / low‑hemolytic** (label = 0) peptides based on sequence‑derived features.

High‑level stages:

1. Raw data  
2. Data preparation  
3. Feature extraction  
4. Exploratory analysis  
5. Machine‑learning classification  
6. Feature importance and interpretation

### Pipeline

```text
Raw Data (Hemolytik 2.0)
        │
        ▼
Data Preparation
    - Shuffle dataset
    - Train/test split
    - Export FASTA files
        │
        ▼
Feature Extraction
    - Pfeature descriptors (16 types)
    - BioPython ProtParam features
        │
        ▼
Data Analysis
    - Length distribution
    - Amino Acid Composition (AAC) comparison
    - Sequence logos and basic EDA
        │
        ▼
ML Classification
    - 9 classifiers × multiple feature sets
    - 5-fold stratified CV + held-out test set
        │
        ▼
Feature Importance
    - SHAP analysis
    - Logistic regression coefficients
    - Feature–label correlation
```

## Feature Sets

Features are primarily computed using **Pfeature** descriptor groups plus additional **ProtParam**-style sequence features. [github](https://github.com/raghavagps/Hemolytik2)

| Feature Set Name | Description |
| ---------------- | ----------- |
| AAC              | Amino Acid Composition |
| DPC              | Dipeptide Composition |
| PCP              | Physicochemical Properties Composition |
| DDR              | Distance Distribution of Residues |
| BTC              | Bond Composition |
| TPC              | Tripeptide Composition |
| ATC              | Atomic Composition |
| RRI              | Residue Repeat Information |
| SEP / SER / SPC  | Shannon Entropy–based descriptors |
| CTC              | Conjoint Triad Composition |
| PAAC / APAAC     | Pseudo / Amphiphilic Pseudo Amino Acid Composition |
| QSO / SOC        | Quasi Sequence Order / Sequence Order Coupling |
| AAC + DPC        | Combined AAC and DPC features |
| AAC + DPC + PCP  | Combined AAC, DPC, and PCP features |
| COMPLETE         | All 16 descriptor types + ProtParam features |
| TOP5             | Top‑5 SHAP‑ranked groups: PCP, DDR, DPC, BTC, CTC |

Depending on configuration, models can be trained on individual feature groups or on concatenated feature sets (e.g., `AAC+DPC`, `COMPLETE`, `TOP5`).

## Models Evaluated

The following binary classifiers are implemented and evaluated:

| Model               | Library       |
| ------------------- | ------------ |
| LightGBM            | `lightgbm`   |
| Random Forest       | `scikit-learn` |
| Extra Trees         | `scikit-learn` |
| XGBoost             | `xgboost`    |
| Gradient Boosting   | `scikit-learn` |
| Logistic Regression | `scikit-learn` |
| AdaBoost            | `scikit-learn` |
| Decision Tree       | `scikit-learn` |
| Ridge Classifier    | `scikit-learn` |

Each model is trained with:

- **5‑fold stratified cross‑validation** on the training set  
- Evaluation on a held‑out **20% test set**  

Metrics reported:

- Accuracy  
- Sensitivity (Recall for the positive class)  
- Specificity  
- Precision  
- F1‑score  
- Matthews Correlation Coefficient (MCC)  
- Area Under the ROC Curve (AUC)

## Data Labels

The binary classification task uses the following label scheme:

| Label | Meaning                          |
| ----- | -------------------------------- |
| 1     | Hemolytic                        |
| 0     | Non‑hemolytic / Low‑hemolytic    |

## How to Use

Typical workflow (assuming code and scripts are organized in this repository):

1. **Prepare data**  
   - Download or export peptide entries from Hemolytik 2.0.  
   - Convert to the required CSV/FASTA format with sequence and label columns. [sciety-labs.elifesciences](https://sciety-labs.elifesciences.org/articles/by?article_doi=10.1101%2F2025.05.12.653624)

2. **Run feature extraction**  
   - Use Pfeature and BioPython ProtParam scripts to compute features from sequences.  

3. **Train models**  
   - Select a feature set (e.g., `TOP5`, `COMPLETE`).  
   - Run the training script to perform cross‑validation and test evaluation.

4. **Inspect results**  
   - Review performance metrics and confusion matrices.  
   - Examine SHAP plots or coefficient tables for feature importance.

(You can adapt this section to match your actual script names and CLI usage.)

## Citation

If you use this code or the Hemolytik 2.0 database in your work, please cite:

```bibtex
@article{singh2026hemolytik2,
  author  = {Singh, Ayushi and Kavin Raj, S A and Rathore, Anand Singh and Raghava, Gajendra P. S.},
  title   = {Hemolytik 2: An Updated Database of Hemolytic Peptides and Proteins},
  journal = {Chemical Research in Toxicology},
  year    = {2026},
  volume  = {39},
  pages   = {208--215},
  doi     = {10.1021/acs.chemrestox.5c00322}
}
```

## License and Data Usage

This project is released for **academic and research use**.

- Please refer to the Hemolytik 2.0 database terms for data usage and redistribution:  
  https://webs.iiitd.edu.in/raghava/hemolytik2/ [webs.iiitd.edu](https://webs.iiitd.edu.in/raghava/hemolytik2/)

Check the specific license files in this repository (if present) for code usage terms.

***
