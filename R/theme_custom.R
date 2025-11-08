#' @title
#' A custom ggplot2 theme
#'
#' @description
#' A custom ggplot2 theme built to conform to my (Josh Persi's) personal default tastes.
#'
#' @return
#' A ggplot2 theme object.
#'
#' @examples
#' temp_file <- fs::file_temp(ext = ".png")
#'
#' grDevices::png(temp_file, width = 6, height = 6, units = "in", res = 300)
#'
#' p <- ggplot2::ggplot(penguins, ggplot2::aes(bill_dep, bill_len)) +
#'   ggplot2::geom_point() +
#'   theme_custom()
#'
#' base::print(p)
#'
#' grDevices::dev.off()
#'
#' @export
theme_custom <- function() {
  ggplot2::theme_light() +
    ggplot2::theme(
      plot.caption = ggplot2::element_text(hjust = 0),
      plot.caption.position = "plot",
      plot.margin = ggplot2::margin(0.25, 0.25, 0.375, 0.25, unit = "in"),
      plot.title.position = "plot"
    )
}
