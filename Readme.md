# Assessing the code longevity of R packages

To asses the code longevity of (several) R packages, start by forking this repository, and then cloning it.
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

Build the image with (depending on how many packages you want to asses, and on how complex their examples are, this can take hours):

```
docker build -t code_longevity_packages .
```

And then run the image with:

```
docker run --rm --name code_longevity_packages_container -v /path/to/repository/code_longevity_packages/output:/home/output:rw code_longevity_packages
```

The `output/` folder will have now `.rds` files with the results that you can consult. Please contribute them back to here using a pull request.
