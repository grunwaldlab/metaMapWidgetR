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


#' @param input A `data.frame`, `tibble`, or a path to tabular data.
#' @param width   Width of the widget (CSS units or number).
#' @param height  Height of the widget (CSS units or number).
#' @param elementId Optional element ID for the widget.
#'
#' @import htmlwidgets
#'
#' @export
meta_map_widget <- function(input, width = NULL, height = NULL, elementId = NULL) {

  # Parse input to table
  if (is.data.frame(input)) {
    table <- input
  } else if (is.character(input) && length(input) == 1) {
    if (endsWith(input, '.tsv')) {
      table <- read.csv(input, sep = '\t')
    } else if (endsWith(input, '.csv')) {
      table <- read.csv(input, sep = ',')
    } else {
      stop(call. = FALSE, 'Invalid table format. Paths to input data must end in .tsv or .csv and be in the corresponding format.')
    }
  } else {
    stop(call. = FALSE, 'Input must be a path to a file or a data.frame/tibble.')
  }

  # create widget
  createWidget(
    name = 'meta_map_widget',
    x = df_to_tsv(table),
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
