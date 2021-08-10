# [NAME OF THE APP]

### Dependencies
This project uses [renv](https://rstudio.github.io/renv/index.html)
to create an isolated environment
with specific versions of packages listed in the `renv.lock` file.

When you initially clone the repository,
or switch to a branch with a different lockfile,
run `renv::restore(clean = TRUE)` to sync the library.
The `clean = TRUE` argument should be used at all times
to ensure that only the packages listed in the lockfile are installed,
which is necessary for proper testing.

To add/remove packages, edit the `DESCRIPTION` file and run `tools/renv-sync.R`.
This will also update all packages.
If you want to install/update only specified packages you can list them as arguments to the script.

### Running
To run the app locally,
launch R in the project root and use `shiny::runApp()`.

### Deployment
To deploy to RStudio Connect, use the RStudio GUI.
Deploy all files except `.Rprofile` and `.Renviron`.

### Development
The following scripts are available:
* `./tools/lint.R`: lint the code.
* `./tests/testthat.R`: run the unit tests.
