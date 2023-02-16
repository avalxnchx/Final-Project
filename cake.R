library(bakeoff)
library(tidyverse)

cakes_sig <- challenges |>
  filter(result != "NA") |>
  mutate(cake_sig = if_else(str_detect(signature, "ake") == TRUE, "Cake", "No Cake")) |>
  replace_na(list(cake_sig = "No Cake")) |>
  print(n = 100) |>
  ggplot(aes(x = series, fill = cake_sig)) +
  geom_bar(position = "dodge") +
  scale_x_continuous(breaks = 1:10) +
  labs(title = "Cakes Baked in Signatures by Series",
       subtitle = "The most cakes were baked in the 10th season",
       x = "Series Number (UK)",
       y = "Count",
       caption = "Source: bakeoff",
       fill = " ") +
  theme_light()
         

