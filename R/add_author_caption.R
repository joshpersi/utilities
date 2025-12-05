#' @title
#' Add author caption to graphic
#'
#' @description
#' Add the name of the author to the bottom right corner of a ggplot graphic.
#'
#' @param p A ggplot object.
#' @param author A character string specifying the author's name. Default is "Josh Persi".
#' @param family A character string specifying the font family for the caption text. If NULL, uses the font family from the plot theme.
#'
#' @return
#' NULL. The function draws the caption on the current graphics device.
#'
#' @examples
#' temp_file <- fs::file_temp(ext = ".png")
#'
#' ragg::agg_png(temp_file, width = 6, height = 6, units = "in", res = 300)
#'
#' p <- ggplot2::ggplot(penguins, ggplot2::aes(bill_dep, bill_len)) +
#'   ggplot2::geom_point() +
#'   ggplot2::theme(
#'     plot.margin = ggplot2::margin(0.25, 0.25, 0.375, 0.25, unit = "in")
#' )
#'
#' base::print(p)
#'
#' add_author_attribution(p)
#'
#' grDevices::dev.off()
#'
#' @export
add_author_attribution <- function(
  p = NULL,
  author = "Josh Persi",
  family = NULL
) {
  if (!ggplot2::is_ggplot(p)) {
    rlang::abort("`p` must be a ggplot object.")
  }

  # If the family is not provided, use the font family from the plot theme
  if (rlang::is_null(family)) {
    plot_font_family <- base::ifelse(
      base::any(
        p$theme$text$family == "",
        rlang::is_null(p$theme$text$family)
      ),
      "sans",
      p$theme$text$family
    )
  } else {
    plot_font_family <- family
  }

  offset <- grDevices::dev.size()[1] - 0.25

  caption <- grid::textGrob(
    label = bquote(bold("Graphic") * ":" ~ .(author)),
    x = grid::unit(offset, "in"),
    y = grid::unit(0.15, "in"),
    hjust = 1,
    vjust = 1,
    gp = grid::gpar(
      fontfamily = plot_font_family,
      fontsize = 10
    )
  )

  grid::grid.draw(caption)

  base::invisible()
}
