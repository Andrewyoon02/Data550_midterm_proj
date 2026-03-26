# Final report 
Data550_proj.html: Data550_proj.Rmd output/table_pos.rds output/figure_scatter.png
	Rscript code/04_render_report.R

# Figure 
output/figure_scatter.png: code/03_figure.R output/prem_clean.rds
	Rscript code/03_figure.R

# Table
output/table_pos.rds: code/02_table.R output/prem_clean.rds
	Rscript code/02_table.R

# Cleaned data
output/prem_clean.rds: code/01_clean_data.R Prem_2020.csv
	Rscript code/01_clean_data.R

.PHONY: clean
clean:
	rm -f output/prem_clean.rds output/table_pos.rds output/figure_scatter.png Data550_proj.html