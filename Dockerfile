FROM brodriguesco/wontrun:r4.2.2

# This gets the shiny app
RUN git clone https://github.com/b-rodrigues/longevity_app.git

# These are needed for the Shiny app
RUN R -e "install.packages(c('dplyr', 'forcats', 'ggplot2', 'shiny', 'shinyWidgets', 'DT'))"

RUN mkdir /home/intermediary_output/
RUN mkdir /home/output/

COPY wontrun.R /home/wontrun.R

# Add one line per package you want to asses
RUN Rscript '/home/wontrun.R' readr 6
RUN Rscript '/home/wontrun.R' httr 6
RUN Rscript '/home/wontrun.R' readxl 6
RUN Rscript '/home/wontrun.R' googlesheets4 6
RUN Rscript '/home/wontrun.R' googledrive 6
RUN Rscript '/home/wontrun.R' rvest 6
RUN Rscript '/home/wontrun.R' jsonlite 6
RUN Rscript '/home/wontrun.R' xml2 6
RUN Rscript '/home/wontrun.R' hms 6
RUN Rscript '/home/wontrun.R' blob 6
RUN Rscript '/home/wontrun.R' dbplyr 6
RUN Rscript '/home/wontrun.R' dtplyr 6
RUN Rscript '/home/wontrun.R' magrittr 6
RUN Rscript '/home/wontrun.R' glue 6

CMD mv /home/intermediary_output/* /home/output/ && R -e 'shiny::runApp("/longevity_app", port = 1506, host = "0.0.0.0")'

