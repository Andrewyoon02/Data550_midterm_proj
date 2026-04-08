# Final report 
Data550_proj.html: Data550_proj.Rmd Output/table_pos.rds Output/figure_scatter.png
	Rscript Code/04_render_report.R

# Figure 
Output/figure_scatter.png: Code/03_figure.R Output/prem_clean.rds
	Rscript Code/03_figure.R

# Table
Output/table_pos.rds: Code/02_table.R Output/prem_clean.rds
	Rscript Code/02_table.R

# Cleaned data
Output/prem_clean.rds: Code/01_clean_data.R Prem_2020.csv
	Rscript Code/01_clean_data.R

.PHONY: clean install

clean:
	rm -f Output/prem_clean.rds Output/table_pos.rds Output/figure_scatter.png Data550_proj.html

install:
	Rscript -e "renv::restore(prompt = FALSE)"