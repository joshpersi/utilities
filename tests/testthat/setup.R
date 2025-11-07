# Remove missing data from penguins to prevent unnecessary warnings
penguins <- tidyr::drop_na(penguins)
