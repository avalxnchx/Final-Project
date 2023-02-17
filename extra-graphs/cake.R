library(bakeoff)
library(tidyverse)

cakes_sig <- challenges |>
  filter(result != "NA") |>
  
  # This gets rid of bakers after they have veen eliminated (by result because
  # there are some random missing values for other variables)
  
  mutate(cake_sig = if_else(str_detect(signature, "ake") == TRUE, "Cake", "No Cake")) |>
  replace_na(list(cake_sig = "No Cake")) |>
  
  # While it's not accurate to assume NA values have no cake, I don't want NA
  # to be graphed. I'm open to other ways to not count them, but all the methods
  # of dropping them that I know of get rid of the whole row

  ggplot(aes(x = series, fill = cake_sig)) +
  geom_bar(position = "dodge") +
  scale_x_continuous(breaks = 1:10) +
  labs(title = "Cakes Baked in Signatuer Challenges by Series",
       subtitle = "The most cakes were baked in the 10th series",
       x = "Series Number (UK)",
       y = "Count",
       caption = "Source: bakeoff",
       fill = " ") +
  theme_light()

write_rds(cakes_sig, "cakes_sig.rds")


cakes_show <- challenges |>
  filter(result != "NA") |>
  
  # This gets rid of bakers after they have been eliminated (by result because
  # there are some random missing values for other variables)
  
  mutate(cake_show = if_else(str_detect(showstopper, "ake") == TRUE, "Cake", "No Cake")) |>
  replace_na(list(cake_show = "No Cake")) |>
  
  # While it's not accurate to assume NA values have no cake, I don't want NA
  # to be graphed. I'm open to other ways to not count them, but all the methods
  # of dropping them that I know of get rid of the whole row
  
  ggplot(aes(x = series, fill = cake_show)) +
  geom_bar(position = "dodge") +
  scale_x_continuous(breaks = 1:10) +
  labs(title = "Cakes Baked in Showstopper Challenges by Series",
       subtitle = "The most cakes were baked in the 8th series",
       x = "Series Number (UK)",
       y = "Count",
       caption = "Source: bakeoff",
       fill = " ") +
  theme_light()

write_rds(cakes_show, "cakes_show.rds")


         

