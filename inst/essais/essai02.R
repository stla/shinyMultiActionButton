library(shiny)
library(shinyMultiActionButton)

ui <- fluidPage(

  tags$head(
    tags$style(HTML("pre {font-size: 18px; font-weight: bold;}"))
  ),

  br(),

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
  ),

  br(), br(), br(),

  tags$fieldset(
    tags$legend("Buttons states"),
    verbatimTextOutput("buttons")
  )

)


server <- function(input, output){

  output[["buttons"]] <- renderPrint({
    states <- c(
      paste0("user-plus: ", input[["user-plus"]]),
      paste0("library: ", input[["library"]]),
      paste0("alarm: ", input[["alarm"]]),
      paste0("power: ", input[["power"]]),
      paste0("lock: ", input[["lock"]])
    )
    cat(states, sep = "\n")
  })

}

shinyApp(ui, server)
