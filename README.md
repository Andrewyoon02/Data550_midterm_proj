# Premier League 2020 Player Performance: Exploratory Analysis
This project analyzes player statistics from the 2019/2020 Premier League season,
exploring performance metrics (goals, assists, appearances, etc.) across player positions.

## Data
The raw dataset (`Prem_2020.csv`) is included in the `Data550_Project` folder. It 
contains 571 players from the 2019/2020 Premier League season with 59 variables 
covering demographics, club information, and performance metrics.

## Code Description
`code/01_clean_data.R`

- cleans the raw data, checking for missing values and incorrect entries.
- creates a new variable called goal_contribution (goals + assists)
- saves cleaned dataset as a `.rds` object in `output/` folder

`code/02_table.R`

- uses the cleaned data set saved in `code/01_clean_data.R` to create a table
- table summarizes player performance grouped by position, looking at average appearances, 
  goals, assists, and goal contribution. 
- saves the table as a `.rds` object in `output/` folder

`code/03_figure.R`

- uses the cleaned data set saved in `code/01_clean_data.R` to create a table
- creates four scatterplots displaying relationship between number appearances and 
goal contribution (goals + assists) by position. 
- saves the scatterplots into one file as a `.png` object in `output/` folder

`code/04_render_report.R`

- renders `Data550_proj.Rmd` as an HTML file. 

`Data550_proj.Rmd`

- loads the cleaned data first from the `code/01_clean_data.R` file to then create 
the table and the figure from the 2 `.R` scripts. 
- includes introduction of the data, objectives of the analysis, and descriptions
of the table and figure.

`Makefile`

- has a set of "rules" and designated commands to run the full repository without 
having to separately run each file. 

## Generating the Final Report

Make sure you have R and the required packages installed (`tidyverse`, `janitor`,
`here`, `knitr`, `rmarkdown`, `gtsummary`). Then, from the terminal, run `make`. 

This will run all data cleaning and analysis scripts in order and render
`Data550_proj.html` as the final report.
