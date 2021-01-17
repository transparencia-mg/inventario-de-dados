library(tidyverse); library(data.table)

source("code/utils.R")

path <- "compras-publicas/data-raw/nucc/"

#======================================================================
# schema disponibilizado pelo NUCC

ldt_nucc <- read_all(path, fun = fread, sep = ";", dec = ",")

schema_nucc <- ldt_nucc %>% 
  map(~ tibble(cols = names(.x))) %>% 
  bind_rows(.id = "table")

schema_nucc <- schema_nucc %>% 
  mutate(table = str_remove_all(table, "_")) %>% 
  arrange(table, cols) %>% 
  mutate(id = paste0(table, cols)) %>% 
  select(id, table_nucc = table, cols_nucc = cols)

#======================================================================
# schema presente no CKAN em produção para o ano de 2016 (pode ser diferente entre anos)

ldt_ckan <- read_all("compras-publicas/data-raw/ckan/", fun = fread, pattern = "2016.csv" , sep = ";", dec = ",", encoding = "Latin-1")

schema_ckan <- ldt_ckan %>% 
  map(~ tibble(cols = names(.x))) %>% 
  bind_rows(.id = "table")

schema_ckan <- schema_ckan %>% 
  mutate(cols = str_to_lower(cols)) %>% 
  arrange(table, cols) %>% 
  mutate(id = paste0(table, cols)) %>% 
  select(id, table_ckan = table, cols_ckan = cols)

#======================================================================
# schema no diagrama entidade relacionamento do banco ORACLE do Portal da Transparencia

# adicionei manualmente coluna no csv (i.e. invalid file)
schema_der <- fread("compras-publicas/data-raw/der/DM_Columns.csv", 
                    select = c("Table_Name", "Column_Name", "Logical_Type_Name", "PK_Flag", "FK_Flag"))

schema_der <- schema_der %>% 
  transmute(table = str_to_lower(str_remove_all(Table_Name, "_")),
            cols = str_to_lower(Column_Name)) %>% 
  arrange(table, cols) %>% 
  mutate(id = paste0(table, cols)) %>% 
  select(id, table_der = table, cols_der = cols)


#======================================================================

schema <- list(schema_der, schema_ckan, schema_nucc) %>% 
  reduce(full_join, by = "id") %>% 
  select(-id) %>% 
  mutate(table = case_when(
    !is.na(table_der) ~ table_der,
    !is.na(table_ckan) ~ table_ckan,
    !is.na(table_nucc) ~ table_nucc,
    TRUE ~ NA_character_
  )) %>% 
  arrange(table)

schema %>% 
  filter(!complete.cases(.))

writexl::write_xlsx(schema, "compras-publicas/full_schema.xlsx")

