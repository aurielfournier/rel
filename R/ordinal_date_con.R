#' Turns Month/Day/Year into Ordinal Date
#'
#' This function lets you convert regular dates to ordinal ones
#' @param data.frame three columns (month/day/year)
#' @keywords ordinal date
#' @export
#' @examples
#' ordinal_date_con()


ordinal_date_con <- function(x){ ## input = month/day/year.
  x <-   apply(x,2, as.numeric) ##this is to make sure they came in as a numeric not as a character or factor
  x <- matrix(x, ncol=3)
  varmonth<-cbind(c(1:12),c(0,31,59,90,120,151,181,212,243,273,304,334))
  juldates<-data.frame(odate=as.numeric())
  for(i in 1:nrow(x)) {juldates[i,1] <- varmonth[which(x[i,1]==varmonth[,1]),2]+x[i,2]
  }
  juldates$odate     
}