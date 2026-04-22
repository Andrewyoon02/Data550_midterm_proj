# Premier League 2020 Player Performance: Exploratory Analysis
This project analyzes player statistics from the 2019/2020 Premier League season,
exploring performance metrics (goals, assists, appearances, etc.) across player positions.

## Data
The raw dataset (`Prem_2020.csv`) is included in the repository. It 
contains 571 players from the 2019/2020 Premier League season with 59 variables 
covering demographics, club information, and performance metrics.

## Code Description
`Code/01_clean_data.R`

- Cleans the raw data
- Checks for missing values
- Creates a new variable called `goal_contribution` (`goals + assists`)
- Saves the cleaned dataset as an `.rds` file in the `Output/` folder

`Code/02_table.R`

- Uses the cleaned dataset from `Code/01_clean_data.R`
- Creates a summary table of average appearances, goals, assists, and goal contribution by position
- Saves the table as an `.rds` file in the `Output/` folder

`Code/03_figure.R`

- Uses the cleaned dataset from `Code/01_clean_data.R`
- Creates scatterplots showing appearances versus goal contribution by position
- Saves the figure as a `.png` file in the `Output/` folder

`Code/04_render_report.R`

- Renders `Data550_proj.Rmd` as an HTML report

`Data550_proj.Rmd`

- Loads the cleaned data first from the `Code/01_clean_data.R` file to then create 
the table and the figure from the 2 `.R` scripts. 
- Includes introduction of the data, objectives of the analysis, and descriptions
of the table and figure.

`Makefile`

- Has a set of "rules" and designated commands to run the full repository without 
having to separately run each file. 

## Package environment setup

This project uses `renv` to manage package versions.

To restore the project package environment, run:

`make install`

in the terminal.

## Docker image

### Build the Docker image locally
To build the Docker image locally, run:

```bash
docker build -t andrewyoon02/data550-project .
```

### DockerHub image

Public DockerHub repository:

`andrewyoon02/data550-project`

## Create the Final Report with Docker

This project includes a Makefile target that runs the full analysis inside a Docker container and writes the compiled report to a local folder called `report/`.

Run:

```bash
make docker-report
```

## Generating the Final Report

Make sure you have R and the required packages installed (`tidyverse`, `janitor`,
`here`, `knitr`, `rmarkdown`, `gtsummary`). Then, from the terminal, run `make`. 

This will run all data cleaning and analysis scripts in order and render
`Data550_proj.html` as the final report.


