library(tidyverse)
library(here)

here::i_am("Code/03_figure.R")

dir.create(here("Output"), showWarnings = FALSE)

prem_clean <- readRDS(here("Output", "prem_clean.rds"))

# Scatterplot by position to check linear relationship
p <- prem_clean %>%
  mutate(goal_contribution = goals + assists) %>%
  ggplot(aes(x = appearances, y = goal_contribution, color = position)) +
  geom_point(size = 3, alpha = 0.8) +
  geom_smooth(aes(group = position), method = "lm", se = FALSE, color = "black") +
  facet_wrap(~ position, ncol = 2) +
  scale_color_manual(values = c(
    Goalkeeper = "red",
    Defender = "blue",
    Midfielder = "green",
    Forward = "purple"
  )) +
  theme_minimal(base_size = 10) +
  labs(
    x = "Appearances",
    y = "Goal Contribution (goals + assists)",
    color = "Position",
    title = "Goal Contribution vs Appearances by Position"
  )

ggsave(
  filename = here("Output", "figure_scatter.png"),
  plot = p,
  width = 8,
  height = 6,
  dpi = 150
)