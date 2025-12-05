testthat::test_that("plot PNG snapshot matches", {
  utilities::setup_showtext()

  temp_file <- fs::file_temp(ext = ".png")

  ragg::agg_png(temp_file, width = 6, height = 6, units = "in", res = 300)

  p <- ggplot2::ggplot(penguins, ggplot2::aes(bill_dep, bill_len)) +
    ggplot2::geom_point() +
    utilities::theme_custom()

  base::print(p)

  utilities::add_source_attribution(p, "Natural Resources Canada")

  utilities::add_author_attribution(p)

  grDevices::dev.off()

  testthat::expect_snapshot_file(temp_file, "plot.png")
})
