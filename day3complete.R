###
# Day 3
###

library(tidyverse)

### Part 1

input <- readLines("day3input.txt")

selectgood <- regmatches(input, gregexpr("mul\\((\\d{1,3}),\\d{1,3}\\)", input))

# Works I think, need to separate and unconcatenate thennnnn

#make into a df?

selectgood_flat <- unlist(selectgood)

flatdf <- data.frame(match = selectgood_flat)
         
gooddf <- tibble(selected = selectgood)

library(tidyverse)

df_clean <- flatdf %>%
  # Extract the two sets of digits into separate columns
  mutate(
    number1 = str_extract(match, "(?<=mul\\()\\d{1,3}"),
    number2 = str_extract(match, "(?<=,\\d{0,3})\\d{1,3}")) %>%
  mutate(across(c(number1, number2), as.numeric)) %>% 
  mutate(multiplied = number1 * number2)
  
sum(df_clean$multiplied)

### WORKS!!! ###

### Part 2 ###

#Delete between don't and do?

snippeddf <- readLines("day3input.txt") %>% 
  paste0(collapse = "")


cleaned_text <- str_remove_all(snippeddf, "don't\\(\\).*?do\\(\\)")

#selectgood <- regmatches(cleaned_text, gregexpr("mul\\((\\d{1,3}),\\d{1,3}\\)", cleaned_text))

selectgood <- str_extract_all(cleaned_text, "mul\\(\\d+,\\d+\\)")

# Works I think, need to separate and unconcatenate thennnnn

#make into a df?

selectgood_flat <- unlist(selectgood)

flatdf <- data.frame(match = selectgood_flat)

gooddf <- tibble(selected = selectgood)

library(tidyverse)

df_clean <- flatdf %>%
  # Extract the two sets of digits into separate columns
  mutate(
    number1 = str_extract(match, "(?<=mul\\()\\d{1,3}"),
    number2 = str_extract(match, "(?<=,\\d{0,3})\\d{1,3}")) %>%
  mutate(across(c(number1, number2), as.numeric)) %>% 
  mutate(multiplied = number1 * number2)

sum(df_clean$multiplied)




#all fucked up from being concatenated would it kill AoC for just a simple csv. I'm just an ecologist
# Fuck this above worked better lmao
####unconcat <- gooddf %>%  separate_rows(selected, sep = " ")
