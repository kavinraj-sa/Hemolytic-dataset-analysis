Hemolytic Peptide Activity Prediction
Machine-learning pipeline to predict the hemolytic activity of peptides using physicochemical and compositional features extracted from amino acid sequences.

Publication

Hemolytik 2: An Updated Database of Hemolytic Peptides and Proteins
Ayushi Singh, Kavin Raj SA, Anand Singh Rathore, Gajendra P. S. Raghava
Chemical Research in Toxicology, 2026, 39, 208–215
DOI: 10.1021/acs.chemrestox.5c00322

The dataset used in this project is sourced from Hemolytik 2.0, a manually curated database of 13,215 experimentally validated hemolytic and non-hemolytic peptide entries.
Project Overview
The goal is to train binary classifiers that distinguish hemolytic (label = 1) from non-hemolytic / low-hemolytic (label = 0) peptides based on their sequence-derived features.
Pipeline Stages
Raw Data
   │
   ▼
1. Data Preparation        Shuffle dataset, export FASTA files
   │
   ▼
2. Feature Extraction      Pfeature descriptors (16 types) + BioPython ProtParam
   │
   ▼
3. Data Analysis           Length distribution, AAC comparison, sequence logos
   │
   ▼
4. ML Classification       9 classifiers × multiple feature sets, 5-fold CV + hold-out test
   │
   ▼
5. Feature Importance      SHAP analysis, LR coefficients, feature–label correlation
Feature Sets
NameDescriptors IncludedAACAmino Acid CompositionDPCDipeptide CompositionPCPPhysicochemical Properties CompositionDDRDistance Distribution of ResiduesBTCBond CompositionTPCTripeptide CompositionATCAtomic CompositionRRIResidue Repeat InformationSEP / SER / SPCShannon Entropy variantsCTCConjoint TriadPAAC / APAACPseudo / Amphiphilic Pseudo AACQSO / SOCQuasi Sequence Order / Sequence Order CouplingAAC+DPCCombinedAAC+DPC+PCPCombinedCOMPLETEAll 16 descriptor types + ProtParamTOP5Top-5 SHAP-ranked groups: PCP, DDR, DPC, BTC, CTC

Models Evaluated
ModelLibraryLightGBMlightgbmRandom Forestscikit-learnExtra Treesscikit-learnXGBoostxgboostGradient Boostingscikit-learnLogistic Regressionscikit-learnAdaBoostscikit-learnDecision Treescikit-learnRidge Classifierscikit-learn
Each model is evaluated with 5-fold stratified cross-validation on the training set and on a held-out 20 % test set.
Metrics reported: Sensitivity, Specificity, Accuracy, AUC, MCC, F1, Precision, Recall.
Data Labels
LabelMeaning1Hemolytic0Non-hemolytic / Low-hemolytic

Citation
If you use this code or the Hemolytik 2.0 database, please cite:
bibtex@article{singh2026hemolytik2,
  author  = {Singh, Ayushi and Kavin Raj, SA and Rathore, Anand Singh and Raghava, Gajendra P. S.},
  title   = {Hemolytik 2: An Updated Database of Hemolytic Peptides and Proteins},
  journal = {Chemical Research in Toxicology},
  year    = {2026},
  volume  = {39},
  pages   = {208--215},
  doi     = {10.1021/acs.chemrestox.5c00322}
}

License
This project is released for academic and research use. Please refer to the Hemolytik 2.0 database terms at https://webs.iiitd.edu.in/raghava/hemolytik2/ for data usage.
