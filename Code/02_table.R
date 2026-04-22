library(tidyverse)
library(knitr)
library(here)

here::i_am("Code/02_table.R")

prem_clean <- readRDS(here("Output", "prem_clean.rds"))

## Table
table_pos <- prem_clean %>%
  mutate(goal_contribution = goals + assists) %>%
  group_by(position) %>%
  summarise(
    n_players = n(),
    mean_apps = mean(appearances, na.rm = TRUE),
    mean_goals = mean(goals, na.rm = TRUE),
    mean_assists = mean(assists, na.rm = TRUE),
    mean_g_a = mean(goal_contribution, na.rm = TRUE),
    .groups = "drop"
  ) %>%
  arrange(desc(mean_g_a))

knitr::kable(
  table_pos,
  caption = "Premier League 2020: Average Performance by Position",
  digits = 2,
  col.names = c("Position", "N", "Mean apps", "Mean goals", "Mean assists", "Mean (G+A)")
)

saveRDS(table_pos, here("Output", "table_pos.rds"))