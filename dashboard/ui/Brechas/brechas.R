
tab_brechasCantidad <- tabItem(
  tabName = "brechas_Cantidad",
  class = "brechas_Cantidad",
  tags$style('.brechas_Cantidad {
                             background-color: #ffffff;
              }'),
  div(style = "height: 40px;"),
  fluidRow(
    column(8, offset = 2,
           tags$h1("Brechas de Cantidad",
                   style = "font-size: 45px; text-align: center; font-weight: bold; color: #4682B4;"
           ),
           tags$hr(style = "border-top: 4px solid black; margin-top: 5px; margin-bottom: 10px;  border-color: #D3D3D3; width: 20%;")
    )
  ),
  div(style = "height: 40px;"),
  fluidRow(
    column(10, offset=1,
           box(title = "Información",
               width = 12,
               solidHeader = TRUE,
               status = "primary",
               collapsible = T,
               collapsed = F,
               tags$p("Las brechas de cantidad señalan las discrepancias entre la oferta y la demanda de programas educativos y personas en el mercado laboral. Estas discrepancias pueden manifestarse en la falta de programas educativos, escaso interés en ciertos programas por parte de los individuos y la limitada capacidad del sector para atraer o retener profesionales con las competencias requeridas. El déficit de oferta de programas educativos indica una insuficiencia para satisfacer la demanda del sector productivo, generando escasez de talento capacitado. Por otro lado, el déficit de demanda por programas de formación refleja una falta de interés por parte de los individuos, posiblemente debido a la percepción de la falta de relevancia en el mercado laboral. Finalmente, la baja capacidad de atracción o retención de capital humano relevante indica dificultades del sector para atraer y retener talento, posiblemente debido a condiciones laborales desfavorables o a una falta de reconocimiento de las habilidades requeridas.", style = "font-size: 20px;"),
               div(style = "height: 10px;"),
               div(style="text-align:center;"
               ),
               style = "font-size: 18px; text-align: justify;"
           )
    )
  ),
  div(
    style = "height: 40px;"
  ),
  fluidRow(
    div( style = "font-size: 17px;",
         column(2,
                box(title = "Brechas",
                    width = 12,
                    solidHeader = TRUE,
                    status = "primary",
                    selectizeInput("brechas_calidad_input", "Seleccione Base",
                                   choices = c(
                                     "Área de Cualificación",
                                     "Caracteristicas Cargo",
                                     "Razones Brechas",
                                     "Indicadores Brechas"
                                   )
                    ),
                    
                    conditionalPanel(
                      condition = "input.brechas_calidad_input == 'Área de Cualificación'",
                      checkboxGroupInput("brechasCantidad_areaCual_", "Seleccione Atributos", 
                                         choices = c(
                                           "Codigo Área" = "Código_área",
                                           "Nombre Área cualificación" = "Nombreáreacualificación"
                                         ),
                                         selected = c(
                                           "Código_área",
                                           "Nombreáreacualificación"
                                         )
                      )
                    ),
                    conditionalPanel(
                      condition = "input.brechas_calidad_input == 'Caracteristicas Cargo'",
                      checkboxGroupInput("caract_brechasCalidad_cargo_", "Seleccione Atributos", 
                                         choices = c(
                                           "Cargo Critico",
                                           "Ocupación Misional",
                                           "Código denominaciones",
                                           "Denominacion",
                                           "Código Ocupación",
                                           "Ocupación",
                                           "Nivel Educativo",
                                           "Experiencia Minima",
                                           "Rango salario",
                                           "Otro Salario",
                                           "Tipo de contrato",
                                           "Otro Tipo Contrato",
                                           "Modalidad",
                                           "Departamento",
                                           "Tamaño Empresa"
                                         )
                      )
                    ),
                    conditionalPanel(
                      condition = "input.brechas_calidad_input == 'Razones Brechas'",
                      checkboxGroupInput("caract_calidad_razones_", "Seleccione Atributos", 
                                         choices = c(
                                           "Razon Cargo Critico",
                                           "Otra Razon Cargo Critico",
                                           "Rotación Cargo",
                                           "Tiempo cubrir vacante",
                                           "ProgramasSon",
                                           "Departamento",
                                           "Tamaño Empresa",
                                           "Diseño Programas",
                                           "Acciones para cubrir vacantes",
                                           "Medios Busqueda",
                                           "Motivos No vacantes"
                                         )
                      )
                    ),
                    conditionalPanel(
                      condition = "input.brechas_calidad_input == 'Indicadores Brechas'",
                      checkboxGroupInput("indicadores_brechas_", "Seleccione Atributos", 
                                         choices = c(
                                           "BQ__Atraccion_vacante",
                                           "BQ__Atraccion_vacante_ocu",
                                           "BQ__Programa",
                                           "BQ__Programa_ocu",
                                           "BQ__Atraccion",
                                           "BQ__DeficitP",
                                           "BQ__Atraccion_oc",
                                           "BQ__DeficitP_ocu"
                                         )
                      )
                    ),
                    div(
                      style = "height: 30px;"
                    ),
                    fluidRow(
                      column(2, offset = 1,
                             actionButton("clear_brechasCalidad", "Limpiar Filtros", icon = icon("eraser"),
                                          style="color: #fff; background-color: #333; border-color: #2e6da4; font-size: 17px;"
                             )
                      )
                    ),
                    div(
                      style = "height: 15px;"
                    ),
                    fluidRow(
                      column(2, offset = 1,
                             downloadButton("download_brechasCalidad", "Descargar Tabla",
                                            style="color: #333333; background-color: #F5F5F5; font-size: 17px;"
                             )
                      )
                    )
                ),
                box(title = "Ayuda", solidHeader = T, status = "primary", collapsible = T, collapsed = T,
                    width = 12,
                    tags$p("En el filtro, se pueden encontrar las bases y sus atributos, los cuales se podrán seleccionar, filtrar y descargar según los diferentes filtros disponibles. Esto permite a los usuarios personalizar y obtener información específica según sus necesidades particulares.",
                           style = "font-size: 17px;"),
                    tags$p("Nota: Los indicadores de brechas en general se calculan para el cargo o denominación asociada al cargo crítico de difícil consecución. Sin embargo, las variables que tienen la terminación \"ocu\" son calculadas a nivel de la ocupación. Por ejemplo BQAtracción es un indicador de brecha asociado al cargo de dificil consecución, por el contrario el BQ_Atraccion_ocu esta asociado a la brecha de la ocupación.",
                           style = "font-size: 17px;")
                ),
                box(title = "Material de Apoyo", solidHeader = T, status = "primary", collapsible = T, collapsed = T,
                    width = 12,
                    HTML("<a href='Brechas cantidad.pdf' target='_blank'> 
                        <p align: center; color: #4682B4;'>
                          PDF Brechas de Cantidad
                        </p>
                     </a>"
                    )
                )
         ),
         column(10, 
                reactableOutput("base_brechasCantidad")
         )
    )
  )
)

############################################### Brechas Cantidad ###############################################
tab_brechasCalidad <- tabItem(
  tabName = "brechasCalidad",
  class = "brechasCalidad",
  tags$style('.brechasCalidad {
                             background-color: #ffffff;
              }'),
  div(style = "height: 40px;"),
  fluidRow(
    column(8, offset = 2,
           tags$h1("Brechas de Calidad",
                   style = "font-size: 45px; text-align: center; font-weight: bold; color: #4682B4;"
           ),
           tags$hr(style = "border-top: 4px solid black; margin-top: 5px; margin-bottom: 10px;  border-color: #D3D3D3; width: 20%;")
    )
  ),
  div(style = "height: 40px;"),
  fluidRow(
    column(10, offset=1,
           box(title = "Información",
               width = 12,
               solidHeader = TRUE,
               status = "primary",
               collapsible = T,
               collapsed = F,
               tags$p("Las brechas de calidad destacan las carencias en habilidades y conocimientos, ya sean técnicos, transversales o digitales, evidenciando una falta de alineación entre las competencias adquiridas y las demandadas por el mercado laboral. Estas deficiencias pueden manifestarse como insuficiencias en habilidades transversales como comunicación o trabajo en equipo, así como en competencias técnicas específicas requeridas para roles especializados en diversos sectores.", style = "font-size: 20px;"),
               div(style = "height: 10px;"),
               div(style="text-align:center;"
               ),
               style = "font-size: 18px; text-align: justify;"
           )
    )
  ),
  div(
    style = "height: 40px;"
  ),
  fluidRow(
    div( style = "font-size: 17px;",
         column(2,
                box(title = "Brechas",
                    width = 12,
                    solidHeader = TRUE,
                    status = "primary",
                    selectizeInput("brechas_calidad_1_input", "Seleccione Base",
                                   choices = c(
                                     "Área de Cualificación",
                                     "Caracteristicas Cargo",
                                     "Razones Brechas",
                                     "Indicadores Brechas"
                                   )
                    ),
                    
                    conditionalPanel(
                      condition = "input.brechas_calidad_1_input == 'Área de Cualificación'",
                      checkboxGroupInput("brechasCantidad_areaCual_1", "Seleccione Atributos", 
                                         choices = c(
                                           "Codigo Área" = "Código_área",
                                           "Nombre Área cualificación" = "Nombreáreacualificación"
                                         ),
                                         selected = c(
                                           "Código_área",
                                           "Nombreáreacualificación"
                                         )
                      )
                    ),
                    conditionalPanel(
                      condition = "input.brechas_calidad_1_input == 'Caracteristicas Cargo'",
                      checkboxGroupInput("caract_brechasCalidad_cargo_1", "Seleccione Atributos", 
                                         choices = c(
                                           "Cargo Critico",
                                           "Ocupación Misional",
                                           "Código denominaciones",
                                           "Denominacion",
                                           "Código Ocupación",
                                           "Ocupación",
                                           "Nivel Educativo",
                                           "Experiencia Minima",
                                           "Rango salario",
                                           "Otro Salario",
                                           "Tipo de contrato",
                                           "Otro Tipo Contrato",
                                           "Modalidad",
                                           "Departamento",
                                           "Tamaño Empresa"
                                         )
                      )
                    ),
                    conditionalPanel(
                      condition = "input.brechas_calidad_1_input == 'Razones Brechas'",
                      checkboxGroupInput("caract_calidad_razones_1", "Seleccione Atributos", 
                                         choices = c(
                                           "Razon Cargo Critico",
                                           "Otra Razon Cargo Critico",
                                           "Rotación Cargo",
                                           "Tiempo cubrir vacante",
                                           "ProgramasSon",
                                           "Departamento",
                                           "Tamaño Empresa",
                                           "Diseño Programas",
                                           "Acciones para cubrir vacantes",
                                           "Medios Busqueda",
                                           "Motivos No vacantes"
                                         )
                      )
                    ),
                    conditionalPanel(
                      condition = "input.brechas_calidad_1_input == 'Indicadores Brechas'",
                      checkboxGroupInput("indicadores_brechas_1", "Seleccione Atributos", 
                                         choices = c(
                                           "BC__Competencia_vacante",
                                           "BC__Competencia_vacante_ocu",
                                           "BC__Conocimientos",
                                           "BC__destreza",
                                           "BC__Conocimientos_ocu",
                                           "BC__destreza_ocu",
                                           "BC__Calidad",
                                           "BC__Calidad_ocu"
                                         )
                      )
                    ),
                    div(
                      style = "height: 30px;"
                    ),
                    fluidRow(
                      column(2, offset = 1,
                             actionButton("clear_brechasCalidad_1", "Limpiar Filtros", icon = icon("eraser"),
                                          style="color: #fff; background-color: #333; border-color: #2e6da4; font-size: 17px;"
                             )
                      )
                    ),
                    div(
                      style = "height: 15px;"
                    ),
                    fluidRow(
                      column(2, offset = 1,
                             downloadButton("download_brechasCalidad_1", "Descargar Tabla",
                                            style="color: #333333; background-color: #F5F5F5; font-size: 17px;"
                             )
                      )
                    )
                ),
                box(title = "Ayuda", solidHeader = T, status = "primary", collapsible = T, collapsed = T,
                    width = 12,
                    tags$p("En el filtro, se pueden encontrar las bases y sus atributos, los cuales se podrán seleccionar, filtrar y descargar según los diferentes filtros disponibles. Esto permite a los usuarios personalizar y obtener información específica según sus necesidades particulares.",
                           style = "font-size: 17px;"),
                    tags$p("Nota: Los indicadores de brechas en general se calculan para el cargo o denominación asociada al cargo crítico de difícil consecución. Sin embargo, las variables que tienen la terminación \"ocu\" son calculadas a nivel de la ocupación. Por ejemplo BC__Competencia_vacante es un indicador de brecha asociado al cargo de dificil consecución, por el contrario el BC__Competencia_vacante_ocu esta asociado a la brecha de la ocupación.",
                           style = "font-size: 17px;")
                ),
                box(title = "Material de Apoyo", solidHeader = T, status = "primary", collapsible = T, collapsed = T,
                    width = 12,
                    HTML("<a href='Brechas Calidad.pdf' target='_blank'> 
                        <p align: center; color: #4682B4;'>
                          PDF Brechas Calidad
                        </p>
                     </a>"
                    )
                )
         ),
         column(10, 
                reactableOutput("base_brechasCalidad_")
         )
    )
  )
)

############################################### Brechas Pertinencia ###############################################
tab_brechasPertinencia <- tabItem(
  tabName = "brechas_pertinencia",
  class = "brechas_pertinencia",
  tags$style('.brechas_pertinencia {
                             background-color: #ffffff;
              }'),
  div(style = "height: 40px;"),
  fluidRow(
    column(8, offset = 2,
           tags$h1("Brechas de Pertinencia",
                   style = "font-size: 45px; text-align: center; font-weight: bold; color: #4682B4;"
           ),
           tags$hr(style = "border-top: 4px solid black; margin-top: 5px; margin-bottom: 10px;  border-color: #D3D3D3; width: 20%;")
    )
  ),
  div(style = "height: 40px;"),
  fluidRow(
    column(10, offset=1,
           box(title = "Información",
               width = 12,
               solidHeader = TRUE,
               status = "primary",
               collapsible = T,
               collapsed = F,
               tags$p("Las brechas de pertinencia surgen de la falta de alineación entre la oferta educativa y laboral y las demandas del sector productivo. Estas discrepancias pueden originarse durante la planificación de programas, donde la oferta educativa no coincide con las necesidades laborales, o durante la formación, donde no se enfatizan las competencias específicas requeridas por las empresas. En resumen, estas brechas evidencian una desconexión entre la educación proporcionada y las demandas reales del mercado laboral. La desarticulación entre el sector productivo y la oferta laboral y educativa refleja una falta de coordinación en la planificación de programas, mientras que la baja capacidad de anticipación ante las necesidades del mercado revela una falta de adaptabilidad a las tendencias emergentes.", style = "font-size: 20px;"),
               div(style = "height: 10px;"),
               div(style="text-align:center;"
               ),
               style = "font-size: 18px; text-align: justify;"
           )
    )
  ),
  div(
    style = "height: 40px;"
  ),
  fluidRow(
    div( style = "font-size: 17px;",
         column(2,
                box(title = "Brechas",
                    width = 12,
                    solidHeader = TRUE,
                    status = "primary",
                    selectizeInput("brechas_pertinencia_input", "Seleccione Base",
                                   choices = c(
                                     "Área de Cualificación",
                                     "Caracteristicas Cargo",
                                     "Razones Brechas",
                                     "Indicadores Brechas"
                                   )
                    ),
                    
                    conditionalPanel(
                      condition = "input.brechas_pertinencia_input == 'Área de Cualificación'",
                      checkboxGroupInput("brechasPertienencia_area", "Seleccione Atributos", 
                                         choices = c(
                                           "Codigo Área" = "Código_área",
                                           "Nombre Área cualificación" = "Nombreáreacualificación"
                                         ),
                                         selected = c(
                                           "Código_área",
                                           "Nombreáreacualificación"
                                         )
                      )
                    ),
                    conditionalPanel(
                      condition = "input.brechas_pertinencia_input == 'Caracteristicas Cargo'",
                      checkboxGroupInput("brechasPertienencia_cargo", "Seleccione Atributos", 
                                         choices = c(
                                           "Cargo Critico",
                                           "Ocupación Misional",
                                           "Código denominaciones",
                                           "Denominacion",
                                           "Código Ocupación",
                                           "Ocupación",
                                           "Nivel Educativo",
                                           "Experiencia Minima",
                                           "Rango salario",
                                           "Otro Salario",
                                           "Tipo de contrato",
                                           "Otro Tipo Contrato",
                                           "Modalidad",
                                           "Departamento",
                                           "Tamaño Empresa"
                                         )
                      )
                    ),
                    conditionalPanel(
                      condition = "input.brechas_pertinencia_input == 'Razones Brechas'",
                      checkboxGroupInput("brechasPertienencia_razones", "Seleccione Atributos", 
                                         choices = c(
                                           "Razon Cargo Critico",
                                           "Otra Razon Cargo Critico",
                                           "Rotación Cargo",
                                           "Tiempo cubrir vacante",
                                           "ProgramasSon",
                                           "Departamento",
                                           "Tamaño Empresa",
                                           "Diseño Programas",
                                           "Acciones para cubrir vacantes",
                                           "Medios Busqueda",
                                           "Motivos No vacantes"
                                         )
                      )
                    ),
                    conditionalPanel(
                      condition = "input.brechas_pertinencia_input == 'Indicadores Brechas'",
                      checkboxGroupInput("brechasPertienencia_Indicadores", "Seleccione Atributos", 
                                         choices = c(
                                           "BP__Experiencia_vacante",
                                           "BP__Experiencia_vacante_ocu",
                                           "BP__Conocimientos",
                                           "BP__destreza",
                                           "BP__Conocimientos_ocu",
                                           "BP__destreza_ocu",
                                           "BP__Desarticulacion",
                                           "BP__Desarticulacion_ocu"
                                         )
                      )
                    ),
                    div(
                      style = "height: 30px;"
                    ),
                    fluidRow(
                      column(2, offset = 1,
                             actionButton("clear_brechasPertinencia", "Limpiar Filtros", icon = icon("eraser"),
                                          style="color: #fff; background-color: #333; border-color: #2e6da4; font-size: 17px;"
                             )
                      )
                    ),
                    div(
                      style = "height: 15px;"
                    ),
                    fluidRow(
                      column(2, offset = 1,
                             downloadButton("download_base_pertinencia", "Descargar Tabla",
                                            style="color: #333333; background-color: #F5F5F5; font-size: 17px;"
                             )
                      )
                    )
                ),
                box(title = "Ayuda", solidHeader = T, status = "primary", collapsible = T, collapsed = T,
                    width = 12,
                    tags$p("En el filtro, se pueden encontrar las bases y sus atributos, los cuales se podrán seleccionar, filtrar y descargar según los diferentes filtros disponibles. Esto permite a los usuarios personalizar y obtener información específica según sus necesidades particulares.",
                           style = "font-size: 17px;"),
                    tags$p("Nota: Los indicadores de brechas en general se calculan para el cargo o denominación asociada al cargo crítico de difícil consecución. Sin embargo, las variables que tienen la terminación \"ocu\" son calculadas a nivel de la ocupación. Por ejemplo BP_destreza es un indicador de brecha asociado al cargo de dificil consecución, por el contrario el BP_destreza_ocu esta asociado a la brecha de la ocupación.",
                           style = "font-size: 17px;")
                ),
                box(title = "Material de Apoyo", solidHeader = T, status = "primary", collapsible = T, collapsed = T,
                    width = 12,
                    HTML("<a href='Brechas Pertinencia.pdf' target='_blank'> 
                        <p align: center; color: #4682B4;'>
                          PDF Brechas de Pertinencia
                        </p>
                     </a>"
                    )
                )
         ),
         column(10, 
                reactableOutput("base_brechasPertinencia")
         )
    )
  )
)