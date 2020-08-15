library(shiny)
library(shinyMultiActionButton)

ui <- fluidPage(

  tags$head(
    tags$style(HTML("pre {font-size: 18px; font-weight: bold;}"))
  ),
  #    tags$head(
  # #     HTML('
  # #     <link rel="stylesheet" href="https://cdn.metroui.org.ua/v4/css/metro.min.css">
  # # <link rel="stylesheet" href="https://cdn.metroui.org.ua/v4/css/metro-colors.min.css">
  # # <link rel="stylesheet" href="https://cdn.metroui.org.ua/v4/css/metro-rtl.min.css">
  # # <link rel="stylesheet" href="https://cdn.metroui.org.ua/v4/css/metro-icons.min.css">
  # #     ')
  # #     #tags$link(rel = "stylesheet", href="https://cdn.metroui.org.ua/v4.3.2/css/metro-all.min.css")
  #          tags$script(src = "https://cdn.metroui.org.ua/v4/js/metro.min.js")
  #    ),

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
  ),


  HTML('
    <div class="multi-action">
      <button class="action-button rotate-minus bg-red fg-white"
              onclick="$(this).toggleClass(\'active\')"
              id = "btn">
          <span class="icon"><span class="mif-plus"></span></span>
      </button>
      <ul class="actions drop-right">
          <li class="bg-blue"><a href="#"><span class="mif-user-plus"></span></a></li>
          <li class="bg-teal"><a href="#" class="action-button"><span class="mif-library"></span></a></li>
          <li class="bg-pink"><a href="#" class="action-button"><span class="mif-alarm"></span></a></li>
          <li class="bg-orange multi-action action-button">
                  <span class="icon"><span class="mif-plus"></span></span>
                <ul class="actions drop-bottom">
                  <li class="bg-blue"><a href="#"><span class="mif-user-plus"></span></a></li>
                  <li class="bg-blue"><a href="#"><span class="mif-power"></span></a></li>
                </ul>
          </li>
      </ul>
  </div>
    ')

)


server <- function(input, output){
  output[["buttons"]] <- renderPrint({
    ids <- c("user-plus", "library", "alarm", "power", "lock")
    cat(
      paste0(
        ids,
        ": ",
        sapply(ids, function(id) input[[id]])
      ),
      sep = "\n"
    )
  })
}

shinyApp(ui, server)
