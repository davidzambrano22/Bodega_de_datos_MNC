library(dplyr)
library(readxl)
library(ggplot2)
library(tm)
library(memoise)
library(tm)
library(memoise)
library(wordcloud)
library(RSQLite)
library(haven)
library(plotly)


base_medios = read_excel("data/input/bases/Base2Descriptivas.xls", sheet = "MediosBusqueda")
names(base_medios)

base_medios %>%
  dplyr::select(`Medios de busqueda de personal`, `AFIR`) %>% 
  arrange("AFIR") %>% 
  head(5) %>%
  plot_ly(labels = ~`Medios de busqueda de personal`, values = ~AFIR, type="pie",
          textposition = 'inside',
          textinfo = 'label+percent',
          insidetextfont = list(color = '#FFFFFF'),
          hoverinfo = 'text',
          text = ~AFIR,
          marker = list(colors = colors,
                        line = list(color = '#FFFFFF', width = 1)),
          #The 'pull' attribute can also be used to create space between the sectors
          showlegend = FALSE) %>%  layout(title = 'Piechart por Cargos de Difícil Consecucion',
                                          width = 500,
                                          height = 500,
                                          xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
                                          yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))



base_TasaOcupados <- read_excel("data/input/bases/Caracterizacion.xlsx", sheet = "Tasa de ocupados")
base_OcupadosCIIU <- read_excel("data/input/bases/Caracterizacion.xlsx", sheet = "Ocupados por división CIIU")
base_OcupadosEdadSexo <- read_excel("data/input/bases/Caracterizacion.xlsx", sheet = "Ocupados por edad y sexo")
base_OcupadosNivelEdu <- read_excel("data/input/bases/Caracterizacion.xlsx", sheet = "Ocupados por Nivel edu")
names(base_OcupadosNivelEdu)
