

tab_ConsultaPorEtapa <- tabItem(
  tabName = "ConsultaPorEtapa",
  class = "ConsultaPorEtapa",
  tags$style('.ConsultaPorEtapa {
                             background-color: #ffffff;
              }'),
  div(style = "height: 20px;"),
  fluidRow(
    
    column(8, offset = 2,
           tags$h1("Bases de Datos Oficiales",
                   style = "font-size: 45px; text-align: center; font-weight: bold; color: #4682B4;"
           ),
           tags$hr(style = "border-top: 4px solid black; margin-top: 5px; margin-bottom: 10px;  border-color: #D3D3D3; width: 20%;"),
           tags$p("En esta sección podrá consultar información asociada a las bases de datos ooficiales",
                  style = "text-align: center; font-size: 22px;"
           )
    )
  ),
  div(style = "height: 40px;")
)