
library(readr)
library(dplyr)
library(ggplot2)
library(gghighlight)
library(tools)
library(magrittr)
library(ggthemes)
library(stringr)


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

full_trains %>% 
  filter(grepl('PARIS', departure_station)) %>%
  #filter(str_detect(departure_station, "PARIS")) %>%
  mutate(departure_station = toTitleCase(tolower(departure_station))) %>%
  group_by(month, year, departure_station) %>%
  summarise(mean_num_of_canceled_trains = mean(num_of_canceled_trains, na.rm = TRUE)) %>%
  ggplot(aes(x = mean_num_of_canceled_trains, 
             y = departure_station,
             colour = departure_station)) +
  geom_jitter(width = .2, alpha = .6, size = 3, stroke = 1) +
  guides(colour=FALSE) + 
  scale_color_tableau() +
  facet_wrap(~ year) +
  theme(text = element_text(size = 12)) +
  labs(x=NULL, y = NULL, title = "Cancelled Trains from Pairs Railway Station by Year/Month", 
       subtitle = "Average Number of Callcellations per Month")

# Challenge 4




