library(bakeoff)
library(tidyverse)

bakers |>
  select(baker_first, baker_last, age, percent_episodes_appeared) |>
  mutate(baker_full = paste(baker_last, baker_first, sep = ", ")) |>
  ggplot(mapping = aes(x = age)) +
    geom_bar(position = "dodge",
             linewidth = 10)
    

    
  # geom_histogram(binwidth = 10) +
  # scale_x_continuous(breaks = c(5, 15, 25, 35, 45, 55, 65, 75),
  #                    labels = c("0-10", "10-20", "20-30", "30-40", "40-50", "50-60", "60-70", "70-80"))

