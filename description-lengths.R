library(tidyverse)
library(bakeoff)
library(stringr)

show_desc_length <- challenges |>
  mutate(show_desc_length = str_count(showstopper, '\\w+')) |>
  
  # I looked up how to count the words in a string and this was the simplest answer
  
  ggplot(mapping = aes(x = show_desc_length,
                       color = result, 
                       fill = result)) +
  geom_density(alpha = 0.1) +
  
  # Originally, I made the graph a histogram, but it made it hard to see what the most common
  # lengths were based on results
  
  scale_x_continuous(breaks = c(1:28)) +
  
  # I played around with the breaks a but and this might not. be optimal, but it's helpful
  # to see where the peaks of each result are to the exact word
  
  labs(x = "Showstopper Description Length",
       y = "Density",
       title = "Distribution of Description Length by Result",
       subtitle = "The most common description length for winning showstoppers is 6 words",
       caption = "Source: bakeoff") +
  theme_light()
 
write_rds(show_desc_length, "show_desc_length.rds")

sig_desc_length <- challenges |>
  mutate(sig_desc_length = str_count(signature, '\\w+')) |>
  ggplot(mapping = aes(x = sig_desc_length, 
                       fill = result, 
                       color = result)) +
  geom_density(alpha = 0.1) +
  scale_x_continuous(breaks = 1:19) +
  theme_light() +
  labs(x = "Signature Description Length",
       y = "Density",
       title = "Distribution of Description Length by Result",
       subtitle = "Most descriptions are around 5 words, but winner's description's are a few words longer",
       caption = "Source: bakeoff")

write_rds(sig_desc_length, "sig_desc_length.rds")

# Also, I'm ignoring the warning message about dropping rows because I know why. When people have been eliminated,
# their result is NA. This doesn't affect the graph because I only care about people who baked in that episode. BUT,
# I can't drop the NAs because there are cases where someone was sick or their data is missing for a particular challenge,
# and I need other info from those rows



