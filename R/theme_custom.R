theme_custom <- function() {
  ggplot2::theme_light() +
    ggplot2::theme(
      plot.caption = ggplot2::element_text(hjust = 0),
      plot.caption.position = "plot",
      plot.margin = ggplot2::margin(0.25, 0.25, 0.375, 0.25, unit = "in"),
      plot.title.position = "plot"
    )
}
