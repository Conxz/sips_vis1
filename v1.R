
library(readr)
library(dplyr)
library(ggplot2)
library(gghighlight)

full_trains <- read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-02-26/full_trains.csv")

# Challenge 1
full_trains %>% 
  ggplot(aes(x = `journey_time_avg`)) + 
  geom_histogram() +
  labs(x = "Journey Time (min.)", y = "Number of Instances", 
       title = "Histogram of Average Journey Time for trains on the SNCF Network")

# Challenge 2
national_trains <- full_trains %>%
  filter(service == 'National')

# solution 1
full_trains %>% 
  ggplot(aes(x = `journey_time_avg`, fill=service)) + 
  geom_histogram(bins = 20) + 
  gghighlight(service == 'National', use_group_by = FALSE) + 
  labs(x = "Journey Time (min.)", y = "Number of Instances", 
       title = "Histogram of Average Journey Time for trains on the SNCF Network", 
       subtitle = "National Service trains highlighted in red")

# solution 2
full_trains %>% 
  ggplot(aes(x = `journey_time_avg`)) + 
  geom_histogram(fill='grey', bins=20) + 
  geom_histogram(data=national_trains, fill='red', bins=20) + 
  labs(x = "Journey Time (min.)", y = "Number of Instances", 
       title = "Histogram of Average Journey Time for trains on the SNCF Network", 
       subtitle = "National Service trains highlighted in red")

# Challenge 3


