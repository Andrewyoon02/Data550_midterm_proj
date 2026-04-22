library(rmarkdown)
library(here)

here::i_am("Code/04_render_report.R")

render(
  input = here::here("Data550_proj.Rmd"),
  knit_root_dir = here::here()
)