library(dplyr)
library(readxl)
library(ggplot2)
library(tm)
library(memoise)
library(tm)
source("wordcloud2a.R")
library(memoise)
library(wordcloud)
library(RSQLite)

base_TasaOcupados <- read_excel("data/input/bases/Caracterizacion.xlsx", sheet = "Tasa de ocupados")
names(base_TasaOcupados)


library(haven)
DemandaSPE <- read_dta("data/input/bases/DemandaSPE.dta")
View(DemandaSPE)
names(DemandaSPE)
