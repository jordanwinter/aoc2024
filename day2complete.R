###
# Day 2
###

### Part 1 ###

library(tidyverse)

input <- read.csv("day2input.csv", header = F)

organized <- read.table(text = input$V1, header = F, col.names = c("1","2","3","4","5","6","7","8"), fill = T)


# The levels are either all increasing or all decreasing.

# Any two adjacent levels differ by at least one and at most three


read_list <- function(path, sep = "", type = identity) {
  lines <- readLines(path)
  res <- strsplit(lines, sep)
  res <- lapply(res, type)
  res
}

input <- read_list("day2input.txt", " ", as.integer)

safe <- function(x) {
  diffs <- diff(x)
  cond1 <- all(diffs > 0) || all(diffs < 0)
  cond2 <- all(abs(diffs) >= 1) && all(abs(diffs) <= 3)
  cond1 && cond2
}

vapply(input, safe, logical(1)) |>
  sum()

??diffs



### PART 2


skip_safe <- function(x) {
  is_safe <- FALSE
  for (i in seq_along(x)) {
    if (safe(x[-i])) {
      is_safe <- TRUE
      break
    }
  }
  is_safe
}

vapply(input, skip_safe, logical(1)) |>
  sum()



###