
## Setup

Packages.

``` r
library(tidyverse)
#> ── Attaching packages ─────────────────────────────────────── tidyverse 1.3.0 ──
#> ✓ ggplot2 3.3.3     ✓ purrr   0.3.4
#> ✓ tibble  3.0.6     ✓ dplyr   1.0.4
#> ✓ tidyr   1.1.2     ✓ stringr 1.4.0
#> ✓ readr   1.4.0     ✓ forcats 0.5.0
#> ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
#> x dplyr::filter() masks stats::filter()
#> x dplyr::lag()    masks stats::lag()
library(biglm)
#> Loading required package: DBI
library(here)
#> here() starts at /home/mauro/git/ds-targets
```

Functions.

``` r
source(here("R", "functions.R"))
```

Create objects.

``` r
source_all("R")
```

## Data

``` r
dataset
#> # A tibble: 153 x 6
#>    Ozone Solar.R  Wind  Temp Month   Day
#>    <dbl>   <dbl> <dbl> <dbl> <dbl> <dbl>
#>  1  41       190   7.4    67     5     1
#>  2  36       118   8      72     5     2
#>  3  12       149  12.6    74     5     3
#>  4  18       313  11.5    62     5     4
#>  5  42.1      NA  14.3    56     5     5
#>  6  28        NA  14.9    66     5     6
#>  7  23       299   8.6    65     5     7
#>  8  19        99  13.8    59     5     8
#>  9   8        19  20.1    61     5     9
#> 10  42.1     194   8.6    69     5    10
#> # … with 143 more rows
```

## Model

``` r
fit
#> Large data regression model: biglm(Ozone ~ Wind + Temp, dataset)
#> Sample size =  153
```

## Plot

``` r
hist
#> `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.
```

![](report-without-targets_files/figure-gfm/unnamed-chunk-6-1.png)<!-- -->
