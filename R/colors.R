#' Metro 4 colors
#' @description Returns the vector of available colors.
#'
#' @return The vector of available colors.
#' @export
#' @rdname metro4-colors
metro4bgcolors <- function(){
  c("transparent", "facebook", "twitter", "github", "bootstrap",
    "gitlab", "amazon", "black", "white", "dark", "light", "grayBlue",
    "grayWhite", "grayMouse", "brandColor1", "brandColor2", "lime",
    "green", "emerald", "blue", "teal", "cyan", "cobalt", "indigo",
    "violet", "pink", "magenta", "crimson", "red", "orange", "amber",
    "yellow", "brown", "olive", "steel", "mauve", "taupe", "gray",
    "lightLime", "lightGreen", "lightEmerald", "lightBlue", "lightTeal",
    "lightCyan", "lightCobalt", "lightIndigo", "lightViolet", "lightPink",
    "lightMagenta", "lightCrimson", "lightRed", "lightOrange", "lightAmber",
    "lightYellow", "lightBrown", "lightOlive", "lightSteel", "lightMauve",
    "lightTaupe", "lightGray", "lightGrayBlue", "darkLime", "darkGreen",
    "darkEmerald", "darkBlue", "darkTeal", "darkCyan", "darkCobalt",
    "darkIndigo", "darkViolet", "darkPink", "darkMagenta", "darkCrimson",
    "darkRed", "darkOrange", "darkAmber", "darkYellow", "darkBrown",
    "darkOlive", "darkSteel", "darkMauve", "darkTaupe", "darkGray",
    "darkGrayBlue")
}

#' @rdname metro4-colors
#' @export
metro4fgcolors <- function(){
  c("black", "white", "dark", "light", "grayBlue", "grayWhite",
    "grayMouse", "brandColor1", "brandColor2", "lime", "green", "emerald",
    "blue", "teal", "cyan", "cobalt", "indigo", "violet", "pink",
    "magenta", "crimson", "red", "orange", "amber", "yellow", "brown",
    "olive", "steel", "mauve", "taupe", "gray", "lightLime", "lightGreen",
    "lightEmerald", "lightBlue", "lightTeal", "lightCyan", "lightCobalt",
    "lightIndigo", "lightViolet", "lightPink", "lightMagenta", "lightCrimson",
    "lightRed", "lightOrange", "lightAmber", "lightYellow", "lightBrown",
    "lightOlive", "lightSteel", "lightMauve", "lightTaupe", "lightGray",
    "lightGrayBlue", "darkLime", "darkGreen", "darkEmerald", "darkBlue",
    "darkTeal", "darkCyan", "darkCobalt", "darkIndigo", "darkViolet",
    "darkPink", "darkMagenta", "darkCrimson", "darkRed", "darkOrange",
    "darkAmber", "darkYellow", "darkBrown", "darkOlive", "darkSteel",
    "darkMauve", "darkTaupe", "darkGray", "darkGrayBlue")
}

#' Shiny app displaying the metro 4 background colors
#' @description Launch a shiny app showing all available metro 4 background colors.
#'
#' @import shiny
#' @export
shinyMetro4bgColors <- function(){
  colorsChunks <- matrix(metro4bgcolors(), ncol = 7L)
  shinyApp(
    ui = fluidPage(
      tags$fieldset(
        tags$legend(
          h1(style = "display: inline-block;", "Metro 4 colors"),
          helpText(style = "display: inline-block;",
                   "(hover the buttons to see the color names)")
        ),
        do.call(tagList, apply(colorsChunks, 1L, function(chunk){
          div(multiActionButton(
            rotate = TRUE, bg = "black", fg = "white", icon = "plus",
            direction = "right",
            subButtons = lapply(chunk, function(color){
              subButton(color, bg = color, icon = "plus", iconSize = "3x",
                        tooltip = color)
            })
          ))
        }))
      ),
      tags$script(HTML("$('.multi-action>button').addClass('active')"))
    ),
    server = function(input, output){}
  )
}
