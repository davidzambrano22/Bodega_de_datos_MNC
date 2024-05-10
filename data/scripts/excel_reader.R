library(readxl)
library(tidyverse)
library(RSQLite)
library(stringi)
library(haven)


# create a connection to the database called "mcn-relational.db"
con <- dbConnect(RSQLite::SQLite(), "data/db/mnc-relational.db")


# Read updated tables -----------------------------------------------------

# # Read and write BaseFinal (consolidate base)

# fact_table <- read_xls("data/input/bases/BaseFinal2.xls")
# 
# column_types <- (sapply(fact_table , class))
# column_types[["Tasacrecimiento"]] <- "numeric"
# column_types[["Ocupados Total"]] <- "numeric"
# column_types[["Ocupados CIIU"]] <- "numeric"
# column_types[["Valor agregado"]] <- "numeric"

fact_table <- read_dta("data/input/bases/BaseFinal2.dta") %>% as_tibble()
dbWriteTable(con, "fact_table", fact_table , overwrite = T)

# # Read and write CIIU table to database
# ciiu_table <- read_xls("data/input/bases/Sector.xls") %>% as_tibble()
# dbWriteTable(con, "CIIU", ciiu_table , overwrite = T)

# # Read and write CINE table to database
# cine_table <- read_xls("data/input/bases/CINE.xls") %>% as_tibble()
# dbWriteTable(con, "CINE", cine_table, overwrite = T)

# # Read and write CUOC table to database
# cuoc_table <- read_xls("data/input/bases/CUOC.xls") %>% as_tibble()
# dbWriteTable(con, "CUOC", cuoc_table , overwrite = T)

# Read and write CUOCV2 table to database
# cuoc_table <- read_excel("data/input/bases/CUOCV2.xlsx") %>% as_tibble()
# dbWriteTable(con, "CUOC", cuoc_table , overwrite = T)

# # Read and write AREAS table to database
# areas_table <- read_xls("data/input/bases/AreasCualificacion.xls") %>% as_tibble()
# dbWriteTable(con, "areas_table", areas_table, overwrite = T)

# # Read and write CARACTERIZACIÓN table to database
# caract_table <- read_xls("data/input/bases/CARACTERIZACION.xls") %>% as_tibble()
# dbWriteTable(con, "Caract_table", caract_table, overwrite = T)


# 
# # read the file data/20230704 BD Áreas de Cualificación CUOC_CIIU_CINE.xlsx
# # read the sheet called Areas_Cualificacion
# areas_cualificacion <- read_excel(
#     "data/input/20230704 BD Áreas de Cualificación CUOC_CIIU_CINE.xlsx",
#     sheet = "Areas_Cualificacion") %>%
#   as_tibble()
# 
# # Drop the column called "#"
# areas_cualificacion <-  areas_cualificacion %>%
#   select(-`#`) %>%
#   rename(
#       codigo_area = `Código Área`,
#       nombre_area = `Área de cualificación`
#   )
# 
# # Write the table to the database
# dbWriteTable(con, "areas_cualificacion", areas_cualificacion)
# 
# # read the sheet called CUOC_2022
# cuoc_index_2022 <- read_excel(
#     "data/input/20230704 BD Áreas de Cualificación CUOC_CIIU_CINE.xlsx",
#     sheet = "Índice CUOC 2022",
#     range = "B6:G16029") %>%
#   as_tibble()
# 
# # Rename the columns to indice_numerico, denominaciones, codigo_area,
# # area_cualificacion, origen_denominacion, area_principal_dane
# cuoc_index_2022 <- cuoc_index_2022 %>%
#     rename(
#         indice_numerico = `Índice numérico`,
#         denominaciones = `Denominaciones`,
#         codigo_area = `Código Área`,
#         area_cualificacion = `Área de cualificación`,
#         origen_denominacion = `Origen Denominación`,
#         area_principal_dane = `Área Principal DANE`
#     )
# 
# # Write the table to the database
# dbWriteTable(con, "cuoc_index_2022", cuoc_index_2022)
# 
# # read the sheet called CIIU-4AC_Vs ÁreasC
# ciiu_actividades_areas <- read_excel(
#     "data/input/20230704 BD Áreas de Cualificación CUOC_CIIU_CINE.xlsx",
#     sheet = "CIIU-4AC_Vs ÁreasC") %>%
#   as_tibble()
# 
# # rename the columns to division, grupo, clase, descripcion, codigo_area,
# # area_cualificacion
# ciiu_actividades_areas <- ciiu_actividades_areas %>%
#     rename(
#         division = `División`,
#         grupo = `Grupo`,
#         clase = `Clase`,
#         descripcion = `Descripción`,
#         codigo_area = `Código Área`,
#         area_cualificacion = `Área de cualificación`
#     ) %>%
#     mutate(clase = gsub("\\*", "", clase))
# 
# # Write the table to the database
# dbWriteTable(con, "ciiu_actividades_areas", ciiu_actividades_areas)
# 
# # read the sheet called CINE-F-2013_Vs ÁreasC
# cine_actividades_areas <- read_excel(
#     "data/input/20230704 BD Áreas de Cualificación CUOC_CIIU_CINE.xlsx",
#     sheet = "CINE-F-2013_Vs ÁreasC") %>%
#   as_tibble()
# 
# # Código Área, Área de cualificación, Código CINE-2011 AC, Campos Detallado
# # rename the columns to codigo_area, area_cualificacion, codigo_cine_2011_ac,
# # campos_detallado
# cine_actividades_areas <- cine_actividades_areas %>%
#     rename(
#         codigo_area = `Código Área`,
#         area_cualificacion = `Área de cualificación`,
#         codigo_cine_2011_ac = `Código CINE-2011 AC`,
#         campos_detallado = `Campos Detallado`
#     )
# 
# # Write the table to the database
# dbWriteTable(con, "cine_actividades_areas", cine_actividades_areas)
# 
# # read the file
# # data/input20230606 BD Áreas de cualificación vs Programas Edu Superior.xlsx
# 
# # read the sheet called Programas
# programas <- read_excel(
#     "data/input/20230606 BD Áreas de cualificación vs Programas Edu Superior.xlsx",
#     sheet = "Programas") %>%
#   as_tibble()
# 
# # rename the columns by lowercasing them and removing accents
# programas <- programas %>%
#     rename_all(tolower) %>%
#     rename_all(~stri_trans_general(str = .,
#                                    id = "Latin-ASCII")) %>%
#     rename_all(~gsub(" ", "_", .))
# 
# # Write the table to the database
# dbWriteTable(con, "programas", programas)
# 
# # read the sheet called Cobertura convenios
# cobertura_convenios <- read_excel(
#     "data/input/20230606 BD Áreas de cualificación vs Programas Edu Superior.xlsx",
#     sheet = "Cobertura convenios") %>%
#   as_tibble()
# 
# # rename the columns by lowercasing them and removing accents
# cobertura_convenios <- cobertura_convenios %>%
#   rename_all(tolower) %>%
#     rename_all(~stri_trans_general(str = .,
#                                    id = "Latin-ASCII")) %>%
#     rename_all(~gsub(" ", "_", .))
# 
# # Write the table to the database
# dbWriteTable(con, "cobertura_convenios", cobertura_convenios)
# 
# # read the sheet called Cobertura
# cobertura <- read_excel(
#     "data/input/20230606 BD Áreas de cualificación vs Programas Edu Superior.xlsx",
#     sheet = "Cobertura") %>%
#   as_tibble()
# 
# # rename the columns by lowercasing them and removing accents
# cobertura <- cobertura %>%
#   rename_all(tolower) %>%
#     rename_all(~stri_trans_general(str = .,
#                                    id = "Latin-ASCII")) %>%
#     rename_all(~gsub(" ", "_", .))
# 
# # Write the table to the database
# dbWriteTable(con, "cobertura", cobertura)
