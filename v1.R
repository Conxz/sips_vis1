
library(readr)
library(dplyr)
library(ggplot2)

full_trains <- read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-02-26/full_trains.csv")

full_trains %>% 
  ggplot(aes(x = `journey_time_avg`)) + 
  geom_histogram() +
  labs(x = "Journey Time (min.)", y = "Number of Instances", 
       title = "Histogram of Average Journey Time for trains on the SNCF Network")
