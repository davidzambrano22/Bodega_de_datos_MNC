

tab_demandaSPE <- tabItem(
  tabName = "demandaSPE",
  class = "demandaSPE",
  tags$style('.demandaSPE {
                             background-color: #ffffff;
              }'),
  div(style = "height: 20px;"),
  fluidRow(
    column(8, offset = 2,
           tags$h1("Información Demanda SPE",
                   style = "font-size: 45px; text-align: center; font-weight: bold; color: #4682B4;"
           ),
           tags$hr(style = "border-top: 4px solid black; margin-top: 5px; margin-bottom: 10px;  border-color: #D3D3D3; width: 20%;"),
           tags$p("En esta sección podrá consultar información asociada a la demanda SPE",
                  style = "text-align: center; font-size: 22px;"
           )
    )
  ),
  div(
    style = "height: 20px;"
  ),
  fluidRow(
    column(2,
           box(title = "Atributos",
               width = 12,
               solidHeader = TRUE,
               status = "warning",
               selectizeInput("caract_OtrasFuentes_SPE", "Seleccione Base",
                              choices = c(
                                "Área de Cualificación",
                                "Información del Cargo"
                              )
               ),
               
               conditionalPanel(
                 condition = "input.caract_OtrasFuentes_SPE == 'Área de Cualificación'",
                 checkboxGroupInput("caract_OtrasFuentes_SPE_Areas_", "Seleccione Atributos", 
                                    choices = c(
                                      "Codigo Área" = "Código_área",
                                      "Nombre Área cualificación" = "Nombreáreacualificación"
                                    ),
                                    selected = c(
                                      "Código_área",
                                      "Nombre área cualificación"
                                    )
                 )
               ),
               conditionalPanel(
                 condition = "input.caract_OtrasFuentes_SPE == 'Información del Cargo'",
                 checkboxGroupInput("caract_OtrasFuentes_SPE_otros_", "Seleccione Atributos", 
                                    choices = c(
                                     "Cantidad de Vacantes" = "CantidadVacantes",
                                     "Cargo Solicitado" = "CargoSolicitado",
                                     "Año" = "Año",
                                     "Mes" = "Mes",
                                     "Dia" = "Dia",
                                     "Código del Municipio" = "cod_mpio",
                                     "Municipio" = "Municipio",
                                     "Experiencia Laboral" = "Experiencia_laboral",
                                     "Rangos Salariales" = "Rangos_salariales",
                                     "Códigos Grupos Primarios" = "CódigosGruposprimarios",
                                     "Código CIIU" = "Código_ciiu",
                                     "Nivel Educativo" = "Nivel_educativo",
                                     "Código Ocupación" = "CódigoOcupación",
                                     "Ocupación" = "Ocupación",
                                     "Código Área" = "Código_área",
                                     "Nombre Área Cualificación" = "Nombreáreacualificación"
                                    ),
                                    selected = c(
                                      "Código_área",
                                      "Nombre área cualificación"
                                    )
                 )
               )
           )
    ),
    column(10,
           reactableOutput("base_demandaSPE")
    )
  )
)