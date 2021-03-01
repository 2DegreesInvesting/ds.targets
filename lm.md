> The bulk of the computation should have already happened upstream, and
> the most of the code chunks in the report itself should be terse calls
> to tar\_read() and tar\_load().

–<https://books.ropensci.org/targets/files.html#literate-programming>

### Setup

    library(targets)

### Introduction

This report summarizes our results, mostly as terse calls to
`tar_read()`. For implementation details, see the underlying targets
pipeline:

    writeLines(readLines("_targets.R"))
    #> library(targets)
    #> library(tarchetypes)
    #> 
    #> options(TZ="Germany/Berlin")
    #> tar_option_set(imports = "ds.targets", packages = c("ds.targets"))
    #> 
    #> list(
    #>   # External
    #>   tar_target(path, raw_path(), format = "file"),
    #> 
    #>   # Internal: _targets/objects/
    #>   tar_target(raw, command = read(path)),
    #>   tar_target(data, clean(raw)),
    #>   tar_target(model, linear_model(data)),
    #> 
    #>   # External
    #>   tarchetypes::tar_render(lm, "lm.Rmd", output_format = "md_document"),
    #>   tarchetypes::tar_render(plot, "plot.Rmd", output_format = "md_document")
    #> )

### Methods

To make this project easy to reproduce and share we built the R package
[ds.targets](https://github.com/2DegreesInvesting/ds-targets). You can
install it from GitHub with:

    # install.packages("devtools")
    devtools::install_github("2DegreesInvesting/ds.targets")

To clean the raw data we removed observations where `Ozone` values were
missing.

    # Source code
    ds.targets::clean
    #> function(raw) {
    #>   dplyr::mutate(
    #>     raw,
    #>     Ozone = tidyr::replace_na(.data$Ozone, mean(.data$Ozone, na.rm = TRUE))
    #>   )
    #> }
    #> <bytecode: 0x54b06e0>
    #> <environment: namespace:ds.targets>

    # Before
    raw_data <- tar_read(raw)
    any(is.na(raw_data$Ozone))
    #> [1] TRUE

    # After
    clean_data <- tar_read(data)
    any(is.na(clean_data$Ozone))
    #> [1] FALSE

To explored changes in `Ozone` through time we use a linear model.

    linear_model <- tar_read(model)

### Results

Here are our results:

    summary(linear_model)
    #> 
    #> Call:
    #> stats::lm(formula = Ozone ~ Day, data = data)
    #> 
    #> Residuals:
    #>     Min      1Q  Median      3Q     Max 
    #> -40.938 -21.269  -0.434   3.878 126.209 
    #> 
    #> Coefficients:
    #>             Estimate Std. Error t value Pr(>|t|)    
    #> (Intercept) 42.71020    4.76908   8.956 1.17e-15 ***
    #> Day         -0.03676    0.26340  -0.140    0.889    
    #> ---
    #> Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    #> 
    #> Residual standard error: 28.79 on 151 degrees of freedom
    #> Multiple R-squared:  0.0001289,  Adjusted R-squared:  -0.006493 
    #> F-statistic: 0.01947 on 1 and 151 DF,  p-value: 0.8892

### Conclusion

We see no evidence that Ozone changes through time.
