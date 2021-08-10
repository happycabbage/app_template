box::use(
  shiny[...],
  shinydashboard[box],
)
box::use(
  modules/pages/page1/submodule,
)

#' @export
ui <- function(id) {
  ns <- NS(id)
  fluidRow(
    h3("Page 1"),
    box(
      title = "Box",
      submodule$ui(ns("submodule"))
    )
  )
}

#' @export
server <- function(id) {
  moduleServer(id, function(input, output, session) {
    submodule$server("submodule")
  })
}
