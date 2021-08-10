#!/usr/bin/env Rscript
box::use(
  lintr[lint, lint_dir],
)

lints <- c(
  lint("app.R"),
  lint_dir("modules"),
  lint_dir("tests"),
  lint_dir("tools")
)
print(structure(lints, class = "lints"))
quit(status = length(lints) > 0)
