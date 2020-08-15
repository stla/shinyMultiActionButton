#' Sub-button
#' @description Creates a sub-button for usage in \code{\link{multiActionButton}}
#'
#' @param id button id
#' @param bg background color of the button
#' @param fg color of the icon
#' @param icon icon name
#' @param iconSize icon size, can be \code{"lg"}, \code{"2x"}, \code{"3x"},
#'   \code{"4x"} or \code{"5x"}
#' @param tooltip character string to show as tooltip
#' @param onclick \code{onclick} attribute
#'
#' @importFrom htmltools tags
#' @export
subButton <- function(
  id, bg = NULL, fg = NULL, icon = NULL, iconSize = "3x",
  tooltip = NULL, onclick = NULL
){
  bg <- if(!is.null(bg)) match.arg(bg, metro4bgcolors())
  fg <- if(!is.null(fg)) match.arg(fg, metro4fgcolors())
  metro4icon <- FALSE
  if(!is.null(icon)){
    if(icon %in% metro4icons()){
      icon <- sprintf("mif-%s", icon)
      iconSize <- sprintf("mif-%s", iconSize)
      metro4icon <- TRUE
    }else{
      iconSize <- character(1L)
    }
  }
  tags$li(
    class = if(metro4icon) paste0(sprintf("bg-%s ", bg), sprintf("fg-%s", fg)),
    style = if(!metro4icon) "background-color: transparent;",
    tags$a(
      id = id,
      href = "#",
      class = "action-button mui-action-button",
      onclick = onclick,
      tags$span(
        class = sprintf("%s %s", icon, iconSize),
        title = tooltip
      )
    )
  )
}


#' Multi action button
#' @description Creates a multi action button for usage in a Shiny UI.
#'
#' @param rotate logical, whether to rotate the icon upon clicking the main
#'   button
#' @param bg background color of the button
#' @param fg color of the icon
#' @param icon icon name
#' @param direction the opening direction, \code{"top"}, \code{"right"},
#'   \code{"bottom"}, or \code{"left"}
#' @param subButtons a list of buttons created with \code{\link{subButton}}
#'
#' @importFrom htmltools tags htmlDependency attachDependencies
#' @export
#'
#' @examples #XXX
multiActionButton <- function(
  rotate = TRUE, bg = NULL, fg = NULL,
  icon = NULL,
  direction = "right", subButtons
){
  rotate <- ifelse(rotate, "rotate-minus ", "")
  bg <- if(!is.null(bg)) match.arg(bg, metro4bgcolors())
  fg <- if(!is.null(fg)) match.arg(fg, metro4fgcolors())
  icon <- if(!is.null(icon)){
    if(icon %in% metro4icons()){
      sprintf("mif-%s", icon)
    }else{
      icon
    }
  }
  ultag <- function(...){
    tags$ul(
      class = sprintf("actions drop-%s", direction),
      ...
    )
  }
  tag <- tags$div(
    class = "multi-action",
    tags$button(
      class = paste0(
        "action-button  mui-action-button ",
        rotate,
        sprintf("bg-%s ",bg),
        sprintf("fg-%s",fg)
      ),
      onclick = "$(this).toggleClass('active')",
      tags$span(
        class = "icon",
        tags$span(
          class = icon
        )
      )
    ),
    do.call(ultag, subButtons)
  )
  dep <- htmltools::htmlDependency(
    name = "metroui",
    version = "4.3.10",
    src = "www/metro4-dist",
    stylesheet = paste0("css/metro-", c(
      "colors",
      "components",
      "icons"
    ), ".min.css"),
    package = "shinyMultiActionButton"
  )
  htmltools::attachDependencies(tag, dep)
}

