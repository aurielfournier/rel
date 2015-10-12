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
  B = 1000
  n = nrow(data)-1
  boot.samples = matrix(NA,B, n)
  boot.smooth = matrix(NA,B,n)
  for(i in 1:1000){
    r <- sample(1:nrow(data),1)
    boot.samples[i,] <- data[(-r),2]
  }
  
  for(i in 1:1000){
    df <- data.frame(odate=data[1:nrow(data)-1,1],mean=boot.samples[i,])
    dfs <- smooth.spline(df$odate, df$mean, spar=spar)
    boot.smooth[i,] <- dfs$y
  }
  
  sorasd <- apply(boot.smooth,2,sd)
  me = ceiling(10 * 2 * sorasd)/10
  smoothdf[1:nrow(smoothdf)-1,"cip"] <- round(smoothdf[1:nrow(data)-1,2], 1) + 1 * me
  smoothdf[1:nrow(smoothdf)-1,"cin"] <- round(smoothdf[1:nrow(data)-1,2], 1) - 1 * me
  smoothdf
}