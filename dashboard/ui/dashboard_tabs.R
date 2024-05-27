
# TAB CONSULTA ------------------------------------------------------------

tab_consulta <- tabItem(
  div(style = "height: 20px;"),
    tabName = "consulta",
    class = "tab_consulta",
    tags$style('.tab_consulta {
                             background-color: #ffffff;
              }'),
  
    div(style = "height: 20px;"),
    fluidRow(
      column(8, offset = 2,
             tags$h1("Descriptivos por Área del MNC",
                     style = "font-size: 45px; text-align: center; font-weight: bold; color: #4682B4;"
             ),
             tags$hr(style = "border-top: 4px solid black; margin-top: 5px; margin-bottom: 10px;  border-color: #D3D3D3; width: 20%;"),
             tags$p("En esta sección podrá consultar los datos de la 
            Sistema de Gestión de datos del MNC Colombia.",
                    style = "text-align: center; font-size: 22px;"
             )
      )
    ),
    div(
      style = "height: 40px;"
      ),
# 
#     fluidRow(
#       box(width = 12,
#           fluidRow(
#             tags$h1("Estadísticas Descriptivas por Área de Cualificación", style = "text-align: center; font-weight: bold; color: #4682B4;"),
#             tags$hr(style = "border-top: 4px solid black; margin-top: 5px; margin-bottom: 10px;  border-color: #D3D3D3; width: 10%;"),
#             div(style = "height: 30px;")
#           ),
#           fluidRow(
#             column(2,
#                    uiOutput("select_area_catalog")
#             ),
#             column(3,
#                    div(style = "height: 24px;"),
#                    actionButton("clear_areas", "Limpiar Filtros", icon = icon("eraser"),
#                                 style="color: #fff; background-color: #dc3545; border-color: #2e6da4"
#                    )
#             )
#           ),
#           fluidRow(
#             column(4,
#                   tags$h2("Sectores CIIU", style = "text-align: center;"),
#                   plotOutput("CIIU_plot")
#                 ),
#             column(4,
#                    tags$h2("Denominaciones CUOC", style = "text-align: center;"),
#                    plotOutput("CUOC_plot")   
#                    ),
#             column(4,
#                    tags$h2("Educación CINE", style = "text-align: center;"),
#                    plotOutput("CINE_plot") 
#                    )
#         )
#       )
#     ),
      # fluidRow(
      #   box(width = 12,
      #       fluidRow(
      #         tags$h1("Estadísticas Descriptivas por Área de Cualificación", style = "text-align: center; font-weight: bold; color: #4682B4;"),
      #         tags$hr(style = "border-top: 4px solid black; margin-top: 5px; margin-bottom: 10px;  border-color: #D3D3D3; width: 10%;"),
      #         div(style = "height: 30px;")
      #       ),
      #       fluidRow(
      #         column(2,
      #                uiOutput("select_area_catalog_3")
      #         ),
      #         column(3,
      #                div(style = "height: 24px;"),
      #                actionButton("clear_areas_3", "Limpiar Filtros", icon = icon("eraser"),
      #                             style="color: #fff; background-color: #dc3545; border-color: #2e6da4"
      #                )
      #         )
      #       ),
      #     fluidRow(
      #       tags$h2("Área de Desempeño", style = "text-align: center; font-weight: bold; color: #4682B4;"),
      #       tags$hr(style = "border-top: 4px solid black; margin-top: 5px; margin-bottom: 10px;  border-color: #D3D3D3; width: 10%;"),
      #       div(style = "height: 10px;"),
      #       column(10, offset = 1,
      #              plotOutput("descriptivas_area")
      #              )
      #     ),
      #     fluidRow(
      #       tags$h2("Tamaño de la Empresa", style = "text-align: center; font-weight: bold; color: #4682B4;"),
      #       tags$hr(style = "border-top: 4px solid black; margin-top: 5px; margin-bottom: 10px;  border-color: #D3D3D3; width: 10%;"),
      #       div(style = "height: 10px;"),
      #       column(10, offset = 1,
      #              plotOutput("tamano_empresa")
      #       )
      #     ),
      #       div(style = "height: 10px;"),
      #       fluidRow(
      #         tags$h2("Cargos Críticos de Difícil Consecución", style = "text-align: center; font-weight: bold; color: #4682B4;"),
      #         tags$hr(style = "border-top: 4px solid black; margin-top: 5px; margin-bottom: 10px;  border-color: #D3D3D3; width: 10%;"),
      #         div(style = "height: 10px;"),
      #         column(10, offset = 1,
      #                plotOutput("dificil_consecucion")
      #         )
      #       ),
      #       fluidRow(
      #         tags$h2("Departamentos", style = "text-align: center; font-weight: bold; color: #4682B4;"),
      #         tags$hr(style = "border-top: 4px solid black; margin-top: 5px; margin-bottom: 10px;  border-color: #D3D3D3; width: 10%;"),
      #         div(style = "height: 10px;"),
      #         column(10, offset = 1,
      #                plotOutput("departamentos")
      #         )
      #       )
      #       ),
      #   box(width=12,
      #       fluidRow(
      #         tags$h1("Estadísticas Descriptivas por Área de Cualificación", style = "text-align: center; font-weight: bold; color: #4682B4;"),
      #         tags$hr(style = "border-top: 4px solid black; margin-top: 5px; margin-bottom: 10px;  border-color: #D3D3D3; width: 10%;"),
      #         div(style = "height: 30px;")
      #       ),
      #       fluidRow(
      #         column(2,
      #                uiOutput("select_area_catalog_5")
      #         )
      #       ),
      #       fluidRow(
      #         tags$h2("Medios de Búsqueda", style = "text-align: center; font-weight: bold; color: #4682B4;"),
      #         tags$hr(style = "border-top: 4px solid black; margin-top: 5px; margin-bottom: 10px;  border-color: #D3D3D3; width: 10%;"),
      #         div(style = "height: 10px;"),
      #         column(10, offset = 1,
      #                plotOutput("medios")
      #         )
      #       ),
      #       
      #       div(style = "height: 30px;"),
      #       fluidRow(
      #         tags$h2("Motivos de Búsqueda y Consecución de Vacantes", style = "text-align: center; font-weight: bold; color: #4682B4;"),
      #         tags$hr(style = "border-top: 4px solid black; margin-top: 5px; margin-bottom: 10px;  border-color: #D3D3D3; width: 10%;"),
      #         div(style = "height: 10px;"),
      #         column(10, offset = 1,
      #                plotOutput("motivosNovacante")
      #         )
      #       )
      #   )
      # ),
  fluidRow(
    div(style = "height: 30px;"),
    box(width=12,
        fluidRow(
          column(8, offset = 2,
                 tags$h1("Análisis de Competencias", style = "text-align: center; font-weight: bold; color: #4682B4;"),
                 tags$hr(style = "border-top: 4px solid black; margin-top: 5px; margin-bottom: 10px;  border-color: #D3D3D3; width: 20%;")
          )
        ),
        fluidRow(
          column(6,
                 uiOutput("select_area_catalog_2")
          )
        ),
        tags$h2("Habilidades Socioemocionales", style = "text-align: center; font-weight: bold; color: #4682B4;"),
        tags$hr(style = "border-top: 4px solid black; margin-top: 5px; margin-bottom: 10px;  border-color: #D3D3D3; width: 10%;"),
        div(style = "height: 30px;"),
        fluidRow(
          
          column(7,
                 plotOutput("socioemocionales")
                 ),
          column(4,
                 wordcloud2Output("wordcloud_habilidades")
                 )
        ),
          
        div(style = "height: 30px;"),
        fluidRow(
          tags$h2("Conocimientos CUOC", style = "text-align: center; font-weight: bold; color: #4682B4;"),
          tags$hr(style = "border-top: 4px solid black; margin-top: 5px; margin-bottom: 10px;  border-color: #D3D3D3; width: 10%;"),
          div(style = "height: 10px;"),
          column(7,
                 plotOutput("conocimientos")
                 
          ), 
          column(4,
                 wordcloud2Output("wordcloud_conocimientos")
          )
        ),
        
        div(style = "height: 30px;"),
        fluidRow(
          tags$h2("Destrezas CUOC", style = "text-align: center; font-weight: bold; color: #4682B4;"),
          tags$hr(style = "border-top: 4px solid black; margin-top: 5px; margin-bottom: 10px;  border-color: #D3D3D3; width: 10%;"),
          div(style = "height: 10px;"),
          column(7,
                 plotOutput("destrezas")
                 
          ), 
          column(4,
                 wordcloud2Output("wordcloud_destrezas")
                 )
      )
    )
  )
)

# SURVEY TAB --------------------------------------------------------------


tab_survey <- tabItem(
    tabName = "survey",
    class = "tab_survey",
    tags$style('.tab_survey {
                             background-color: #ffffff;
              }'),
    
    div(style = "height: 20px;"),
    fluidRow(
      column(8, offset = 2,
             tags$h1("Encuesta de demanda laboral",
                     style = "font-size: 45px; text-align: center; font-weight: bold; color: #4682B4;"
             ),
             tags$hr(style = "border-top: 4px solid black; margin-top: 5px; margin-bottom: 10px;  border-color: #D3D3D3; width: 20%;"),
             tags$p("En esta sección encontrará la encuesta de demanda laboral realizada a las empresas en el marco de las entrevistas semiestructuradas.",
                    style = "text-align: center; font-size: 22px;"
             )
      )
    ),
    div(style = "height: 20px;"),

    fluidRow(
      column(2,
             box(title = "Atributos de la Encuesta",
                 width = 12,
                 solidHeader = TRUE,
                 status = "warning",
                 selectizeInput("survey_variables", "Seleccione",
                                choices = c(
                                  "Información General",
                                  "Conocimientos",
                                  "Destrezas",
                                  "Programas",
                                  "Brechas",
                                  "Otros"
                                )
                 ),
                 conditionalPanel(
                   condition = "input.survey_variables == 'Información General'",
                   checkboxGroupInput("info_general", "Información General", 
                                      choices = c(
                                        "Actividad económica  principal de la empresa" = "Actividadeconómica",
                                        "Departamento" = "Departamento",
                                        "Tamaño empresa" = "tamanoEmpresa",
                                        "Código de Área" = "Código_área",
                                        "Nombre Área Cualificación" = "Nombreáreacualificación"
                                      )
                   )
                 ),
                 conditionalPanel(
                   condition = "input.survey_variables == 'Brechas'",
                   checkboxGroupInput("brechas", "Información General", 
                                      choices = c(
                                        "Brechas de Cantidad Atracción D" = "BQ__Atraccion_D",
                                        "Brechas de Pertinencia Desarticulación D" = "BP__Desarticulacion_D",
                                        "Brechas de Cantidad Deficit D" = "BQ__DeficitP_D",
                                        "Brechas de Cantidad Atracción Ocu" = "BQ__Atraccion_ocu",
                                        "Brechas de Pertinencia Desarticulación Ocu" = "BP__Desarticulacion_ocu",
                                        "Brechas de Cantidad Deficit Ocu" = "BQ__DeficitP_ocu",
                                        "Brechas de Calidad Conocimientos Ocu" = "BC__Conocimientos_D",
                                        "Brechas de Calidad Destreza D" = "BC__destreza_D",
                                        "Brechas de Pertinencia Conocimientos D" = "BP__Conocimientos_D",
                                        "Brechas de Pertinencia Destreza D" = "BP__destreza_D",
                                        "Brecha de Cantidad Programa D" = "BQ__Programa_D",
                                        "Brecha de Calidad Conocimientos Ocu" = "BC__Conocimientos_ocu",
                                        "Brecha de Calidad Destreza Ocu" = "BC__destreza_ocu",
                                        "Brecha de Calidad Conocimientos Ocu" = "BP__Conocimientos_ocu",
                                        "Brechas de Pertinencia Destreza Ocu" = "BP__destreza_ocu",
                                        "Brecha de Cantidad Programa Ocu" = "BQ__Programa_ocu",
                                        "Brecha de Cantidad Atracción Vacante D" = "BQ__Atraccion_vacanteD",
                                        "Brechas de Pertinencia experiencia Vacante D" = "BP__Experiencia_vacanteD",
                                        "Brecha de Calidad Competencia Vacante D" = "BC__Competencia_vacanteD",
                                        "Brecha de Cantidad Atracción Vacante Ocu" = "BQ__Atraccion_vacante_ocu",
                                        "Brechas de Pertinencia experiencia Vacante Ocu" = "BP__Experiencia_vacante_ocu",
                                        "Brecha de Calidad Competencia Vacante Ocu" = "BC__Competencia_vacante_ocu"
                                      )
                   )
                 ),
                 conditionalPanel(
                   condition = "input.survey_variables == 'Conocimientos'",
                   checkboxGroupInput("conocimientos", "Conocimientos", 
                                      choices = c(
                                        "Conocimiento 1" = "Conocimiento1",
                                        "Conocimiento 2" = "Conocimiento2",
                                        "Conocimiento 3" = "Conocimiento3",
                                        "Conocimiento 4" = "Conocimiento4",
                                        "Conocimiento 5" = "Conocimiento5"
                                      )
                   )
                 ),
                 conditionalPanel(
                   condition = "input.survey_variables == 'Destrezas'",
                   checkboxGroupInput("destrezas", "Destrezas", 
                                      choices = c(
                                        "Destreza 1" = "Destreza1",
                                        "Destreza 2" = "Destreza2",
                                        "Destreza 3" = "Destreza3",
                                        "Destreza 4" = "Destreza4",
                                        "Destreza 5" = "Destreza5"
                                        )
                   )
                 ),
                 conditionalPanel(
                   condition = "input.survey_variables == 'Otros'",
                   checkboxGroupInput("otros", "Otros", 
                                      choices = c(
                                        "Razones por las" = "Cuálessonlasrazonesporlas",
                                        "Nivel educativo requerido" = "Cuáleselniveleducativorequ",
                                        "Experiencia Mínima" = "CuáleslaExperienciamínimap",
                                        "Rango Salarial" = "CuáleslaExperienciamínimap",
                                        "Tipo de Contrato" = "Tipodecontrato",
                                        "Modalidad del cargo" = "Lamodalidaddelcargoes",
                                        "Rotación del cargo" = "Quétantarotacióntieneelcar",
                                        "Tiempo" = "Porfavorindiquecuántotiempo",
                                        "Cargo Difícil" = "Cargo_Dificil",
                                        "Código Ocupación CDC" = "CódigoOcupaciónCDC",
                                        "Ocupación CDC" = "OcupaciónCDC",
                                        "Área de Desempeño" = "Cuálessuáreadedesempeño",
                                        "Otra área de Desempeño" = "otherareadesempeno",
                                        "Actividad Económica" = "Actividadeconómica",
                                        "Otras Actividades Económicas" = "otheractivideconomicas",
                                        "Cargos de difícil Consecución" = "CargosDificilC",
                                        "Diseño de Programas" = "disenoprogramas",
                                        "Acción Vacante" = "accionvacante",
                                        "Medios de búsqueda" = "mediosbusqueda",
                                        "Motivos No Vacante" = "motivosNovacante",
                                        "Tiene Habilidades Emocionales" = "tienehabSocioemocionales",
                                        "Habilidades Socioemocionales" = "habSocioemocionales"
                                        )
                                      )
                   ),
                 conditionalPanel(
                   condition = "input.survey_variables == 'Programas'",
                   checkboxGroupInput("programas", "Programas", 
                                      choices = c(
                                        "Programas son" = "ProgramasSon",
                                        "Programa 1" = "Programa1",
                                        "Programa 2" = "Programa2",
                                        "Programa 3" = "Programa3"
                                      )
                   )
                 )
                 ),
             div(class = "fluidrow_clear",
                 fluidRow(
                   column(2, offset = 2,
                          actionButton("clear_survey", "Limpiar Filtros", icon = icon("eraser"),
                                       style="color: #fff; background-color: #dc3545; border-color: #2e6da4"
                                       )
                          )
                   )
                 )
             ),
      column(
        10, 
        reactableOutput("survey_table")
        )
      ),
    fluidRow(
      column(2, offset = 6,
             downloadButton("download_survey", "Descargar Tabla",
                            style="color: #fff; background-color: #008000; border-color: #2e6da4"
                            )
             )
      )
    )


