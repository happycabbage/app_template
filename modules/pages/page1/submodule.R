box::use(
  shiny[...],
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
      hist(mtcars$mpg)
    })
  })
}
