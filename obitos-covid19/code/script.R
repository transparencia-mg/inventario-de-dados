library(tidyverse); library(readxl)

cols_spec <- c(
  "Paciente",
  "Sexo",
  "Idade",
  "Município de Residência",
  "Data do óbito",
  "Comorbidade")

RNG <- "A3:F83"
INPUT <- "obitos-covid19/data-raw/OBITOS_CONF_COVID-19_MG_29.04.2020.xlsx"
URL <- "http://www.transparencia.dadosabertos.mg.gov.br/dataset/d869e025-9a83-4c64-8d3a-20238786279a/resource/5d6d28ee-5110-4f97-ada8-3eff8a9bae39/download/obitosconfcovid19mg20200428.csv"
N <- 71 # número de casos do dia anterior 
OUTPUT <- "obitos-covid19/data/obitosconfcovid19mg20200429.csv"

dt_raw <- read_excel(INPUT, range = RNG)

infer_spec <- lapply(dt_raw, class)

stopifnot(all(names(infer_spec) == cols_spec))

dt <- dt_raw %>% 
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
