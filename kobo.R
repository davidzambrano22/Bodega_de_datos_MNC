library(httr)
library(jsonlite)
library(tidyverse)

# REQUEST TO xlsx table -------------------------------------------------
url.xslx <- 'https://eu.kobotoolbox.org/private-media/maria_jaramillo/exports/Identificaci%C3%B3n_de_brechas_de_talento_humano_-_all_versions_-_labels_-_2024-03-15-19-56-21.xlsx'




token_brechas <- ("0ec70f3fc55780976cd45766fa6914d8cefbbbcc")
headers <- c(Authorization = paste("token", token_brechas))

# Get response
response <- GET(url.xslx, add_headers(headers))
print(response)

# Read content as raw and save it as xlsx file
data <- httr::content(response, as = "raw", encoding = "UTF-8")
path.to.xlsx.file <- "data/input/Encuesta_identificacion_breachas_kobotoolbox.xlsx"
writeBin(data, path.to.xlsx.file)

# Read the xlsx file (sheet 1)
datos <- readxl::read_xlsx(path.to.xlsx.file, sheet = 1)


# # Read the xlsx file (sheet 2)
# datos_cargos <- readxl::read_xlsx(path.to.xlsx.file, sheet = 2)
# names(datos_cargos)







# token_brechas <- ("0ec70f3fc55780976cd45766fa6914d8cefbbbcc")
# 
# url <- "https://eu.kobotoolbox.org/"
# instrument <- "aEVEuUEh9GJqJCjFWTmp5q"
# endpoint <- paste0("assets/", instrument, "/submissions/?format=json")
# 
# full_address <- paste0(url, endpoint)
# headers <- c(Authorization = paste("token", token_brechas))
# response <- GET(full_address, add_headers(headers))
# 
# print(response)
# data <- content(response, as = "text", encoding = "UTF-8")
# 
# datos <- fromJSON(data) %>% as_tibble()
# # View(datos)
# 
# # get datos headers in a list
# colnames <- names(datos)
