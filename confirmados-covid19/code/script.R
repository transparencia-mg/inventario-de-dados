library(tidyverse); library(readxl); library(janitor); library(summarytools)

source("code/utils.R")

mun <- read_excel("confirmados-covid19/data-raw/RELATORIO_DTB_BRASIL_MUNICIPIO.xls")
names(mun) <- make_clean_names(names(mun))
mun <- mun %>% 
  select(codigo_municipio_completo, nome_municipio)

cols_spec <- c(
  "id",
  "sexo",
  "idade",
  "municipio_de_residencia",
  "internacao_sim_ou_nao",
  "internacao_em_uti_sim_ou_nao")

INPUT <- "confirmados-covid19/data-raw/CGE_CONF_DATA_24.04.2020.xlsx"
# URL <- "http://www.transparencia.dadosabertos.mg.gov.br/"
N <- 1419
OUTPUT <- "confirmados-covid19/data/casosconfcovid19mg20200424.csv"


dt_raw <- read_excel(INPUT)

infer_spec <- lapply(dt_raw, class)

stopifnot(all(make_clean_names(names(infer_spec)) == cols_spec))

#======================================================================
# correcoes diversas de codificação

dt <- set_names(dt_raw, cols_spec) %>% 
          mutate(internacao_sim_ou_nao = toupper(internacao_sim_ou_nao),
                 internacao_em_uti_sim_ou_nao = toupper(internacao_em_uti_sim_ou_nao)) %>% 
          mutate(internacao_em_uti_sim_ou_nao = case_when(
            id == 1154 ~ "SIM",
            TRUE ~ internacao_em_uti_sim_ou_nao
          )) %>% 
          mutate(municipio_de_residencia = case_when(
            municipio_de_residencia == "Outros" ~ "OUTROS",
            municipio_de_residencia == "São João Del Rei" ~ "São João del Rei",
            municipio_de_residencia == "Espirito Santo do Dourado" ~ "Espírito Santo do Dourado",
            TRUE ~ municipio_de_residencia
          ))

#======================================================================
# checagens manuais

# o ID corresponde à identificação interna dos pacientes, não representando, portanto, contagem numérica dos mesmos.
# dt %>% 
#   filter(all_duplicated(id)) # id podem ser duplicados?
# 
# setdiff(1:N, dt$id) # pela explicação ids não precisam seguir sequencial. confirmar
# 
# dt_ibge <- left_join(dt, mun, by = c("municipio_de_residencia" = "nome_municipio"))
# 
# dt_ibge %>% filter(is.na(codigo_municipio_completo))

#======================================================================

names(dt) <- c("ID", "SEXO", "IDADE", "MUNICIPIO_DE_RESIDENCIA", "INTERNACAO", "INTERNACAO_UTI")

write_excel_csv2(dt, OUTPUT)
