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
  
  geom_smooth(method = loess, formula = y ~ x, se = FALSE) +
  
  # I chose not to include the standard error after Preceptor pointed out my audience... I don't really think
  # this is for super technical computer people, so that extra information is lost and it will be more confusing
  # to explain, I think
  
  labs(title = "Age vs. Total Episodes Appeared",
       subtitle = "There is little to no correlation between age and how far one makes it in the competition",
       x = "Age",
       y = "Total Episodes Appeared")

write_rds(age_vs_episodes, "age_vs_episodes.rds")

# writing as an rds instead of a png in case I want to add an interactive element later; update: decided
# it somehow feels rude to identify the people's names with an interactive element because it's about their age?
# For future graphs I will switch to ggsave(), but honestly just don't want to go through changing everything
# and deleteing old rds files :)


