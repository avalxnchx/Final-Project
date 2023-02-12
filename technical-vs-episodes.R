library(bakeoff)
library(tidyverse)
library(plotly)

technical_vs_episodes <- bakers |>
  select(series_winner, technical_median, total_episodes_appeared, baker_first, baker_last, series) |>
  mutate(baker_full = paste(baker_last, baker_first, sep = ", ")) |> 
  
  
  # I created a more official format for the baker names: <last, first> because the full name
  # variable that was included had nicknames. At first I kept trying to combine the columns
  # with bind_rows(), but that's for when the values in the columns are the same 
  
  mutate(season_winner = ifelse(series_winner == 1, "Winner", "Loser")) |>
  
  # naming the values 1 and 0 for clarity when it is applied to the legend. Originally they were named
  # "True" and "False", but that's just one more step for someone reading it to figure out what the true
  # and false mean.
  
  ggplot(mapping = aes(x = technical_median, 
                       y = total_episodes_appeared, 
                       color = season_winner,
                       text = paste("Name:", baker_full, "\n",
                                    "UK Series #:", series))) +
  
  # setting up interactive element. it will show name and series
  
  geom_jitter(width = 0.2, height = 0.2, size = 2, na.rm = TRUE) +
  scale_x_continuous(breaks = c(1:13)) +
  scale_y_continuous(breaks = c(1:10)) +
  labs(title = "Average Technical Ranking vs. Total Episodes",
       
       # subtitles don't show up when you make the graph interactive with plotly! I'll include
       # the conclusion in plain text... I just realized I misread median as mean... I'm going to cry brb
      
       
       x = "Average Technical Ranking (1 being best)",
       y = "Total Episodes Appeared",
       color = "Final Standing")

technical_vs_episodes <- ggplotly(technical_vs_episodes, tooltip = "text")

write_rds(technical_vs_episodes, "technical_vs_episodes.rds")


