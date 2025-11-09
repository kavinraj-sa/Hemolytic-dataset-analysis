# Load essential libraries for data manipulation and reading Excel files
library(dplyr)
library(openxlsx)
library(writexl)
library(readxl)



# Set your working directory to the folder containing your data file
setwd("C:/Users/dell/Downloads")  # Change path as needed

# Read the Excel file into an R dataframe named 'master_Data'.
# Ensure the file 'hemolytik_analy.xlsx' exists at this location.
master_Data <- read_excel("hemolytik_analy.xlsx")

# Store all unique categories found in the 'non_hem' column before modifying it.
original_categories <- unique(master_Data$non_hem)

# Data cleaning: Convert all entries in 'non_hem' column to type 'character'.
master_Data$non_hem <- as.character(master_Data$non_hem)
# Step 1: Replace any string value that is the literal "NA" with actual NA values.
master_Data$non_hem[master_Data$non_hem == "NA"] <- NA
# Step 2: Replace all resulting NA values with "Hemolytic" (i.e., treat them as hemolytic).
master_Data$non_hem[is.na(master_Data$non_hem)] <- "Hemolytic"

# List of columns relevant for checking unique peptide entries.
relevant_cols <- c("seq", "MAP", "cter", "nter", "lyn_cyc", "ldmix", "non_nat", "source", "activity")

# Count unique rows in the full dataset, using only selected informative columns.
num_unique_rows <- nrow(unique(master_Data[, relevant_cols]))

# Create a subset containing only entries labeled "Hemolytic".
hemolytic_data <- master_Data %>% filter(non_hem == "Hemolytic")

# Create a subset for entries categorized as "Non-hemolytic" or "Low hemolytic".
low_non_hemolytic_data <- master_Data %>% filter(non_hem %in% c("Non-hemolytic", "Low hemolytic"))

# For each subset, count the number of unique rows (based on relevant columns).
unique_hemolytic <- nrow(unique(hemolytic_data[, relevant_cols]))
unique_low_non_hemolytic <- nrow(unique(low_non_hemolytic_data[, relevant_cols]))

# Print a summary of results, showing categories and counts for transparency.
cat("Original non_hem categories:", paste(original_categories, collapse = ", "), "\n")
cat("Unique rows in full dataset:", num_unique_rows, "\n")
cat("Unique hemolytic entries:", unique_hemolytic, "\n")
cat("Unique low/non hemolytic entries:", unique_low_non_hemolytic, "\n")



