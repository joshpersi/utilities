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
#' ragg::agg_png(temp_file, width = 6, height = 6, units = "in", res = 300)
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
theme_custom <- function(...) {
  ggplot2::theme_light() +
    ggplot2::theme(
      axis.title.x = ggplot2::element_text(margin = ggplot2::margin(t = 5)),
      axis.title.y = ggplot2::element_text(margin = ggplot2::margin(r = 5)),
      panel.background = ggplot2::element_rect(
        fill = utilities::nord_palette["nord5"]
      ),
      plot.background = ggplot2::element_rect(
        fill = utilities::nord_palette["nord5"],
        color = utilities::nord_palette["nord5"]
      ),
      plot.caption = ggplot2::element_text(hjust = 0),
      plot.caption.position = "plot",
      plot.margin = ggplot2::margin(0.25, 0.25, 0.375, 0.25, unit = "in"),
      plot.title = ggplot2::element_text(face = "bold", size = 24),
      plot.title.position = "plot",
      text = ggplot2::element_text(
        family = "Noto Sans",
        size = 12,
        color = utilities::nord_palette["nord1"]
      )
    )
}
