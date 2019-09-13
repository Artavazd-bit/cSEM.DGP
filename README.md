
<!-- README.md is generated from README.Rmd. Please edit that file -->

# cSEM.DGP: Generate data for structural equation models

[![CRAN
status](https://www.r-pkg.org/badges/version/cSEM.DGP)](https://cran.r-project.org/package=cSEM.DGP)
[![Build
Status](https://travis-ci.com/M-E-Rademaker/cSEM.DGP.svg?branch=master)](https://travis-ci.com/M-E-Rademaker/cSEM.DGP)

Please report bugs to [the package
developers](mailto:manuel.rademaker@uni-wuerzburg.de;f.schuberth@utwente.nl).

## Installation:

``` r
# install.packages("devtools")
devtools::install_github("M-E-Rademaker/cSEM.DGP")
```

Note: requires a development version of
[cSEM](https://github.com/M-E-Rademaker/cSEM) that includes commits done
before 12.09.2019.

If you have an older version. Run:

``` r
# install.packages("devtools")
devtools::install_github("M-E-Rademaker/cSEM")
```

## Purpose

Generate data for structural equation models including up to 8
constructs. Generation is based parameter values given in [lavaan model
syntax](http://lavaan.ugent.be/tutorial/syntax1.html)

In addition to supplying numeric values, variable values for parameters
are allowed. To achieve this, the package makes use of
[lavaan](http://lavaan.ugent.be/)’s labeling capabilities. Users may
replace a given parameter in, i.e. the structural model by a symbolic
name and assign a vector of values to that name. These values will be
used to generate data for all possible combinations of these values with
the remaining fixed parameters.

## Examples

### Without variable paramters

Simply write your model as usual in lavaan model syntax. Add a fixed
numeric value for each parameter. Note, currently you must either set
all paramters, or none. The type of output can be choosen. Either a
data.frame (`return_type = "data.frame"`, the default), a numeric matrix
(`return.type = "matrix"`), or a correlation matrix (`return.type =
"cor"`).

``` r
model <- "
# Structural model
eta2 ~ 0.6*eta1
eta3 ~ 0.4*eta1 + 0.35*eta2

# Measurement model
eta1 =~ 0.8*y11 + 0.9*y12 + 0.8*y13
eta2 =~ 0.7*y21 + 0.7*y22 + 0.9*y23
eta3 =~ 0.9*y31 + 0.8*y32 + 0.7*y33
"

dat <- generateData(model, .return_type = "cor")
dat
```

### Including variable paramters

To include variable paramters:

1.  Replace a numeric value by a character string of your choice
2.  Supply a vector of values to `generateData()`

Now, data for all possible combinations of these values with the
remaining fixed parameters will be generated

``` r
# We want to vary the path coefficient between eta2 and eta1 and 
# the first loading of eta1.
model <- "
# Structural model
eta2 ~ gamma*eta1
eta3 ~ 0.4*eta1 + 0.35*eta2

# Measurement model
eta1 =~ lambda*y11 + 0.9*y12 + 0.8*y13
eta2 =~ 0.7*y21 + 0.7*y22 + 0.9*y23
eta3 =~ 0.9*y31 + 0.8*y32 + 0.7*y33
"

dat <- generateData(model, .return_type = "cor", 
                      lambda = c(0.8, 0.9),
                      gamma = c(0.2, 0.3))
str(dat)
```
