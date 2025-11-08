add_author_caption <- function(author = "Josh Persi") {
  caption <- grid::textGrob(
    label = bquote(bold("Graphic") * ":" ~ .(author)),
    x = grid::unit(5.75, "in"),
    y = grid::unit(0.03, "npc"),
    hjust = 1,
    vjust = 1,
    gp = grid::gpar(fontsize = 10)
  )

  grid::grid.draw(caption)
}
