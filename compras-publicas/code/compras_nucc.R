library(tidyverse); library(data.table)

source("code/utils.R")

path <- "compras-publicas/data-raw/nucc/"

ldt <- read_all(path, fun = fread, sep = ";", dec = ",")
