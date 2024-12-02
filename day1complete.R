###
# Day 1
###

### Part 1 ###

input <- read.csv("day1input.csv", header = T)


library(tidyverse)

ordered <- input %>% 
  mutate(across(everything(),sort)) %>% 
  arrange(LEFT, RIGHT)


orderedplusdistance <- ordered %>% 
  mutate(high = pmax(LEFT,RIGHT)) %>% 
  mutate(low = pmin(LEFT, RIGHT)) %>% 
  mutate(distance = high - low)

sum(orderedplusdistance$distance)         

### WORKS! ###



### Part 2 ###

comparesame <- input %>% 
  mutate(timesappear = sapply(input$LEFT, function(x) sum(input$RIGHT == x))) %>% 
  mutate(multiply = LEFT * timesappear)

sum(comparesame$multiply)


### WORKS! ###         