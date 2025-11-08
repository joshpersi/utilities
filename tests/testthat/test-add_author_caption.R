test_that("author caption appears correctly", {
  temp_file <- fs::file_temp(ext = ".png")

  grDevices::png(temp_file, width = 6, height = 6, units = "in", res = 300)

  p <- ggplot2::ggplot(penguins, ggplot2::aes(bill_dep, bill_len)) +
    ggplot2::geom_point() +
    ggplot2::theme(
      plot.margin = ggplot2::margin(0.25, 0.25, 0.375, 0.25, unit = "in"),
    )

  base::print(p)

  add_author_caption(p)

  grDevices::dev.off()

  testthat::expect_snapshot_file(temp_file, "plot.png")
})
