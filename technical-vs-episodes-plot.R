library(bakeoff)
library(tidyverse)
library(plotly)

technical_vs_episodes <- bakers |>
  select(series_winner, technical_median, total_episodes_appeared, baker_first, baker_last, series) |>
  mutate(baker_full = paste(baker_last, baker_first, sep = ", ")) |> 
  mutate(season_winner = ifelse(series_winner == 1, "Winner", "Loser")) |>
  ggplot(mapping = aes(x = technical_median, 
                       y = total_episodes_appeared, 
                       color = season_winner,
                       text = paste("Name:", baker_full, "\n",
                                    "UK Series #:", series))) +
  geom_jitter(width = 0.2, height = 0.2, size = 2) +
  scale_x_continuous(breaks = c(1:13)) +
  scale_y_continuous(breaks = c(1:10)) +
  labs(title = "Average Technical Ranking vs. Total Episodes",
       subtitle = "Bakers with higher average technical scores tended to make it farther in the competition",
       x = "Average Technical Ranking (1 being best)",
       y = "Total Episodes Appeared",
       color = "Final Standing")

technical_vs_episodes <- ggplotly(technical_vs_episodes, tooltip = "text")

write_rds(technical_vs_episodes, "technical_vs_episodes.rds")
