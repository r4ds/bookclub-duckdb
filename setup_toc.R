# Run this interactively as needed to update toc.csv. Should rarely be necessary.

googlesheets4::read_sheet(
  "1B9WV0Iiv6XYDX49qKWuLkfiCrM0YUkfiCYB6NZH4DkY",
  range = "A2:B",
  col_names = c("number", "title"),
  col_types = "c"
) |> 
  dplyr::filter(!is.na(.data$number)) |> 
  dplyr::mutate(number_wide = stringr::str_pad(.data$number, 2, pad = "0")) |> 
  readr::write_csv("toc.csv")
