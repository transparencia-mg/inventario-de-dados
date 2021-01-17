library(tidyverse); library(readxl)

cols_spec <- c(
  "Paciente",
  "Sexo",
  "Idade",
  "Município de Residência",
  "Data do óbito",
  "Comorbidade")

RNG <- "A3:F603"
INPUT <- "obitos-covid19/data-raw/OBITOS_CONF_COVID-19_MG_19.06.2020.xls"
OUTPUT <- "obitos-covid19/data/obitos-confirmados-covid19-mg.csv"

dt_raw <- read_excel(INPUT, range = RNG)

infer_spec <- lapply(dt_raw, class)

stopifnot(all(names(infer_spec) == cols_spec))

dt <- dt_raw %>% 
      set_names(cols_spec) %>% 
      mutate(`Data do óbito` = as.numeric(format(`Data do óbito`, "%Y%m%d")))

write_excel_csv2(dt, OUTPUT)
