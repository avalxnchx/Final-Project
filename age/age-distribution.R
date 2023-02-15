library(bakeoff)
library(tidyverse)

bakers2 <- bakers |>
  mutate(

    age_group = case_when(
      age < 18            ~ "0-17",
      age > 17 & age < 20 ~ "18,19",
      age >= 20 & age < 30 ~ "20-29",
      age >= 30 & age < 40 ~ "30-39",
      age >= 40 & age < 50 ~ "40-49",
      age >= 50 & age < 60 ~ "50-59",
      age >= 60 & age < 70 ~ "60-69",
      age >= 70 ~ "70+")) |>
    
    # It took me SO LONG to figure out the case_when() function to create age groups.
    # I kept trying to figure out the equivalent of if and elif statements in R,
    # and I originally had a form of that to define the groups, but it didn't work
    
    # The source that reminded me of the case_when() thing had a line converting age_group
    # to a factor, but it runs without it (I have it in a note just in case)

  ggplot(mapping = aes(x = age_group)) +
  geom_bar(fill = "paleturquoise2") +
  scale_fill_manual() +
  scale_y_continuous(breaks = c(1, 5, 10, 15, 20, 25, 30, 35, 40, 45)) +
  labs(title = 'Distribution of Age in "The Great British Bake Off"',
       subtitle = "There are about the same number of 30-39-year-olds as 40+-year-olds",
       x = "Age",
       y = "Count",
       caption = "Source: bakeoff") +
  theme_light()

write_rds(bakers2, "age-distribution.rds")
