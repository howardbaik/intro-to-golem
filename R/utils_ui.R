get_choices <- function(data, column) {
  data[[column]] |> unique() |> sort()
}