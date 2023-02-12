library(bakeoff)
library(tidyverse)

bakers |>
  select(baker_first, baker_last, age) |>
  mutate(baker_full = paste(baker_last, baker_first, sep = ", ")) |>
  ggplot(mapping = aes(x = age)) +
  geom_histogram(color = "black", fill = "blue")
