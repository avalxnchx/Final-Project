library(bakeoff)
library(tidyverse)
library(plotly)

age_vs_episodes <- bakers |>
  select(age, series_winner, total_episodes_appeared, baker_first, baker_last, series) |>
  mutate(baker_full = paste(baker_last, baker_first, sep = ", ")) |> 
  
  # I created my own full name column with the format <last, first> because the full name column
  # that was included had nicknames I didn't want, and so it would be easier to identify people
  # with the same first name
  
  ggplot(mapping = aes(x = age, 
                       y = total_episodes_appeared)) +

  geom_jitter() +
  
  # the graph looked weirdly square because episodes appeared will always be a whole number,
  # so all points were on the same 10 lines, plus some of the points overlapped
  
  geom_smooth() +
  labs(title = "Age vs. Total Episodes Appeared",
       subtitle = "There is little to no correlation between age and how far one makes it in the competition",
       x = "Age",
       y = "Total Episodes Appeared")

write_rds(age_vs_episodes, "age_vs_episodes.rds")

# writing as an rds instead of a png in case I want to add an intereactive element later


