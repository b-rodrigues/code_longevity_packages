FROM brodriguesco/wontrun:r4.2.2

RUN mkdir /home/intermediary_output/
RUN mkdir /home/output/

COPY wontrun.R /home/wontrun.R

# Add one line per package you want to asses
RUN Rscript '/home/wontrun.R' dplyr 6
RUN Rscript '/home/wontrun.R' purrr 6
RUN Rscript '/home/wontrun.R' tidyr 6
RUN Rscript '/home/wontrun.R' rlang 6
RUN Rscript '/home/wontrun.R' lubridate 6
RUN Rscript '/home/wontrun.R' haven 6
RUN Rscript '/home/wontrun.R' forcats 6
RUN Rscript '/home/wontrun.R' stringr 6
RUN Rscript '/home/wontrun.R' tibble 6

CMD mv /home/intermediary_output/* /home/output/
