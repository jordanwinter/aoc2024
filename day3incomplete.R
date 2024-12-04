###
# Day 3
###


### Part 1

input <- readLines("day3input.txt")

selectgood <- regmatches(input, gregexpr("mul\\((\\d{1,3}),\\d{1,3}\\)", input))

# Works I think, need to separate and unconcatenate thennnnn

#make into a df?

selectgood_flat <- unlist(selectgood)

flatdf <- data.frame(match = selectgood_flat)
         
gooddf <- tibble(selected = selectgood)






#all fucked up from being concatenated would it kill AoC for just a simple csv. I'm just an ecologist
# Fuck this above worked better lmao
####unconcat <- gooddf %>%  separate_rows(selected, sep = " ")
