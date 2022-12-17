# Assessing the code longevity of R packages

To asses the code longevity of (several) R packages, edit the `Dockerfile` and change this
line:

```
RUN Rscript '/home/wontrun.R' dplyr 4
```

to this:


```
RUN Rscript '/home/wontrun.R' dplyr purrr tidyr 4
```

The last argument is number of cpu cores that should be used to run the examples.

Build the image with:

```
docker build -t code_longevity_packages .
```

And then run the image with:
