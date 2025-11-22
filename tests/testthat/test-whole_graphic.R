test_that("plot PNG snapshot matches", {
  temp_file <- fs::file_temp(ext = ".png")

  grDevices::png(temp_file, width = 6, height = 6, units = "in", res = 300)

  p <- ggplot2::ggplot(penguins, ggplot2::aes(bill_dep, bill_len)) +
    ggplot2::geom_point() +
    theme_custom()

  base::print(p)

  add_source_attribution(p, "Natural Resources Canada")

  add_author_attribution(p)

  grDevices::dev.off()

  testthat::expect_snapshot_file(temp_file, "plot.png")
})
