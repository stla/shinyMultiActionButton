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
#'
#' @importFrom htmltools tags
#' @export
subButton <- function(
  id, bg = NULL, fg = NULL, icon = NULL, iconSize = "3x", tooltip = NULL
){
  bg <- if(!is.null(bg)) match.arg(bg, metro4bgcolors())
  fg <- if(!is.null(fg)) match.arg(fg, metro4fgcolors())
  icon <- if(!is.null(icon)) match.arg(icon, metro4icons())
  tags$li(
    class = paste0(sprintf("bg-%s ", bg), sprintf("fg-%s", fg)),
    tags$a(
      id = id,
      href = "#",
      class = "action-button",
      tags$span(
        class = sprintf("mif-%s mif-%s", icon, iconSize),
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
  icon <- if(!is.null(icon)) match.arg(icon, metro4icons())
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
        "action-button ",
        rotate,
        sprintf("bg-%s ",bg),
        sprintf("fg-%s",fg)
      ),
      onclick = "$(this).toggleClass('active')",
      tags$span(
        class = "icon",
        tags$span(
          class = sprintf("mif-%s", icon)
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

