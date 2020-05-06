library(tidyverse); library(readxl)

cols_spec <- c(
  "Paciente",
  "Sexo",
  "Idade",
  "Município de Residência",
  "Data do óbito",
  "Comorbidade")

RNG <- "A3:F100"
INPUT <- "obitos-covid19/data-raw/OBITOS_CONF_COVID-19_MG_06.05.2020.xlsx"
URL <- "http://www.transparencia.dadosabertos.mg.gov.br/dataset/d869e025-9a83-4c64-8d3a-20238786279a/resource/14f67b0b-83e7-4f86-94ab-00fef17a3662/download/obitosconfcovid19mg20200505.csv"
N <- 94 # número de casos do dia anterior 
OUTPUT <- "obitos-covid19/data/obitosconfcovid19mg20200506.csv"

dt_raw <- read_excel(INPUT, range = RNG)

infer_spec <- lapply(dt_raw, class)

stopifnot(all(names(infer_spec) == cols_spec))

dt <- dt_raw %>% 
      set_names(cols_spec) %>% 
      mutate(`Data do óbito` = as.numeric(format(`Data do óbito`, "%Y%m%d")))

previous <- read_csv2(URL, 
                      locale = locale(encoding = "UTF-8", decimal_mark = ",", grouping_mark = "."))


check <- cols_spec %>% 
         map(~ dt[[.x]][1:N] == previous[[.x]]) %>% 
         set_names(cols_spec)

check %>% 
  map(all) %>% 
  unlist() %>% 
  all() %>% 
  stopifnot()

write_excel_csv2(dt, OUTPUT)
