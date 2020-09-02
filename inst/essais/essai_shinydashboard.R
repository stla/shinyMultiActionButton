library(shiny)
library(shinydashboard)
library(shinyMultiActionButton)

header <- dashboardHeader()

sidebar <- dashboardSidebar(
  # sidebarUserPanel("User Name",
  #                  subtitle = a(href = "#", icon("circle", class = "text-success"), "Online"),
  #                  # Image file should be in www/ subdir
  #                  image = "userimage.png"
  # ),
  # sidebarSearchForm(label = "Enter a number", "searchText", "searchButton"),
  sidebarMenu(
    # Setting id makes input$tabs give the tabName of currently-selected tab
    id = "tabs",
    menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
    menuItem("Widgets", icon = icon("th"), tabName = "widgets", badgeLabel = "new",
             badgeColor = "green"),
    menuItem("Charts", icon = icon("bar-chart-o"),
             menuSubItem("Sub-item 1", tabName = "subitem1"),
             menuSubItem("Sub-item 2", tabName = "subitem2")
    )
  )
)

body <- dashboardBody(
  tabItems(
    tabItem("dashboard",
            div(p("Dashboard tab content")),
            multiActionButton(
              rotate = TRUE, bg = "darkMagenta", fg = "white",
              icon = "plus", direction = "right",
              subButtons = list(
                subButton("user-plus", bg = "blue", icon = "user-plus", iconSize = "4x"),
                subButton("library", bg = "teal", icon = "library", iconSize = "4x"),
                subButton("alarm", bg = "pink", icon = "alarm", iconSize = "4x"),
                subButton("power", bg = "lime", icon = "power", iconSize = "4x"),
                subButton("lock", bg = "orange", icon = "lock", iconSize = "4x")
              )
            )
    ),
    tabItem("widgets",
            "Widgets tab content"
    ),
    tabItem("subitem1",
            "Sub-item 1 tab content"
    ),
    tabItem("subitem2",
            "Sub-item 2 tab content"
    )
  )
)

shinyApp(
  ui = dashboardPage(header, sidebar, body),
  server = function(input, output) { }
)
