library(tidyverse); library(readxl)

cols_spec <- c(
  "Paciente",
  "Sexo",
  "Idade",
  "Município de Residência",
  "Data do óbito",
  "Comorbidade")

rng <- "A3:F42"

dt_raw <- read_excel("obitos-covid19/data-raw/OBITOS_CONF_COVID-19_MG_18.04.2020.xlsx", range = rng)

infer_spec <- lapply(dt_raw, class)

stopifnot(all(names(infer_spec) == cols_spec))

dt <- dt_raw %>% 
      mutate(`Data do óbito` = as.numeric(format(`Data do óbito`, "%Y%m%d")))


previous <- read_csv2("http://www.transparencia.dadosabertos.mg.gov.br/dataset/d869e025-9a83-4c64-8d3a-20238786279a/resource/9e370f13-125f-4ee8-94a2-4f54d3ffa776/download/obitosconfcovid19mg20200417.csv",
                      locale = locale(encoding = "latin1"))


check <- cols_spec %>% 
         map(~ dt[[.x]][1:35] == previous[[.x]]) %>% 
         set_names(cols_spec)

check %>% 
  map(all)


write_excel_csv2(dt, "obitos-covid19/data/obitosconfcovid19mg20200418.csv")
