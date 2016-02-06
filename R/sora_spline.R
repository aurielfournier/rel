#' A function which makes Sora smooth splines with boot strapped confidence intervals
#'
#' 
#' @param data = a data frame with three columns, in this order, ordinal date, sora per hour and the year
#' @param spar = the smoothing parameter, defaults to .8
#' @param year = the year the data were collected
#' @keywords rails
#' @export
#' @examples
#' sora_spline()
#' Needs data with three columns, ordinal date, sora perhour and the year



sora_spline <- function(data, spar=.8, year){
  ### does the smooth spline
  sp = smooth.spline(data[,1], data[,2], spar=spar)
  ### takes the smooth spline results and puts them in a data frame
  smoothdf = data.frame(x=sp$x, y=sp$y, year=year)
  ## Bootstrapped COnfidence Interval
  B = 100
  n = nrow(data)
  boot.samples = matrix(NA,n-1, B)
  boot.smooth = as.data.frame(matrix(NA,n,2))
  boot.smooth[,1] <- smoothdf$x
  colnames(boot.smooth)[1] <- "odate"
  
  for(i in 1:100){
    r <- sample(1:nrow(data),1)
    boot.samples[,i] <- data[(-r),2]
  }
  for(i in 1:100){
    r <- sample(1:nrow(data),1)
    df <- data.frame(odate=data[(-r),1],mean=c(boot.samples[,i]))
    dfs <- smooth.spline(df$odate, df$mean, spar=spar)
    dfdf <- data.frame(odate=dfs$x, y=dfs$y)
    boot.smooth <- merge(boot.smooth, dfdf, by="odate", all.x=TRUE)
  }
  
  sorasd <- apply(boot.smooth[,2:ncol(boot.smooth)],1,sd, na.rm=TRUE)
  me = ceiling(10 * 2 * sorasd)/10
  smoothdf[1:nrow(data),"cip"] <- round(smoothdf[1:nrow(data),2], 1) + 1 * me
  smoothdf[1:nrow(smoothdf),"cin"] <- round(smoothdf[1:nrow(data),2], 1) - 1 * me
  smoothdf
}