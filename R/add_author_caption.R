add_author_caption <- function(p = NULL, author = "Josh Persi", family = NULL) {
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

  caption <- grid::textGrob(
    label = bquote(bold("Graphic") * ":" ~ .(author)),
    x = grid::unit(5.75, "in"),
    y = grid::unit(0.03, "npc"),
    hjust = 1,
    vjust = 1,
    gp = grid::gpar(
      fontfamily = plot_font_family,
      fontsize = 10
    )
  )

  grid::grid.draw(caption)
}
