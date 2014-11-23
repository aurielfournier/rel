#' smoother spline
#'
#' wrapper for smooth_spline makes it into the format I graph from
#' @param input is melted data.frame with columns (jdate, variable and value)
#' @keywords smooth spline
#' @export
#' @examples
#' smoother()

smoother <- function(x){
  scast <- na.omit(data.frame(x$jdate, x$value))
  colnames(scast) <- c("jdate","value")
  spline = smooth.spline(scast$jdate, scast$value, spar=.6)
  smoothdf = data.frame(x=spline$x, y=spline$y)
  smoothdf
}