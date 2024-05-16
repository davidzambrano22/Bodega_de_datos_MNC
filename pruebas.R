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


base_descriptivas = read_excel("data/input/bases/Base1Descriptivas.xls")
base_socioemocionales = read_excel("data/input/bases/Base2Descriptivas.xls", sheet = "Socioemocionales")
names(base_socioemocionales)

base_descriptivas %>% dplyr::select(`Código_área`, `¿Cuál es su área de desempeño?`) %>%
  dplyr::filter(`Código_área` %in%  c("AFIR")) %>%
  group_by(`¿Cuál es su área de desempeño?`) %>% count(`¿Cuál es su área de desempeño?`) %>% 
  plot_ly(labels = ~`¿Cuál es su área de desempeño?`, values = ~n, type="pie",
        textposition = 'inside',
        
        textinfo = 'label+percent',
        
        insidetextfont = list(color = '#FFFFFF'),
        
        hoverinfo = 'text',
        
        text = ~paste('$', n, ' billions'),
        
        marker = list(colors = colors,
                      
                      line = list(color = '#FFFFFF', width = 1)),
        
        #The 'pull' attribute can also be used to create space between the sectors
        
        showlegend = FALSE) %>%  layout(title = 'United States Personal Expenditures by Categories in 1960',
                                       
                                       xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
                                       
                                       yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
