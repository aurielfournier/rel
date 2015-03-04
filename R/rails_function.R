#' A Rails Function
#'
#' This function allows you to express your love of rails.
#' @param love Do you love rails? Defaults to TRUE.
#' @keywords rails
#' @export
#' @examples
#' rails_function()


rail_function <- function(love=TRUE){
  if(love==TRUE){
    print("I love rails!")
  }
  else {
    print("I am not a cool person.")
  }
}
