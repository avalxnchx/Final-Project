library(tidyverse)
library(bakeoff)
library(plotly)


challenges_new <- challenges |>
  select(series, episode, baker, result, signature, showstopper) |>
  filter(episode >= 3) |>
  mutate(chocolate_sig = str_detect(signature, "hocolat")) |>
  mutate(chocolate_show = str_detect(showstopper, "hocolat")) |>
  mutate(chocolate_sig = if_else(chocolate_sig == TRUE, 1, 0))|>
  mutate(chocolate_show = if_else(chocolate_show == TRUE, 1, 0)) |>
  replace_na(list(chocolate_sig = 0, chocolate_show = 0)) |>
  arrange(baker) |>
  group_by(baker, series) |>
  mutate(times_chocolate = sum(chocolate_show, chocolate_sig)) |>
  select(baker, times_chocolate, series) |>
  summarise(times_chocolate = max(times_chocolate))

  ch_and_ba <- left_join(challenges_new, bakers, by = c("baker", "series"))


ch_and_ba |>
  ggplot(mapping = aes(x = times_chocolate, y = total_episodes_appeared)) +
  geom_point()





