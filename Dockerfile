FROM brodriguesco/wontrun:r4.2.2

RUN mkdir /home/output/

COPY wontrun.R /home/wontrun.R

RUN R -e "install.packages(c('remotes', 'janitor', 'dplyr', 'purrr'))"

RUN R -e "remotes::install_github('b-rodrigues/wontrun', ref = 'master')"

RUN Rscript '/home/wontrun.R' dplyr purrr 4

CMD R


