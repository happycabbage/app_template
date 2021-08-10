box::use(
  graphics[hist],
  shiny[...],
  stats[rpois],
)

#' @export
ui <- function(id) {
  ns <- NS(id)
  plotOutput(ns("my_plot"))
}

#' @export
server <- function(id) {
  moduleServer(id, function(input, output, session) {
    output$my_plot <- renderPlot({
      hist(rpois(100, 50))
    })
  })
}
