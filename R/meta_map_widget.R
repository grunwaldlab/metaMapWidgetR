#' <Add Title>
#'
#' <Add Description>
#'
#' @import htmlwidgets
#'
#' @export
meta_map_widget <- function(message, width = NULL, height = NULL, elementId = NULL) {

  # forward options using x
  x = list(
    message = message
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'meta_map_widget',
    x,
    width = width,
    height = height,
    package = 'metaMapWidgetR',
    elementId = elementId
  )
}

#' Shiny bindings for meta_map_widget
#'
#' Output and render functions for using meta_map_widget within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a meta_map_widget
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name meta_map_widget-shiny
#'
#' @export
meta_map_widgetOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'meta_map_widget', width, height, package = 'metaMapWidgetR')
}

#' @rdname meta_map_widget-shiny
#' @export
renderMeta_map_widget <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, meta_map_widgetOutput, env, quoted = TRUE)
}
