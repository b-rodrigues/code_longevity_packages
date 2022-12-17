#!/usr/bin/env Rscript
args <- commandArgs(trailingOnly = TRUE)

library(wontrun)

packages_sources <- get_archived_sources(args[1])

out <- wontrun(packages_sources ,
               ncpus = args[2],
               setup = TRUE,
               wontrun_lib = "/usr/local/lib/R/site-library/")

saveRDS(object = out,
        file = paste0("/home/intermediary_output/", args[1], ".rds"))
