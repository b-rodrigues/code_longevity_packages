#!/usr/bin/env Rscript
args <- commandArgs(trailingOnly=TRUE)

library(dplyr)
library(purrr)
library(wontrun)

list_args <- as.list(args)

packages <- head(list_args, -1)

cl <- tail(list_args, 1)[[1]]

print(packages)

packages_sources <- packages %>%
  map(get_archived_sources) %>%
  map(~head(., 1))


out <- packages_sources %>%
  map(~wontrun(.,
               ncpus = cl,
               setup = TRUE,
               wontrun_lib = "/usr/local/lib/R/site-library/"))


saveRDS(out, paste0("/home/output/", janitor::make_clean_names(packages), ".rds"))
