library(tidyverse)
library(bakeoff)
library(plotly)

challenges <- challenges |>
  select(baker, result, signature, showstopper) |>
  pivot_wider(names_from = "baker", values_from = "")


# bakers <- bakers |>
#   select(baker_full,baker_last, baker_first) |>
#   mutate(baker_full = paste(baker_last, baker_first, sep = ", ")) 





