library(tidyverse); library(data.table)

source("code/utils.R")

path <- "compras-publicas/data-raw/nucc/"

ldt <- read_all(path, fun = fread, sep = ";", dec = ",")
ldr <- read_all(path, fun = read_csv2, locale = locale(decimal_mark = ","))
ldf <- read_all(path, fun = read.csv2)

#======================================================================
# conferencia numero de linhas

ldt %>% check_dim()
ldr %>% check_dim()
ldf %>% check_dim()

system(paste0("wc -l ", path, "/*.csv")) 

dt <- fread("compras-publicas/data-raw/nucc/dm_processo.csv", sep = ";", dec = ",")
