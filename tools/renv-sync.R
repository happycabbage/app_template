#!/usr/bin/env Rscript

# Generate `dependencies.R` based on `DESCRIPTION`.
write_dependencies <- function() {
  imports <- read.dcf("DESCRIPTION")[[1, "Imports"]]
  imports <- strsplit(imports, "\\s*,\\s*")[[1]]
  imports <- sub("(.*)", "library(\\1)", imports)
  lines <- c(
    "# DO NOT EDIT. Generated from DESCRIPTION by tools/renv-sync.",
    "# Necessary for packrat to properly pick up dependencies.",
    imports
  )
  writeLines(lines, "dependencies.R")
}

update_lockfile <- function() {
  # On startup, renv will automatically connect to the repositories listed in the lockfile
  # to check their status. This might incur a long delay if the repositories are not available.
  # To avoid this, we ensure that repositories are not saved to the lockfile during a snapshot.
  repos <- getOption("repos")
  options(repos = NULL)
  renv::snapshot(prompt = FALSE)
  options(repos = repos)
}

renv_sync <- function(packages) {
  write_dependencies()
  # If length(packages) == 0, renv will install and/or update all packages listed in DESCRIPTION.
  renv::install(packages, prompt = FALSE)
  update_lockfile()
  # With `clean = TRUE` we can now uninstall the packages which are no longer used.
  # Suppress output, as it is not useful.
  capture.output(renv::restore(clean = TRUE, prompt = FALSE), file = nullfile())
}

renv_sync(packages = commandArgs(trailingOnly = TRUE))
