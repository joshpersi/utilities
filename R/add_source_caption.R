add_source_caption <- function(source) {
  caption <- grid::textGrob(
    label = bquote(bold("Data") * ":" ~ .(source)),
    x = grid::unit(0.25, "in"),
    y = grid::unit(0.03, "npc"),
    hjust = 0,
    vjust = 1,
    gp = grid::gpar(fontsize = 10)
  )

  grid::grid.draw(caption)
}
