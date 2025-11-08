add_source_caption <- function(p = NULL, source, family = NULL) {
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
    label = bquote(bold("Data") * ":" ~ .(source)),
    x = grid::unit(0.25, "in"),
    y = grid::unit(0.03, "npc"),
    hjust = 0,
    vjust = 1,
    gp = grid::gpar(
      fontfamily = plot_font_family,
      fontsize = 10
    )
  )

  grid::grid.draw(caption)
}
