library(shiny)
library(shinyMultiActionButton)

iconsChunks <- matrix(metro4icons(), ncol = 7L)

ui <- fluidPage(

  tags$fieldset(
    tags$legend(
      h1(style = "display: inline-block;", "Metro 4 icons"),
      helpText(style = "display: inline-block;",
               "(hover the icons to see their name)")
    ),
    do.call(tagList, apply(iconsChunks, 1L, function(chunk){
      div(multiActionButton(
        rotate = TRUE, bg = "teal", fg = "white", icon = "plus", direction = "right",
        subButtons = lapply(chunk, function(icon){
          subButton(icon, bg = "red", icon = icon, iconSize = "5x", tooltip = icon)
        })
      ))
    }))
  ),

  tags$script(HTML("$('.multi-action>button').addClass('active')"))

)


server <- function(input, output){

}

shinyApp(ui, server)
