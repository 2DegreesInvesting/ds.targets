
<!-- README.md is generated from README.Rmd. Please edit that file -->

A series of meetups about data pipelines with the package
“[targets](https://docs.ropensci.org/targets/)”.

## Syllabus

### Motivation

[Meet Will
Landau](https://github.com/2DegreesInvesting/ds-incubator/issues/70).

### Walkthrough

Setup a minimal targets project from scratch.

Objectives:

-   Setup a file “\_targets.R” and explore its
    [structure](https://books.ropensci.org/targets/walkthrough.html#file-structure).

-   Try common functions:

    -   `tar_script()`.
    -   `tar_edit()`.
    -   `tar_glimpse()`.
    -   `tar_make()`.
    -   `tar_visnetwork()`.
    -   `tar_objects()`.
    -   `tar_read()`.

-   Create a report using targets.

-   Understand the benefit.

### Functions

This meetup adapts the examples shown in the “Functions” chapter of
targets [manual](https://books.ropensci.org/targets/). It covers how to
refactor a data science project, moving from a workflow based on a
sequence of scripts to a workflow based on a pipeline of functions.

Objectives:

-   Explore an analysis structured as a sequence of scripts.
-   Make and use our own targets.
-   Report multiple analyses with the same superset of targets.
-   Transform code chunks into functions.
-   Report the analysis as using targets.
-   Make and use targets from the package targets.

### Target cues

Declare the rules that mark a target as outdated.

-   Understand the
    [details](https://docs.ropensci.org/targets/reference/tar_cue.html#details)
    of
    [`tar_cue()`](https://docs.ropensci.org/targets/reference/tar_cue.html):
    -   *There is no metadata record of the target.*
    -   *The target errored last run.*
    -   The target has a different class than it did before.
    -   The cue mode equals “always”.
    -   The cue mode does not equal “never”.
    -   The command metadata field (the hash of the R command) is
        different from last time.
    -   The depend metadata field (the hash of the immediate upstream
        dependency targets and global objects) is different from last
        time.
    -   The storage format is different from last time.
    -   The iteration mode is different from last time.
    -   A target’s file (either the one in \_targets/objects/ or a
        dynamic file) does not exist or changed since last time.

``` r
tar_cue(
  mode = c("thorough", "always", "never"),
  command = TRUE,
  depend = TRUE,
  format = TRUE,
  iteration = TRUE,
  file = TRUE
)
```

### Next

The rest of the series will likely cover these topics:

-   Best practices.
-   [Target
    factories](https://wlandau.github.io/targetopia/contributing.html#target-factories).
-   Debugging.

We’ll follow [targets’ manual](https://books.ropensci.org/targets/) but
loosely.
