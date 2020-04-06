library(tidyverse); library(data.table)

source("code/utils.R")

path <- "compras-publicas/data-raw/nucc/"

ldt <- read_all(path)

#======================================================================
# conferencia numero de linhas

ldt %>% check_dim()
system(paste0("wc -l ", path, "/*.csv")) 
