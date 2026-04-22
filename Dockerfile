FROM rocker/tidyverse:4.3.3

WORKDIR /project

RUN apt-get update && apt-get install -y \
    pandoc \
    && rm -rf /var/lib/apt/lists/*

COPY renv.lock renv.lock
COPY .Rprofile .Rprofile
COPY renv/activate.R renv/activate.R
COPY renv/settings.json renv/settings.json

RUN mkdir -p renv

RUN Rscript -e "install.packages('renv', repos='https://cloud.r-project.org')"
RUN Rscript -e "renv::restore(prompt = FALSE)"

COPY Code/ Code/
COPY Data550_proj.Rmd Data550_proj.Rmd
COPY Prem_2020.csv Prem_2020.csv
COPY Makefile Makefile

RUN mkdir -p Output report

CMD ["make"]