#' Turns Month/Day/Year into Julian Date
#'
#' This function lets you convert regular dates to julian ones
#' @param 
#' @keywords julian date
#' @export
#' @examples

jul_con <- function(x){
  x <-   apply(x,2, as.numeric) ##this is to make sure they came in as a numeric not as a character or factor
  varmonth<-cbind(c(1:12),c(0,31,59,90,120,151,181,212,243,273,304,334))
  juldates<-data.frame(date=as.numeric())
  for(i in 1:nrow(x)) {juldates[i,1] <- varmonth[which(x[i,1]==varmonth[,1]),2]+x[i,2]
                                           
  }
  juldates     
}




