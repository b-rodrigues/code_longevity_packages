# Assessing the code longevity of R packages

This repository is part of a project whose aim is to assess code longevity of the R programming language. 
Other repositories that are part of this project are:

- The {wontrun} packages: https://github.com/b-rodrigues/wontrun
- Code longevity of {base}, {stats}, etc: https://github.com/b-rodrigues/code_longevity
- Shiny app to analyze the results: https://github.com/b-rodrigues/longevity_app

The goal is to run old code examples with the current versions of R and packages.
This Dockerfile pulls an image based on Ubuntu 22.04 that builds R version 4.2.2 from source, and sets
the CRAN repositories to: https://packagemanager.rstudio.com/cran/__linux__/jammy/2022-11-21
This way, downloaded packages are fixed.

Then, the {wontrun} package is used to pull archived packages from CRAN, and runs the examples 
contained in these archived packages on the current version (as of November 21st) of the package.
Results are then collected and saved into an RDS file. This RDS file can then be analyzed using
the above listed above. In a future release of this project, the Shiny app will also be dockerized
and started automatically after running this container.

To asses the code longevity of (several) R packages, start by forking this repository, and then clone it.
Then, edit the `Dockerfile` and change these lines:

```
# Add one line per package you want to asses
RUN Rscript '/home/wontrun.R' dplyr 6
RUN Rscript '/home/wontrun.R' purrr 6
RUN Rscript '/home/wontrun.R' tidyr 6
RUN Rscript '/home/wontrun.R' rlang 6
RUN Rscript '/home/wontrun.R' ggplot2 6
RUN Rscript '/home/wontrun.R' stringr 6

```

to the packages you want to assess, for example:

```
RUN Rscript '/home/wontrun.R' forcats 6
RUN Rscript '/home/wontrun.R' data.table 6
RUN Rscript '/home/wontrun.R' AER 6
```

The last argument is the number of cpu cores that should be used to run the examples.

Build the image with the following line (depending on how many packages you want to asses, and on how complex their examples are, this can take hours):

```
docker build -t code_longevity_packages .
```

And then run the image with (change /path/to/repository/ to the correct path on your machine):

```
docker run --rm --name code_longevity_packages_container -v /path/to/repository/code_longevity_packages/output:/home/output:rw code_longevity_packages
```

The `output/` folder will have now `.rds` files with the results that you can consult. Please contribute them back to here using a pull request.

Thanks to [Dirk Eddelbuettel](https://github.com/eddelbuettel) for the original idea and for his help with this project!
