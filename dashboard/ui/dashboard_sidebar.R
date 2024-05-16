

dashboard_sidebar <- dashboardSidebar(
    width = 276,
    sidebarMenu(
        id = "Sidebar",
        menuItem("Inicio",
            tabName = "home", icon = icon("home")),
        menuItem("Áreas de Cualificación",
            tabName = "catalogo", icon = icon("book")),
        menuItem("Bases de Datos Oficiales",
                 tabName = "bases_oficiales", icon = icon("cloud")),
        menuItem("Información por Etapas MNC",
            icon = icon("bar-chart"), startExpanded = FALSE,
                menuItem(
                    "Contextualización Sector",
                    tabName = "tasa_ocupados",
                    menuSubItem("Ocupados Departamentos", tabName = "tasa_ocupados"),
                    menuSubItem("Ocupados Sectores", tabName = "ocupados_ciiu"),
                    menuSubItem("Ocupados Edad y Sexo", tabName = "ocupados_edadSexo"),
                    menuSubItem("Ocupados Nivel Educativo", tabName = "ocupados_NivelEdu")
                    )
        ),
        menuItem("Otras Fuentes de Información",
                 icon = icon("question-circle"), startExpanded = FALSE,
                 menuSubItem("Información Demanda SPE",
                          tabName = "demandaSPE"
                          ),
                 menuSubItem("Oferta SNIES",
                             tabName = "info_snies"
                             )
                 ),
        menuItem("Estadísticas Áreas MNC",
                 icon = icon("pencil"), startExpanded = FALSE,
                 menuItem(
                   "Información General",
                   menuSubItem(
                     "Áreas de Cualificación",
                     tabName = "est_area_cual"
                   ),
                   menuSubItem(
                     "Áreas de Desempeño",
                     tabName = "est_areasDesempeño"
                   ),
                   menuSubItem(
                     "Departamentos"
                   ),
                   menuSubItem(
                     "Tamaño de la Empresa"
                   )
                 ),
                 menuItem(
                   "Estadísticas Encuesta Demanda",
                   menuSubItem(
                     "Departamentos",
                     tabName = "est_enc_dem"
                   ),
                   menuSubItem(
                     "Tamaño de la empresa"
                   ),
                   menuSubItem(
                     ""
                   )
                   ),
                 menuSubItem(
                   "Análisis de compentencias",
                   tabName = "analisis_competencias"
                   )
                 )
        )
)
