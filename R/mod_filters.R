#' filters UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_filters_ui <- function(id) {
  ns <- NS(id)
  tagList(
    
    shiny::selectInput(
      inputId = ns("state"),
      label = "Select a State",
      choices = get_choices(sales_data, "STATE")
    ),
    
    shiny::selectInput(
      inputId = ns("product_line"),
      label = "Select a Product Line",
      choices = get_choices(sales_data, "PRODUCTLINE")
    ),
    
    shiny::actionButton(
      inputId = ns("apply"),
      label = "Apply"
    )
  )
}

#' filters Server Functions
#'
#' @noRd 
mod_filters_server <- function(id){
  moduleServer(id, function(input, output, session){
    ns <- session$ns
    
    rctv_data_filtered_module <- shiny::reactive({
      sales_data |>
        dplyr::filter(
          STATE == input$state,
          PRODUCTLINE == input$product_line
        )
    }) |> 
      shiny::bindEvent(input$apply)
    
    return(rctv_data_filtered_module)
    
  })
}

## To be copied in the UI
# mod_filters_ui("filters_1")

## To be copied in the server
# mod_filters_server("filters_1")
