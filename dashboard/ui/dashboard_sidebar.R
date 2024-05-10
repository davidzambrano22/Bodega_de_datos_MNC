

dashboard_sidebar <- dashboardSidebar(
    sidebarMenu(
        id = "tabs",
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
                          )
                 ),
        menuItem("Estadísticas Áreas MNC",
                 icon = icon("pencil"), startExpanded = FALSE,
                 menuSubItem(
                   "Información General",
                   tabName = "est_area_cual"
                   ),
                 menuSubItem(
                   "Estadísticas Encuesta Demanda",
                   tabName = "est_enc_dem"
                   ),
                 menuSubItem(
                   "Análisis de compentencias",
                   tabName = "analisis_competencias"
                   )
                 )
        )
    )
