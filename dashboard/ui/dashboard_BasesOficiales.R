

tab_BasesOficiales <- tabItem(
  tabName = "bases_oficiales",
  class = "bases_oficiales",
  tags$style('.bases_oficiales {
                             background-color: #ffffff;
              }'),
  div(style = "height: 20px;"),
  fluidRow(
    
    column(8, offset = 2,
           tags$h1("Bases de Datos Oficiales",
                   style = "font-size: 45px; text-align: center; font-weight: bold; color: #4682B4;"
           ),
           tags$hr(style = "border-top: 4px solid black; margin-top: 5px; margin-bottom: 10px;  border-color: #D3D3D3; width: 20%;"),
           tags$p("En esta sección podrá consultar información asociada a las bases de datos oficiales",
                  style = "text-align: center; font-size: 22px;"
           )
    )
  ),
  div(style = "height: 40px;"),
  
  fluidRow(
    column(2,
           box(title = "Bases de datos",
               width = 12,
               solidHeader = TRUE,
               status = "warning",
               selectizeInput("select_main_base", "Seleccione Base",
                              choices = c(
                                "Areas de Cualificación",
                                "Ocupaciones CUOC",
                                "Educación CINE",
                                "Sectores CIIU"#,
                                # "Caracterización Sector"
                              )
               ),
               
               conditionalPanel(
                 condition = "input.select_main_base == 'Areas de Cualificación'",
                 checkboxGroupInput("area_cualificacion", "Seleccione Atributos", 
                                    choices = c(
                                      "Codigo Área" = "Código_área",
                                      "Nombre área cualificación" = "Nombreáreacualificación"
                                    ),
                                    selected = c(
                                      "Código_área",
                                      "Nombreáreacualificación"
                                    )
                 )
               ),
               conditionalPanel(
                 condition = "input.select_main_base == 'Ocupaciones CUOC'",
                 checkboxGroupInput("denominacion_cuoc", "Seleccione Atributos", 
                                    choices = c(
                                      "Código Grandes Grupos" = "CódigoGrandesGrupos",
                                      "Grandes Grupos" = "GrandesGrupos",
                                      "Código Subgrupos principales" = "CódigoSubgruposprincipales",
                                      "Subgrupos principales" = "Subgruposprincipales",
                                      "Código subgrupos" = "Códigosubgrupos",
                                      "Subgrupos" = "Subgrupos",
                                      "Códigos Grupos primarios" = "CódigosGruposprimarios",
                                      "Grupos primarios" = "Gruposprimarios",
                                      "Código Ocupación" = "CódigoOcupación",
                                      "Ocupación" = "Ocupación",
                                      "Código denominaciones" = "Códigodenominaciones",
                                      "Denominacion" = "Denominacion",
                                      "Código CIUO 08 A.C." = "CódigoCIUO08AC",
                                      "Código CNO" = "CódigoCNO",
                                      "Nombre Ocupación Afín" = "NombreOcupaciónAfín",
                                      "Nombre Destreza" = "NombreDestreza", 
                                      "Nombre Conocimiento" = "NombreConocimiento",
                                      "Nivel Competencia" = "NivelCompetencia",
                                      "Descripción Ocupación" = "DescripciónOcupación",
                                      "Consecutivo Función" = "ConsecutivoFunción",
                                      "Redacción Función" = "RedacciónFunción"
                                    ),
                                    selected = c(
                                      "Código_área",
                                      "Nombre área cualificación"
                                    )
                 )
               ),
               conditionalPanel(
                 condition = "input.select_main_base == 'Educación CINE'",
                 checkboxGroupInput("cine", "Seleccione Atributos", 
                                    choices = c(
                                      "Código CINE-2011 AC" = "CódigoCINE2011AC",
                                      "Campos Detallado" = "CamposDetallado"
                                    )
                 )
               ),
               conditionalPanel(
                 condition = "input.select_main_base == 'Sectores CIIU'",
                 checkboxGroupInput("ciiu", "Seleccione Atributos", 
                                    choices = c(
                                      "Sección" = "Sección",
                                      "División" = "División",
                                      "Grupo" = "Grupo",
                                      "Código_ciiu" = "Código_ciiu",
                                      "Descripción" = "Descripción"
                                    )
                 )
               )#,
               # conditionalPanel(
               #   condition = "input.select_main_base == 'Caracterización Sector'",
               #   checkboxGroupInput("caract_sector", "Variables Caracterización Sector", 
               #                      choices = c(
               #                        "Tasa de crecimiento" = "Tasacrecimiento",
               #                        "Valor agregado" = "Valoragregado",
               #                        "Ocupados CIIU" = "OcupadosCIIU",
               #                        "Ocupados Total" = "OcupadosTotal"
               #                      )
               #   ),
               # ),
              
           ),
           div(class = "fluidrow_clear",
               fluidRow(
                 column(2, offset = 2,
                        actionButton("clear_bases", "Limpiar Filtros", icon = icon("eraser"),
                                     style="color: #fff; background-color: #dc3545; border-color: #2e6da4"
                        )
                 )
               )
           ), 
           div(
             style = "height: 200px;"
           ),
           box(title = "Descarga el Instructivo",
               width = 12,
               tags$a("Descarga el PDF", href="fichas_brechas.pdf", target="_blank", style = "font-size: 17px;")
           )
    ),
    column(10, 
           reactableOutput("main_databases")
    )
    
  ),
  fluidRow(
    column(2, offset = 6,
           downloadButton("download_csv", "Descargar Tabla",
                          style="color: #fff; background-color: #008000; border-color: #2e6da4"
           )
    )
    
  )
)