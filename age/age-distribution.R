library(bakeoff)
library(tidyverse)

bakers |>
  select(baker_first, baker_last, age, percent_episodes_appeared) |>
  mutate(baker_full = paste(baker_last, baker_first, sep = ", ")) |>
  as.character(x = percent_episodes_appeared) |>
  ggplot(mapping = aes(x = age, color = percent_episodes_appeared, fill = percent_episodes_appeared)) +
  geom_density(alpha = 0.1)

