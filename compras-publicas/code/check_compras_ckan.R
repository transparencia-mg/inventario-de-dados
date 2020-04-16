library(tidyverse)

path <- "compras-publicas/data-raw/ckan/"

#======================================================================
# determinar quais arquivos nao estao disponiveis no CKAN

files <- list.files(path, pattern = "\\d{4}[.]csv$", full.names = FALSE)

files %>% 
  str_remove_all("[.]csv") %>% 
  str_split("(?=\\d{4})", simplify = TRUE) %>% 
  as.data.frame() %>% 
  reshape2::dcast(V1 ~ V2, fun.aggregate = length, value.var = "V2") %>% 
  filter_all(any_vars(. == 0))
