#' go from ordinal dates to readable dates in axis
#' 
#' @keywords ggplot2 
#' @export
#' @examples 
#' ggplot(data=dat, aes(x=x, y=y))+geom_point()+


scale_y_ordinaldate <- function(year){
  scale_y_continuous(label=function(y) strftime(chron(y, origin=c(month=1, day=1,year=year)), "%B %d"))
}