
## Setup

Packages.

``` r
library(targets)
```

``` r
tar_make()
#> ✓ skip target raw_data_file
#> ✓ skip target target_data
#> ✓ skip target target_hist
#> ✓ skip target target_fit
#> ✓ skip pipeline
```

## Data

``` r
tar_read(target_data)
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
str(tar_read(target_fit))
#> List of 8
#>  $ call    : language biglm(Ozone ~ Wind + Temp, data)
#>  $ qr      :List of 6
#>   ..$ D      : num [1:3] 153 1887 10761
#>   ..$ rbar   : num [1:3] 9.96 77.88 -1.23
#>   ..$ thetab : num [1:3] 42.13 -4.32 1.4
#>   ..$ ss     : num 68702
#>   ..$ checked: logi FALSE
#>   ..$ tol    : num [1:3] 0 0 0
#>   ..- attr(*, "class")= chr "bigqr"
#>  $ assign  : int [1:3] 0 1 2
#>  $ terms   :Classes 'terms', 'formula'  language Ozone ~ Wind + Temp
#>   .. ..- attr(*, "variables")= language list(Ozone, Wind, Temp)
#>   .. ..- attr(*, "factors")= int [1:3, 1:2] 0 1 0 0 0 1
#>   .. .. ..- attr(*, "dimnames")=List of 2
#>   .. .. .. ..$ : chr [1:3] "Ozone" "Wind" "Temp"
#>   .. .. .. ..$ : chr [1:2] "Wind" "Temp"
#>   .. ..- attr(*, "term.labels")= chr [1:2] "Wind" "Temp"
#>   .. ..- attr(*, "order")= int [1:2] 1 1
#>   .. ..- attr(*, "intercept")= int 1
#>   .. ..- attr(*, "response")= int 1
#>   .. ..- attr(*, ".Environment")=<environment: 0x55b76e547468> 
#>  $ n       : int 153
#>  $ names   : chr [1:3] "(Intercept)" "Wind" "Temp"
#>  $ weights : NULL
#>  $ df.resid: int 150
#>  - attr(*, "class")= chr "biglm"
```

## Plot

``` r
tar_read(target_hist)
#> `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.
```

![](report-with-targets_files/figure-gfm/unnamed-chunk-5-1.png)<!-- -->
