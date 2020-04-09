library(tidyverse); library(ckanr)

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
