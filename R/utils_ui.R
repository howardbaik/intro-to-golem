#' Title
#'
#' @param data 
#' @param column 
#'
#' @returns
#' @export
#'
#' @examples
get_choices <- function(data, column) {
  data[[column]] |> unique() |> sort()
}