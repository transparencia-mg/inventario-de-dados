library(tidyverse); library(data.table); library(ckanr)

path <- "compras-publicas/data-raw/ckan/"

#======================================================================
# download dos arquivos do ckan

ckanr_setup(url = "http://www.transparencia.dadosabertos.mg.gov.br")

pkg <- package_show(id = "compras-contratos-do-estado-de-minas-gerais", as = "table")

safe_download_file <- safely(download.file)

pkg$resources %>% 
  select(url) %>% 
  mutate(destfile = file.path(path, basename(url))) %>% 
  pwalk(~safe_download_file(url = .x, destfile = .y))

#======================================================================
# determinar quais arquivos nao estao disponiveis no CKAN

files <- list.files(path, pattern = "[.]csv$", full.names = FALSE)

files %>% 
  str_remove_all("[.]csv") %>% 
  str_split("(?=\\d{4})", simplify = TRUE) %>% 
  as.data.frame() %>% 
  reshape2::dcast(V1 ~ V2, fun.aggregate = length, value.var = "V2") %>% 
  filter_all(any_vars(. == 0))
