library(readr)
pop <- read_csv("mergedpop.csv", col_types = cols(Population = col_number()))
