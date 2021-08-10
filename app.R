# Allow absolute module imports (relative to the project root).
options(box.path = getwd())

box::use(
  sass[...],
  shiny[...],
  shinyCabbage[...],
  shinydashboard[...],
)
# file named `__init__.R` can be loaded by poining to it's directory
box::use(
  modules/pages/page1,
)

# Global settings / data (identical for all user sessions)
css <- sass(list(clr, sass_file("styles/main.scss")))

ui <- dashboardPage(
  dashboardHeader(title = "[NAME OF THE APP]"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Tab 1", tabName = "tab1")
    )
  ),
  dashboardBody(
    tags$head(
      tags$style(css),
      tags$script(src = "handlers.js")
    ),
    tabItems(
      tabItem(tabName = "tab1", page1$ui("my-module"))
    )
  )
)
ui <- shinyCabbagePage(ui)

server <- function(input, output) {
  page1$server("my-module")
}

shinyApp(ui = ui, server = server)
