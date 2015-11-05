#' Rounds numbers into categories by dec
#'
#' This function lets you convert regular dates to ordinal ones
#' @param a number that you want to round to a dec (decimal)
#' @keywords rounding
#' @export
#' @examples
#' mround()


mround <- function(x,dec){ dec*round(x/dec) }