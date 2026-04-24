library(tidyverse)
library(janitor)
library(here)

here::i_am("Code/01_clean_data.R")

dir.create(here("Output"), showWarnings = FALSE)

# Read & open dataset
prem_20 <- read_csv(here("Prem_2020.csv"))

# Clean all variable names + create new variable
prem_clean <- prem_20 %>%
  janitor::clean_names() %>%
  mutate(goal_contribution = goals + assists)

saveRDS(prem_clean, here("Output", "prem_clean.rds"))

# Check total missing values in dataset
total_missing <- sum(is.na(prem_clean))
total_missing

# Missing values by column
total_missing <- sum(is.na(prem_clean))
missing_by_column <- colSums(is.na(prem_clean))

print(total_missing)
print(missing_by_column)