#' <Add Title>
#'
#' <Add Description>
#'
#' @param df dataframe
#' @export
df_to_tsv <- function(df) {
  paste(
    paste(colnames(df), collapse = "\t"),
    apply(df, 1, function(row) paste(row, collapse = "\t")),
    sep = "\n",
    collapse = "\n"
  )
}
#' @param width   Width of the widget (CSS units or number).
#' @param height  Height of the widget (CSS units or number).
#' @param elementId Optional element ID for the widget.
#'
#' @import htmlwidgets
#'
#' @export

meta_map_widget <- function(width = NULL, height = NULL, elementId = NULL) {

  # forward options using x

  df <- data.frame(
    latitude = runif(20, min = 34.0, max = 45.0),
    longitude = runif(20, min = -120.0, max = -75.0),
    name = paste("Sample", 1:20),
    color_by = c(rep('type;proportion_infected;comically_small_test_column', 10), rep('type', 10)),
    type = sample(c("Nursery", "Forest", "Urban", "Farm"), 20, replace = TRUE),
    proportion_infected = runif(20),
    comically_small_test_column = sample(c(0.000001898, 0.0000000023678876, 0.0024), 20, replace = TRUE)
  )

  # create widget
  createWidget(
    name = 'meta_map_widget',
    x = df_to_tsv(df),
    width = width,
    height = height,
    package = 'metaMapWidgetR',
    elementId = 'map'
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
